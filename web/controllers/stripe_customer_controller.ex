defmodule CodeCorps.StripeCustomerController do
  use CodeCorps.Web, :controller
  use JaResource

  alias CodeCorps.StripeCustomer

  plug :load_and_authorize_changeset, model: StripeCustomer, only: [:create]
  plug JaResource

  def handle_create(conn, attributes) do
    attributes |> IO.inspect(pretty: true)

    attributes
    |> Stripe.Customer.create
    |> handle_stripe_response(attributes, conn)
  end

  defp handle_stripe_response({:ok, stripe_response}, attributes, _conn) do
    attrs =
    stripe_response
    |> Map.from_struct # TODO: Move to adapter
    |> Map.take([:currency, :delinquent, :id]) # TODO: Move to adapter
    |> keys_to_string
    |> CodeCorps.Stripe.Adapters.StripeCustomer.params_from_stripe
    |> Map.merge(attributes)

    attrs |> IO.inspect

    attrs |> create_record
  end

  defp handle_stripe_response({:error, _reason}, _, conn), do: conn

  defp create_record(attributes) do
    %StripeCustomer{} |> StripeCustomer.create_changeset(attributes) |> Repo.insert
  end

  defp keys_to_string(map) do
    for {key, val} <- map, into: %{} do
      cond do
        is_atom(key) -> {Atom.to_string(key), val}
        true -> {key, val}
      end
    end
  end
end

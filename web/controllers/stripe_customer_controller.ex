defmodule CodeCorps.StripeCustomerController do
  use CodeCorps.Web, :controller
  use JaResource

  alias CodeCorps.StripeCustomer

  plug :load_and_authorize_changeset, model: StripeCustomer, only: [:create]
  plug JaResource

  def handle_create(conn, attributes) do
    attributes
    |> Stripe.Customer.create
    |> handle_stripe_response(attributes, conn)
  end

  defp handle_stripe_response({:ok, stripe_response}, attributes, conn) do
    stripe_response
    |> CodeCorps.Stripe.Adapters.StripeCustomer.params_from_stripe
    |> Map.merge(attributes)
    |> create_record
  end

  defp handle_stripe_response({:error, %Stripe.APIError{}}, _, conn) do
    conn
    |> put_status(500)
    |> render(CodeCorps.ErrorView, "500.json-api")
  end

  defp create_record(attributes) do
    %StripeCustomer{}
    |> StripeCustomer.create_changeset(attributes)
    |> Repo.insert
  end
end

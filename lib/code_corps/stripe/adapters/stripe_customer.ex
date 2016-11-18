defmodule CodeCorps.Stripe.Adapters.StripeCustomer do
  import CodeCorps.MapUtils, only: [rename: 3, keys_to_string: 1]

  def params_from_stripe(%Stripe.Customer{} = customer) do
    customer
    |> Map.from_struct
    |> Map.take([:created, :currency, :delinquent, :id, :email])
    |> rename(:id, :id_from_stripe)
    |> keys_to_string
  end
end

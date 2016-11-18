defmodule CodeCorps.Stripe.InMemory do
  defmodule Customer do
    def create(map) do
      {:ok, do_create(map)}
    end

    defp do_create(_) do
      %Stripe.Customer{
        id: "cus_9aMOFmqy1esIRE",
        account_balance: 0,
        created: 1479472835,
        currency: "usd",
        default_source: nil,
        delinquent: false,
        description: nil,
        discount: nil,
        email: "mail@test.com",
        livemode: false,
        metadata: %{},
        shipping: nil,
        sources: %{
          object: "list",
          data: [],
          has_more: false,
          total_count: 0,
          url: "/v1/customers/cus_9aMOFmqy1esIRE/sources"
        },
        subscriptions: %{
          object: "list",
          data: [],
          has_more: false,
          total_count: 0,
          url: "/v1/customers/cus_9aMOFmqy1esIRE/subscriptions"
        }
      }
    end
  end
end

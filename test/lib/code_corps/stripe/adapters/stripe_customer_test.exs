defmodule CodeCorps.Stripe.Adapters.StripeCustomerTest do
  use ExUnit.Case, async: true

  import CodeCorps.Stripe.Adapters.StripeCustomer, only: [params_from_stripe: 1]

  @stripe_customer %Stripe.Customer{
    id: "cus_9aMOFmqy1esIRE",
    account_balance: 0,
    created: 1479472835,
    currency: "usd",
    default_source: nil,
    delinquent: false,
    description: nil,
    discount: nil,
    email: "mail@stripe.com",
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

  @local_map %{
    "id_from_stripe" => "cus_9aMOFmqy1esIRE",
    "created" => 1479472835,
    "currency" => "usd",
    "delinquent" => false,
    "email" => "mail@stripe.com"
  }

  describe "params_from_stripe/1" do
    test "converts from stripe map to local properly" do
      assert @stripe_customer |> params_from_stripe == @local_map
    end
  end
end

defmodule CodeCorps.StripeCustomerViewTest do
  use CodeCorps.ConnCase, async: true

  import Phoenix.View, only: [render: 3]

  test "renders all attributes and relationships properly" do
    user = insert(:user)
    stripe_customer = insert(:stripe_customer, id_from_stripe: "some_id", email: "email", user: user)

    rendered_json =  render(CodeCorps.StripeCustomerView, "show.json-api", data: stripe_customer)

    expected_json = %{
      "data" => %{
        "attributes" => %{
          "email" => stripe_customer.email,
        },
        "id" => stripe_customer.id |> Integer.to_string,
        "relationships" => %{
          "user" => %{
            "data" => %{"id" => user.id |> Integer.to_string, "type" => "user"}
          }
        },
        "type" => "stripe-customer",
      },
      "jsonapi" => %{
        "version" => "1.0"
      }
    }

    assert rendered_json == expected_json
  end
end

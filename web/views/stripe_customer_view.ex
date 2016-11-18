defmodule CodeCorps.StripeCustomerView do
  use CodeCorps.PreloadHelpers, default_preloads: [:user]
  use CodeCorps.Web, :view
  use JaSerializer.PhoenixView

  attributes [:email]

  has_one :user, serializer: CodeCorps.UserView
end

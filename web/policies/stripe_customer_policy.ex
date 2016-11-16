defmodule CodeCorps.StripeCustomerPolicy do
  import CodeCorps.Helpers.Policy

  alias CodeCorps.StripeCustomer
  alias CodeCorps.User
  alias Ecto.Changeset

  def show?(%User{admin: true}, %StripeCustomer{}), do: true
  def show?(%User{} = user, %User{} = current_user, %StripeCustomer{} = stripe_customer), do: stripe_customer.id == current_user.id
  def show?(%User{}, %StripeCustomer{}), do: false
end

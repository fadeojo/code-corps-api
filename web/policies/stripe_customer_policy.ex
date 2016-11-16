defmodule CodeCorps.StripeCustomerPolicy do
  import CodeCorps.Helpers.Policy

  alias CodeCorps.StripeCustomer
  alias CodeCorps.User
  alias Ecto.Changeset

  def show?(%User{admin: true}, %StripeCustomer{}), do: true
  def show?(%User{id: current_user_id}, %StripeCustomer{user_id: user_id}), do: current_user_id == user_id
  def show?(%User{}, %StripeCustomer{}), do: false
end

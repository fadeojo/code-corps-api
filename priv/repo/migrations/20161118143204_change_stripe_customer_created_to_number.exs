defmodule CodeCorps.Repo.Migrations.ChangeStripeCustomerCreatedToNumber do
  use Ecto.Migration

  def up do
    alter table(:stripe_customers) do
      remove :created
      add :created, :integer
    end
  end

  def down do
    alter table(:stripe_customers) do
      remove :created
      add :created, :datetime
    end
  end
end

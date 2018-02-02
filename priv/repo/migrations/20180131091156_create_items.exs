defmodule ImbaApp.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :uid, :string
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:items, [:product_id])
  end
end

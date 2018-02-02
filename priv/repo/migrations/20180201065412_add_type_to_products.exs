defmodule ImbaApp.Repo.Migrations.AddTypeToProducts do
  use Ecto.Migration

  def change do
    alter table("products") do
      add :type, :string, null: false
    end

    create index(:products, [:type])
  end
end

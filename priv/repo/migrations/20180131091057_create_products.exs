defmodule ImbaApp.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :ean, :string

      timestamps()
    end

  end
end

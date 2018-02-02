defmodule ImbaApp.Goods.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias ImbaApp.Goods.Product


  schema "products" do
    field :ean, :string
    field :name, :string
    field :type, :string

    has_many :items, ImbaApp.Goods.Item

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name, :ean, :type])
    |> validate_required([:name, :ean, :type])
  end
end

defmodule ImbaApp.Goods.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias ImbaApp.Goods.Item


  schema "items" do
    field :uid, :string
    # field :product_id, :id

    belongs_to :product, ImbaApp.Goods.Product

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:uid, :product_id])
    |> validate_required([:uid, :product_id])
  end
end

defmodule ImbaAppWeb.Schema.ProductTypes do
  use Absinthe.Schema.Notation

  alias ImbaAppWeb.Resolvers

  enum :product_type do
    value :figure, as: "Figure"
    value :game, as: "Game"
  end

  input_object :product_input do
    field :name, non_null(:string)
    field :ean, non_null(:string)
    field :type, non_null(:product_type)
  end

  object :product do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :ean, non_null(:string)
    field :type, non_null(:product_type)

    field :items, list_of(:item) do
      resolve &Resolvers.Goods.list_items/3
    end
  end
end

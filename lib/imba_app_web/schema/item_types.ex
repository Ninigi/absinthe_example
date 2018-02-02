defmodule ImbaAppWeb.Schema.ItemTypes do
  use Absinthe.Schema.Notation

  object :item do
    field :id, non_null(:id)
    field :uid, non_null(:string)
    field :product_id, non_null(:id)

    field :product, :product do
      resolve &ImbaAppWeb.Resolvers.Goods.get_product!/3
    end
  end
end

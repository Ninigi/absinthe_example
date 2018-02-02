defmodule ImbaAppWeb.Schema do
  use Absinthe.Schema

  alias ImbaAppWeb.Resolvers

  import_types Absinthe.Type.Custom
  import_types ImbaAppWeb.Schema.ProductTypes
  import_types ImbaAppWeb.Schema.ItemTypes

  query do
    @desc "Get all products"
    field :products, list_of(:product) do
      resolve &Resolvers.Goods.list_products/3
    end

    @desc "Get an item"
    field :item, :item do
      arg :id, non_null(:id)
      resolve &Resolvers.Goods.get_item!/3
    end

    @desc "Get all items"
    field :items, list_of(:item) do
      resolve &Resolvers.Goods.list_items/3
    end
  end

  mutation do
    @desc "Create a product (duh)"
    field :create_product, :product do
      arg :name, non_null(:string)
      arg :ean, non_null(:string)
      arg :type, non_null(:product_type)

      resolve &Resolvers.Goods.create_product/3
    end

    @desc "Create an item (duh)"
    field :create_item, :item do
      arg :uid, non_null(:string)
      arg :product_id, non_null(:id)

      resolve &Resolvers.Goods.create_item/3
    end

    @desc "Create an item together with its product"
    field :create_item_with_product, :item do
      arg :uid, non_null(:string)
      arg :product, non_null(:product_input)

      resolve &Resolvers.Goods.create_item/3
    end
  end
end

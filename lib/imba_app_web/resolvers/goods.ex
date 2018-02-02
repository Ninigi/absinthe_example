defmodule ImbaAppWeb.Resolvers.Goods do
  alias ImbaApp.Goods

  # Product
  def get_product!(%Goods.Item{} = item, _args, _resolution) do
    {:ok, Goods.get_product!(item.product_id)}
  end

  def list_products(_root, _args, _resolution) do
    {:ok, Goods.list_products()}
  end

  def create_product(_root, args, _resolution) do
    args |> Goods.create_product()
  end

  # Item
  def get_item!(_root, %{id: id}, _resolution) do
    {:ok, Goods.get_item!(id)}
  end

  def list_items(%Goods.Product{} = product, _args, _resolution) do
    {:ok, Goods.list_items(product)}
  end
  def list_items(_root, _args, _resolution) do
    {:ok, Goods.list_items()}
  end

  def create_item(_root, %{product: _} = args, _resolution) do
    {product_args, args} = args |> Map.pop(:product)

    ImbaApp.Repo.transaction(fn ->
      do_create_item_with_product(product_args, args)
    end)
  end
  def create_item(_root, args, _resolution) do
    require IEx
    IEx.pry()
    args |> Goods.create_item()
  end

  defp do_create_item_with_product(product_args, args) do
    with {:ok, product} <- Goods.create_product(product_args),
         {:ok, item}    <- Map.put(args, :product_id, product.id) |> Goods.create_item(),
         do: item
  end
end

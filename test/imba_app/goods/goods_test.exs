defmodule ImbaApp.GoodsTest do
  use ImbaApp.DataCase

  alias ImbaApp.Goods

  describe "products" do
    alias ImbaApp.Goods.Product

    @valid_attrs %{ean: "some ean", name: "some name"}
    @update_attrs %{ean: "some updated ean", name: "some updated name"}
    @invalid_attrs %{ean: nil, name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Goods.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Goods.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Goods.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Goods.create_product(@valid_attrs)
      assert product.ean == "some ean"
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Goods.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Goods.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.ean == "some updated ean"
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Goods.update_product(product, @invalid_attrs)
      assert product == Goods.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Goods.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Goods.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Goods.change_product(product)
    end
  end

  describe "items" do
    alias ImbaApp.Goods.Item

    @valid_attrs %{uid: "some uid"}
    @update_attrs %{uid: "some updated uid"}
    @invalid_attrs %{uid: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Goods.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Goods.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Goods.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Goods.create_item(@valid_attrs)
      assert item.uid == "some uid"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Goods.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Goods.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.uid == "some updated uid"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Goods.update_item(item, @invalid_attrs)
      assert item == Goods.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Goods.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Goods.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Goods.change_item(item)
    end
  end
end

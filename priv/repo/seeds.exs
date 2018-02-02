alias ImbaApp.Goods

{:ok, product1} = Goods.create_product(%{ean: "1234", name: "A Figure", type: "Figure"})
{:ok, product2} = Goods.create_product(%{ean: "4567", name: "A Game", type: "Game"})

Goods.create_item(%{product_id: product1.id, uid: "#{product1.ean}-1"})
Goods.create_item(%{product_id: product1.id, uid: "#{product1.ean}-2"})
Goods.create_item(%{product_id: product2.id, uid: "#{product2.ean}-1"})

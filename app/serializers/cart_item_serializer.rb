class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product

  def product
    ProductSerializer.new(object.product).attributes
  end
end

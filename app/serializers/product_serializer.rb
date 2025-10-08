class ProductSerializer < ActiveModel::Serializer
  attributes :product_id, :rating, :product_name, :category, :price, :is_sale,
             :release_date, :available_qty, :image_url, :is_new

  def product_id
    object.id
  end

  def category
    object.category.name
  end

  def is_new
    object.is_new?
  end

  def image_url
    object.image_url
  end
end

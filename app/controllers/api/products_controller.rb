module Api
  class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @products = Product.includes(:category).all

      # Filter by category if provided
      @products = @products.by_category(params[:category]) if params[:category].present?

      # Sort by price if provided
      @products = @products.sort_by_price(params[:sort]) if params[:sort].present?

      render json: @products, each_serializer: ProductSerializer
    end

    def show
      @product = Product.find(params[:id])
      render json: @product, serializer: ProductSerializer
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Product not found' }, status: :not_found
    end
  end
end

module Api
  class CartItemsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_session_id

    def index
      @cart_items = CartItem.includes(product: :category).where(session_id: @session_id)
      render json: @cart_items, each_serializer: CartItemSerializer
    end

    def create
      @product = Product.find(params[:product_id])
      @cart_item = CartItem.find_or_initialize_by(
        session_id: @session_id,
        product_id: @product.id
      )

      if @cart_item.new_record?
        @cart_item.quantity = params[:quantity] || 1
      else
        @cart_item.quantity += (params[:quantity] || 1).to_i
      end

      if @cart_item.save
        render json: @cart_item, serializer: CartItemSerializer, status: :created
      else
        render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Product not found' }, status: :not_found
    end

    def update
      @cart_item = CartItem.find_by!(id: params[:id], session_id: @session_id)

      if @cart_item.update(quantity: params[:quantity])
        render json: @cart_item, serializer: CartItemSerializer
      else
        render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Cart item not found' }, status: :not_found
    end

    def destroy
      @cart_item = CartItem.find_by!(id: params[:id], session_id: @session_id)
      @cart_item.destroy
      head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Cart item not found' }, status: :not_found
    end

    private

    def set_session_id
      @session_id = request.headers['X-Session-ID'] || session.id
    end
  end
end

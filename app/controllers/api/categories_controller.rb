module Api
  class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @categories = Category.all
      render json: @categories, each_serializer: CategorySerializer
    end
  end
end

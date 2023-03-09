class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all()
    @products = Product.order(category_id: :desc)
  end
end

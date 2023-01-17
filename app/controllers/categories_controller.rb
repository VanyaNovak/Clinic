class CategoriesController < BaseController
  def index
    @categories = Category.all.includes(:doctors)
  end
end

class CategoriesController < HomeController
  def index
    @categories = Category.all.includes(:doctors)
  end
end

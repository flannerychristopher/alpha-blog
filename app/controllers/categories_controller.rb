class CategoriesController < ApplicationController
  include ApplicationHelper

  before_action :require_user, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category has been created!'
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(
                            page: params[:page], 
                            per_page: 5
                          )
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

end

class CategoriesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_category, only: [:update, :show, :destroy]

  def index
    @categories = Category.all
    json_response(@categories)
  end

  def create
    @category = Category.create!(category_params)
    json_response(@category)
  end

  def show
    json_response(@category)
  end

  def update
    @category.update(category_params)
    json_response(@category)
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end

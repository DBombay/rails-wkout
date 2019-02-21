class CategoryController < ApplicationController
  before_action :set_sub_category, only: [:update, :show, :destroy]

  def index
    @sub_categories = Category.all
    json_response(@sub_categories)
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
    head :no_content
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

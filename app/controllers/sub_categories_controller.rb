class SubCategoriesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_sub_category, only: [:update, :show, :destroy]
  def index
    json_response(SubCategory.all)
  end

  def create
    @sub_category = SubCategory.create!(sub_category_params)
    json_response(@sub_category)
  end

  def show
    json_response(@sub_category)
  end

  def update
    @sub_category.update(sub_category_params)
    head :no_content
  end

  def destroy
    @sub_category.destroy
    head :no_content
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name, :description, :category_id)
  end

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end
end

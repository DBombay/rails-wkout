class ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_product, only: [:update, :show, :destroy]

  def index
    @products = Product.all
    json_response(@products)
  end

  def create
    @product = Product.new(product_params)
    @product.category = Category.find(product_params[:category_id])
    @product.sub_category = SubCategory.find(product_params[:sub_category_id])
    @product.save
    json_response(@product)
  end

  def show
    json_response(@product)
  end

  def update
    @product.update(product_params)
    json_response(@product)
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    params.require(:product).permit(
        :name,
        :description,
        :price,
        :sale_price,
        :active,
        :on_sale,
        :product_image,
        :category_id,
        :sub_category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

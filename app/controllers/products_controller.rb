class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :show, :destroy]

  def index
    @products = Product.all
    json_response(@products)
  end

  def create
    @product = Product.create!(product_params)
    json_response(@product)
  end

  def show
    json_response(@product)
  end

  def update
    @product.update(product_params)
    head :no_content
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

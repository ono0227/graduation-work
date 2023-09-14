class Potepan::ProductsController < ApplicationController
  MAXINUM_VALUE_PRODUCT = 4
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.includes(master: [:images, :default_price]).limit(MAXINUM_VALUE_PRODUCT)
  end
end

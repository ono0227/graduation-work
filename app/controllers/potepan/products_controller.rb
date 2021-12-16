class Potepan::ProductsController < ApplicationController
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = Spree::Product.in_taxons(@product.taxons).includes(master: [:images, :default_price]).distinct.where.not(id: @product.id).limit(4)
  end
end

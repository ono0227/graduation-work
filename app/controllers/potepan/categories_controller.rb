class Potepan::CategoriesController < ApplicationController
  def show
    @taxonomies = Spree::Taxon.roots
    @taxon = Spree::Taxon.find(params[:id])
    @taxon_products = Spree::Product.in_taxon(@taxon).includes(master: [:images, :default_price])
  end
end

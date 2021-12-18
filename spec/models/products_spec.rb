require 'rails_helper'

RSpec.describe "Potepan::Models", type: :model do
  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create(:taxon, taxonomy[:taxonomy]) }
  let(:unrelated_taxon) { create(:taxon, taxonomy[:taxonomy]) }
  let(:product) { create(:product, taxons: [taxon]) }

  describe "related_products" do
    let(:related_products) { create_list(:product, 4, taxons: [taxon]) }
    let(:unrelated_product) { create(:product, taxons: [unrelated_taxon]) }

    it "関連商品を取得できること" do
      expect(product.related_products).to eq related_products
    end

    it "関連商品を重複せず、取得できること" do
      expect(product.related_products).to eq related_products.uniq
    end

    it "関連しない商品は取得されないこと" do
      expect(product.related_products).not_to eq unrelated_product
    end

    it "メインの商品が関連商品として取得されないこと" do
      expect(product.related_products).not_to eq product
    end
  end
end

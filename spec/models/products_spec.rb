require 'rails_helper'

RSpec.describe "Potepan::Models", type: :model do
  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create(:taxon, taxonomy[:taxonomy]) }
  let(:product) { create(:product, taxons: [taxon]) }
  let(:related_products) { create_list(:product, 4, taxons: [taxon]) }

  it "関連商品を取得できること" do
    expect(product.related_products).to eq related_products
  end

  it "関連商品を重複せず、取得できること" do
    expect(product.related_products).to eq related_products.uniq
  end
end

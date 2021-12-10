require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  let(:product) { create(:product, taxons:[taxon]) }
  let(:taxon) {create(:taxon)}

  describe "Get /potepan/products/:id" do
    it '商品詳細画面の表示に成功すること' do
      get potepan_product_path(product.id)
      expect(response).to have_http_status(200)
    end
  end
end

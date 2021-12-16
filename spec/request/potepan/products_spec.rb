require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:taxon) { create(:taxon, taxonomy: taxonomy) }
  let(:taxonomy) { create(:taxonomy) }
  let(:image) { create(:image) }
  let(:related_products) { create_list(:product, 4, taxons: [taxon]) }

  describe "Get /potepan/products/:id" do
    before do
      get potepan_product_path(product.id)
    end

    it '商品詳細画面の表示に成功すること' do
      expect(response).to have_http_status(200)
    end

    it '関連商品を取得し表示できること' do
      within('.productBox') do
        related_products[0..3].all? do |related_product|
          expect(response.body).to include related_product.name
          expect(response.body).to include related_product.display_price.to_s
          expect(response.body).to include('#{related_product.id}-img')
        end
        expect(response.body).not_to include related_products.forth.name
        expect(response.body).not_to include related_products.forth.display_price.to_s
        expect(response.body).not_to include('#{related_product[4].id}-img')
      end
    end
  end
end

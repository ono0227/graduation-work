require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  let(:product) { create(:product) }

  before do
    get potepan_product_path(product.id)
  end

  describe "Get /potepan/products/:id" do
    it 'リクエストが成功すること' do
      expect(response).to have_http_status(:success)
    end

    it "productの名前/説明文/値段を取得、表示できること" do
      expect(response.body).to include product.name
      expect(response.body).to include product.description
      expect(response.body).to include product.display_price.to_s
    end
  end
end

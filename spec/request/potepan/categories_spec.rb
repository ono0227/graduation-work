require 'rails_helper'

RSpec.describe "Potepan::Categories", type: :request do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:taxon) { create(:taxon, taxonomy[:taxonomy]) }
  let(:taxonomy) { create(:taxonomy) }
  let(:image) { create(:image) }

  before do
    product.images << image
  end

  describe "Get /potepan/categories/:id" do
    it "カテゴリー一覧ページにアクセスできること" do
      get potepan_category_path(taxon.id)
      expect(response).to have_http_status(200)
    end

    it "taxonの情報を取得、表示できること" do
      get potepan_category_path(product.taxons.first.id)
      expect(response.body).to include taxon.name
    end

    it "productの情報を取得、表示できること" do
      get potepan_category_path(taxon.id)
      expect(response.body).to include product.name
    end
  end
end

require 'rails_helper'

RSpec.describe "Potepan::Categories", type: :request do
  let(:product) {create(:product, taxons:[taxon])}
  let(:taxon){create(:taxon, taxonomy[:taxonomy])}
  let(:taxonomy){create(:taxonomy)}

  describe "Get /potepan/categories/:id" do
    it "カテゴリー一覧ページにアクセスできること" do
      get potepan_category_path(taxon.id)
      expect(response).to have_http_status(200)
    end
  end
end

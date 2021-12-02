require 'rails_helper'

RSpec.feature "Potepan::Products", type: :feature do
  describe "display #show" do
    let(:product) {create(:product)}
    let(:image){create(:image)}

    background do
      product.images << image
      visit potepan_product_path(product.id)
    end

    scenario "商品画像が表示されること" do
      expect(page).to have_selector ('img, [src$="#{image.filename}"]')
    end
  end
end
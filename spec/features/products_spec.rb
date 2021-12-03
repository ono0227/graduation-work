require 'rails_helper'

RSpec.feature "Potepan::Products", type: :feature do
  let(:product) { create(:product) }
  let(:image) { create(:image) }

  background do
    product.images << image
    visit potepan_product_path(product.id)
  end

  scenario "商品情報が表示されること" do
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
    expect(page).to have_content product.description
    expect(page).to have_selector('img, [src$="#{image.filename}"]')
  end
end

require 'rails_helper'

RSpec.feature "Potepan::Products", type: :feature do
  let(:taxon){ create(:taxon) }
  let(:product) { create(:product, taxons:[taxon]) }
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

  scenario "一覧ページへ戻るをクリックするとカテゴリー一覧ページに移動する" do
    click_on '一覧ページへ戻る'
    expect(current_path).to eq potepan_category_path(taxon.id)
  end
end

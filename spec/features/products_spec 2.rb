require 'rails_helper'

RSpec.feature "Potepan::Products", type: :feature do
  let(:taxon) { create(:taxon) }
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:related_products) { create_list(:product, 5, taxons: [taxon]) }

  background do
    product.images << image
    related_products.each { |related_product| related_product.images << create(:image) }
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

  scenario "関連商品の１つをクリックすると商品詳細ページに移動する" do
    click_link related_products.first.name
    expect(current_path).to eq potepan_product_path(related_products.first.id)
  end

  scenario "関連商品を最大4つ表示できること" do
    expect(page).to have_content related_products.first.name
    expect(page).to have_content related_products.second.name
    expect(page).to have_content related_products.third.name
    expect(page).to have_content related_products.fourth.name
    expect(page).not_to have_content related_products.fifth.name
  end
end

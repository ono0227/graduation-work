require 'rails_helper'

RSpec.feature "Potepan::Categories", type: :feature do
  let(:product) { create(:product, taxons: [taxon]) }
  let(:image) { create(:image) }
  let(:taxon) { create(:taxon, taxonomy[:taxonomy]) }
  let(:taxonomy) { create(:taxonomy) }

  background do
    product.images << image
    visit potepan_category_path(taxon.id)
  end

  scenario "サブカテゴリーを選択すると、属する商品情報が表示されること" do
    within('.productBox') do
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_selector('img, [src$="#{image.filename}"]')
    end
  end

  scenario "カテゴリー一覧に表示される件数とサブカテゴリー横に表示される件数が同じであること" do
    expect(page).to have_selector('.side-nav', count: taxon.products.count)
  end

  scenario "商品を選択したら、商品詳細ページに移動すること" do
    click_on product.name
    expect(current_path).to eq potepan_product_path(product.id)
  end

  scenario "カテゴリーを選択したら、サブカテゴリーが表示される" do
    find('.side-nav').click
    expect(page).to have_content taxon.name
  end
end

require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can nagivate from the home page to the product detail page by clicking on a product" do
    # ACT
    visit root_path

    # DEBUG
    puts page.html
    # VERIFY
    #expect that it have css
    expect(page).to have_css 'article.product'
    # expect that onclick it will take me to a
    find('article.product a', match: :first).click
    expect(page).to have_css ".products-show"
    save_screenshot
  end
end


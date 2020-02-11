require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

  scenario "My Cart updates with a single item in the basket" do
    # ACT
    visit root_path
    expect(page).to have_content("My Cart (0)")
    
    # VERIFY
    click_button("Add")
    # find("button.btn-primary").click
    expect(page).to have_content("My Cart (1)")
    
    # DEBUG
    # save_screenshot
  end
end
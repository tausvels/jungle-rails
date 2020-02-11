require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do  
    
    # SETUP
    before :each do
      User.create!(
        name: 'User',
        email: 'abc@gmail.com',
        password: 'abcdef',
        password_confirmation: 'abcdef'
      )
    end
    scenario "My cart uodates with a single item in the basket after proper user authentification" do
    # ACT
    visit login_path

    # VERIFY
    fill_in'email', with:'abc@gmail.com'
    fill_in'password', with:'abcdef'

    click_button('Login')

    expect(page).to have_content('User')

    # DEBUG
    # save_screenshot
  end
end
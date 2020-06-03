require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
  User.create!(:email => "monica@email.com", :password => "password", :name => "Monica", :password_confirmation => "password")

  end
    scenario "Can login with valid email and address" do
    # ACT
    visit "/login"
    # DEBUG
    puts page.html
    # VERIFY
    expect(page).to have_css 'main.container'
    fill_in 'email', with: "monica@email.com"
    fill_in 'password', with: "password"
    click_button "Submit"
    expect(page).to have_content('Monica')
    save_screenshot
  end
end

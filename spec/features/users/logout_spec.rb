require 'rails_helper'

describe "Logging out" do
  before :each do
    @user = User.create!(full_name: "David Hardy", email_address: "dfh123@gmail.com", password: "password")
  end
  describe "When I am Logged in and visiting users index" do
    it "I click Log out, back to users index, log in is visible, log out is not" do

      visit login_path

      fill_in :email_address, with: @user.email_address
      fill_in :password, with: @user.password

      click_button "Log Me In!"

      visit users_path

      within(".links") do
        click_on "Log Out"
      end
      expect(current_path).to eq(users_path)
      expect(page).to have_link("Log In")
      expect(page).to_not have_link("Log Out")
    end
  end
end

require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/secret' and am not logged in" do
    it "I am returned to the login path ('/login')" do

      visit secret_path

      expect(current_path).to eq(login_path)
    end
  end
  describe "when I visit secret path and am logged in" do
    it "I can visit secret path" do
      @user = User.create!(full_name: "Arya Stark", email_address: "as123@gmail.com", password: "as123password")

      visit login_path

      fill_in :email_address, with: @user.email_address
      fill_in :password, with: @user.password

      click_button "Log Me In!"

      visit secret_path

      expect(current_path).to eq(secret_path)
      expect(page).to have_content("This page is secret, you should not see this")
    end
  end
end

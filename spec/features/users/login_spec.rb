require 'rails_helper'

describe "When I visit /login" do
  before :each do
    @user = User.create!(full_name: "Arya Stark", email_address: "as123@gmail.com", password: "as123password")

    visit login_path
  end
  describe "When I fill in form and am existing user" do
    it "redirect me to users path and see a flash that i'm logged in, do not see log in link" do

      fill_in :email_address, with: @user.email_address
      fill_in :password, with: @user.password

      click_button "Log Me In!"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Welcome Arya Stark, you are logged in!")
      expect(page).to_not have_link("Log In")
    end
  end
end

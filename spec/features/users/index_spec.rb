require 'rails_helper'

RSpec.describe "Users index page" do
  before :each do
    @user_1 = User.create!(full_name: "John Snow", email_address: "js@gmail.com", password: "jspassword")
    @user_2 = User.create!(full_name: "Cercei Lannister", email_address: "cl@gmail.com", password: "clpassword")
    @user_3 = User.create!(full_name: "Arya Stark", email_address: "as@gmail.com", password: "aspassword")
  end
  describe "When I visit users path" do
    it "list of all users in the database and their name and email address" do

      visit users_path

      within(".user-info") do
        expect(page).to have_content(@user_1.full_name)
        expect(page).to have_content(@user_1.email_address)
        expect(page).to have_content(@user_2.full_name)
        expect(page).to have_content(@user_2.email_address)
        expect(page).to have_content(@user_3.full_name)
        expect(page).to have_content(@user_3.email_address)
      end
    end
  end
  describe "Click on Register User" do
    it "Fill out form, click Create User, redirect to users path, see user on page" do

      visit users_path

      within(".links") do
        click_on "Register as User"
      end
      expect(current_path).to eq(new_user_path)

      fill_in "user[full_name]", with: "Joe Swanson"
      fill_in "user[email_address]", with: "Jswan123@gmail.com"
      fill_in "user[password]", with: "jswanpassword"
      click_on "Create User"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Joe Swanson")
      expect(page).to have_content("Jswan123@gmail.com")
    end
  end
  describe "Click on Log In" do
    it "my current_path is /login" do

      visit users_path

      within(".links") do
        click_on "Log In"
      end
      expect(current_path).to eq(login_path)
    end
  end
end

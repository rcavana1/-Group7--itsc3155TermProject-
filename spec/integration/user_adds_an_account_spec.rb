require 'rails_helper.rb'

feature "User adds an account" do
    scenario "User successfully navigates to the create account page from the homepage" do
        visit root_path
        click_link "Sign in"
        expect(page).to have_content("Listing Accounts")
        click_link "New Account"
        expect(page).to have_content("New Account")
        expect(page).to have_content("Username")
        expect(page).to have_content("Password")
        expect(page).to have_content("Name")
    end
    
    scenario "User successfully creates a new account" do
        visit accounts_new_path
        expect(page).to have_content("New Account")
        fill_in "Username", with: "capybara"
        fill_in "Password", with: "password"
        fill_in "Name", with: "Capybara Test Account"
        click_button "Save Account"
        expect(page).to have_content("Show Account")
        expect(page).to have_content("Welcome, Capybara Test Account")
        expect(page).to have_content("Currently logged in as: capybara")
    end
end
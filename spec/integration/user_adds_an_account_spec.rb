require 'rails_helper.rb'

feature "User navigates to the homepage and logs in" do
    scenario "User navigates to the home page" do
        stub_omniauth
        visit root_path
        expect(page).to have_content("Welcome to budgetDYNAMITE!")
        expect(page).to have_content("Log In")
        #click_link "Log In"
        #expect(page).to have_content("Signed in as Drew Cavanaugh")
        #expect(page).to have_content("Log Out")
        #expect(page).to have_content("My Budgets")
    end
end

feature "User creates a budget from the my budgets page" do
    scenario "User creates a new budget" do
        visit budget_path
        click_link "New Budget"
        expect(page).to have_content("New Budget")
        expect(page).to have_content("Month")
        expect(page).to have_content("How much would you like to put into savings this month?")
        fill_in "Month", with: "04/20/2019"
        fill_in "How much would you like to put into savings this month?", with: "1000"
        click_button "Save Budget"
        expect(page).to have_content("Budget for month")
        expect(page).to have_content("Savings target")
        expect(page).to have_content("Current total")
        expect(page).to have_content("Actions")
        click_link "Show"
        expect(page).to have_content("Budget For: April 2019")
        expect(page).to have_content("Savings Target: $1000.00")
        expect(page).to have_content("Current Total: $0.00")
    end
end

def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: "google",
        uid: "12345678910",
        info: {
            email: "drewcav96@gmail.com",
            first_name: "Drew",
            last_name: "Cavanaugh"
        },
        credentials: {
            token: "abcdefg12345",
            refresh_token: "12345abcdefg",
            expires_at: DateTime.now,
        }
    })
end
require 'rails_helper.rb'

feature "User logs in" do
    scenario "Users successfully logs into an existing account" do
        visit welcome_path
        expect(page).to have_content("RETURNING USER")
        click_link "RETURNING USER"
        fill_in "username", with: "bbassin"
        fill_in "password", with: "12345"
        click_button "Login"
        expect(page).to have_content("Add to your Christmas List!")
    end
end

feature "User creates an account" do
	scenario " User successfully created a new account" do
		visit welcome_path
		expect(page).to have_content("SIGN UP")
		click_link "SIGN UP"
		fill_in "Email", with: "bbassin2@uncc.edu"
		fill_in "Username", with: "bbassin"
		fill_in "Password", with: "1234567"
		click_button "Create User"
	end	
end

feature "User logs out successfuly" do
	scenario "User is able to log out after signing in" do
		visit welcome_path
	    expect(page).to have_content("RETURNING USER")
	    click_link "RETURNING USER"
	    fill_in "username", with: "bbassin"
	    fill_in "password", with: "12345"
	    click_button "Login"
	    expect(page).to have_content("Add to your Christmas List!")
	    click_link "Log Out"
	    expect(page).to have_content("RETURNING USER")
	end
end


#feature "User adds a product to the christmas list" do
#	scenario "User successfully adds to the christmas list" do
#		visit welcome_path
#		expect(page).to have_content("RETURNING USER")
#		fill_in "username", with: "bbassin"
#		fill_in "password", with: "12345"
#		click_button "Login"
#		expect(page).to have_content("You are Logged In, bbassin")
		
#	end
#end
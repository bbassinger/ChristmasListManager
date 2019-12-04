require 'rails_helper.rb'

feature "User navigates to sign up" do
	scenario " User successfully navigates to the sign up page" do
		visit root_path
		expect(page).to have_content("SIGN UP")
		click_link "SIGN UP"
		expect(page).to have_content("Sign Up To Save Your Christmas Lists!")
		expect(page).to have_field("First Name")
		expect(page).to have_field("Last Name")
		expect(page).to have_field("Email")
		expect(page).to have_field("Username")
		expect(page).to have_field("Password")
	end	
end

feature "User navigate to log in" do
    scenario "Users successfully navigates to the log in page" do
        visit root_path
        expect(page).to have_content("RETURNING USER")
        click_link "RETURNING USER"
        expect(page).to have_content("Login")
        expect(page).to have_field("Username")
		expect(page).to have_field("Password")
    end
end


feature "User logs out successfuly from the list/add page" do
	scenario "User is able to log out after signing in" do
		visit new_list_path
	    expect(page).to have_content("Add to your Christmas List!")
	    click_link "Log Out"
	    expect(page).to have_content("RETURNING USER")
	    expect(page).to have_content("SIGN UP")
	end
end



feature "User recieves an error on sign up page" do
	scenario "User will recieve an error message if the passwords do not match on the sign up page" do
		visit root_path
		expect(page).to have_content("SIGN UP")
		click_link "SIGN UP"
		expect(page).to have_content("Sign Up To Save Your Christmas Lists!")
		click_button "Create User"
		expect(page).to have_content("Sign Up To Save Your Christmas Lists!")
	end
end

feature "User recieves an error on log in page" do
    scenario "User will recieve an error message if the log in information does not match" do
        visit root_path
        expect(page).to have_content("RETURNING USER")
        click_link "RETURNING USER"
        expect(page).to have_content("Login")
        fill_in "username", with: "kail"
		fill_in "password", with: "amoakon"
        click_button "Login"
        expect(page).to have_content("Username or password is invalid. Try again!")
    end
end
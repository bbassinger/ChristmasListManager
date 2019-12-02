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
		fill_in "First Name", with: "Brooke"
		fill_in "Last Name", with: "Bassinger"
		fill_in "Email", with: "bbassin2@uncc.edu"
		fill_in "Username", with: "bbassin"
		fill_in "Password", with: "1234567"
		click_button "Create User"
	end	
end

feature "User logs out successfuly from the list/add page" do
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
	    expect(page).to have_content("SIGN UP")
	end
end


feature "User navigates to their list" do	
    scenario "User successfully navigated to their christmas list" do
		visit welcome_path
		expect(page).to have_content("RETURNING USER")
        click_link "RETURNING USER"
		fill_in "username", with: "bbassin"
		fill_in "password", with: "12345"
		click_button "Login"
		expect(page).to have_content("Add to your Christmas List!")
		click_link "My List"
		expect(page).to have_content("Your Christmas list!")
	end
end

feature "User successfully logs out after mavigating to the list/show page" do 
	scenario "user is able to log out after signing in and visiting their list" do 
		visit welcome_path
		expect(page).to have_content("RETURNING USER")
        click_link "RETURNING USER"
		fill_in "username", with: "bbassin"
		fill_in "password", with: "12345"
		click_button "Login"
		expect(page).to have_content("Add to your Christmas List!")
		click_link "My List"
		expect(page).to have_content("Your Christmas list!")
		click_link "Log Out"
		expect(page).to have_content("RETURNING USER")
		expect(page).to have_content("SIGN UP")
	end
end

feature "User successfully adds a product and store to the list" do	
	scenario "User is able to add a product and store to thier list and view the item in the list" do
		
	end
end

feature "User successfully deletes an item from their list" do
	scenario "User is able to add an item to their list and them delete the item" do 
		
	end
end

feature "User cam use show to look at an item in the list" do
	scenario "User is able to navigate to their list and use the show link to look at one of their items" do
		
	end
end

feature "User successfully edits an item in their list" do
	scenario "User is able to edit an item in their list" do
		
	end
end

feature "User recieves an error on sign up page" do
	scenario "User will recieve an error message if the passwords do not match on the sign up page" do
		visit welcome_path
		expect(page).to have_content("SIGN UP")
		click_link "SIGN UP"
		expect(page).to have_content("Sign Up To Save Your Christmas Lists!")
		fill_in "First Name", with: "Brooke"
		fill_in "Last Name", with: "Bassinger"
		fill_in "Email", with: "bbassin2@uncc.edu"
		fill_in "Username", with: "bbassin"
		fill_in "Password", with: "1234567"
		fill_in "Password confirmation", with: "123456"
		click_button "Create User"
		expect(page).to have_content("Sign Up To Save Your Christmas Lists!")
	end
end

feature "User reciees an error on log in page" do
	scenario "User will recieve an error message if their username/password is not found" do
		
	end
end

	
	



	
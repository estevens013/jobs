require 'spec_helper'

describe "Users" do

  before do
    @user = User.create username: "Eward", fullname: "Ed Ward", email: "eward@fake.com", customer: "internal", admin: "yes"
  end

  describe "GET /users" do
    it "display some users" do
  
     	visit users_path
    	page.should have_content 'Eward'
      

    end
  
    it "creates a new user" do
   	  visit users_path
   	  fill_in 'user_username', :with => 'Nflanders'
   	  click_button 'Create User'

   	  current_path.should == users_path
   	  page.should have_content('Nflanders')
      
      save_and_open_page
    end
  end

  describe "PUT /users" do
    it "edits a user" do
      visit users_path
      click_link 'Edit'

      current_path.should == edit_user_path(@user)

      # page.should have_content 'Eward'
      find_field('user_username').value.should == 'Eward'

      fill_in 'user_username', :with => 'Dward'
      click_button 'Update User'

      current_path.should == users_path

      page.should have_content 'Dward'
    end
  
    it "should not update an empty user" do
      visit users_path
      click_link 'Edit'

      fill_in 'user_username', :with => ''
      click_button 'Update User'

      current_path.should == edit_user_path(@user)
      page.should have_content 'There was an error updating your User'
    end
  end

  describe "DELETE /users" do
    it "should delete an user" do
      visit users_path
      find("#user_#{@user.id}").click_link 'Delete'
      page.should have_content 'User has been deleted'
      page.should have_no_content 'Eward'
    end
  end


end

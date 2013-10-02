require 'spec_helper'

describe "Owners" do
  
  before do
    @owner = Owner.create ownername: "A. Customer"
  end

  describe "GET /owners" do
    it "display some owners" do
    	# @owner = Owner.create ownername: "A. Customer"
    	visit owners_path
    	page.should have_content 'A. Customer'
    end
  
    it "creates a new owner" do
    	visit owners_path
    	fill_in 'owner_ownername', :with => 'B. Consuming'
    	click_button 'Create Owner'

    	current_path.should == owners_path
    	page.should have_content('B. Consuming')

    	save_and_open_page
    end
  end

  describe "PUT /owners" do
    it "edits an owner" do
      visit owners_path
      click_link 'Edit'

      current_path.should == edit_owner_path(@owner)

      # page.should have_content 'A. Customer'
      find_field('owner_ownername').value.should == 'A. Customer'

      fill_in 'owner_ownername', :with => 'I.B. Updated'
      click_button 'Update Owner'

      current_path.should == owners_path

      page.should have_content 'I.B. Updated'
    end

    it "should not update an empty owner" do
      visit owners_path
      click_link 'Edit'

      fill_in 'owner_ownername', :with => ''
      click_button 'Update Owner'

      current_path.should == edit_owner_path(@owner)
      page.should have_content 'There was an error updating your Owner'
    end
  end

  describe "DELETE /owners" do
    it "should delete an owner" do
      visit owners_path
      find("#owner_#{@owner.id}").click_link 'Delete'
      page.should have_content 'Owner has been deleted'
      page.should have_no_content 'A. Customer'
    end
  end

end


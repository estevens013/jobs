require 'spec_helper'

describe "Parts" do

	before do
    @part = Part.create partNumber: "element14"
  end

  describe "GET /parts" do
    it "display some parts" do
    	visit parts_path
    	page.should have_content 'element14'
    end

    it "creates a new part" do
    	visit parts_path
    	fill_in 'part_partNumber', :with => 'element28'
    	click_button 'Create Part'

    	current_path.should == parts_path
    	page.should have_content('element28')

    	save_and_open_page
    end
  end

  describe "PUT /parts" do
    it "edits a part" do
      visit parts_path
      click_link 'Edit'

      current_path.should == edit_part_path(@part)

      find_field('part_partNumber').value.should == 'AW.some Part'

      fill_in 'part_partNumber', :with => 'Part B. Updated'
      click_button 'Update Part'

      current_path.should == parts_path

      page.should have_content 'Part B. Updated'
    end

    it "should not update an empty part" do
      visit parts_path
      click_link 'Edit'

      fill_in 'part_partNumber', :with => ''
      click_button 'Update Part'

      current_path.should == edit_part_path(@part)
      page.should have_content 'There was an error updating your Part'
  	end
	end

	describe "DELETE /parts" do
    it "should delete a part" do
      visit parts_path
      find("#part_#{@part.id}").click_link 'Delete'
      page.should have_content 'Part has been deleted'
      page.should have_no_content 'element14'
    end
  end

end

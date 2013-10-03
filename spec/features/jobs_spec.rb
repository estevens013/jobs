require 'spec_helper'

describe "Jobs" do

  before do
    @job = Job.create name: "BUBBY-003", purchaseOrder: "BUB-003", customer: "Widget", owner: "B. Widget", internalOwner: "E. Stevens", status: "In Process", modified: "2013-09-20", due: "2013-09-20"
  end

  describe "GET /jobs" do
  	it "display some jobs" do
        	  
  	  visit jobs_path
  	  page.should have_content 'BUBBY-003'
  	end

  	it "creates a new job" do
  	  visit jobs_path
  	  fill_in 'job_name', :with => 'BUBBY-004'
  	  click_button 'New Job'

  	  current_path.should == jobs_path
  	  page.should have_content('BUBBY-004')

  	  save_and_open_page
  	end
  end

  describe "PUT /jobs" do
    it "edits a job" do
      visit jobs_path
      click_link 'Edit'

      current_path.should == edit_job_path(@job)

      # page.should have_content 'BUBBY-003'
      find_field('job_name').value.should == 'BUBBY-003'

      fill_in 'job_name', :with => 'BUBBY-003-Updated'
      click_button 'Update Job'

      current_path.should == jobs_path

      page.should have_content 'BUBBY-003-Updated'
    end

    it "should not update an empty job" do
      visit jobs_path
      click_link 'Edit'

      fill_in 'job_name', :with => ''
      click_button 'Update Job'

      current_path.should == edit_job_path(@job)
      page.should have_content 'There was an error updating your Job'
    end
  end

  describe "DELETE /jobs" do
    it "should delete a job" do
      visit jobs_path
      find("#job_#{@job.id}").click_link 'Delete'
      page.should have_content 'Job has been deleted'
      page.should have_no_content 'BUBBY-003'
    end
  end

end

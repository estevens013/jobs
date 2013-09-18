require 'spec_helper'

describe "Jobs" do
  describe "GET /jobs" do
  	it "display some jobs" do
  	  visit jobs_path
  	  page.should have_content 'BUBBY-003'
  	end
  end
end

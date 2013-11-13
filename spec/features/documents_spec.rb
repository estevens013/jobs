require 'spec_helper'

describe "Documents" do
 #  t.string :documentName
 #  t.string :documentDescription
 #  t.string :documentType
 #  t.string :documentSize

	before do
    @document = Document.create documentName: "dummy.txt"
  end

  describe "GET /documents" do
    it "display some parts" do
    	visit documents_path
    	page.should have_content 'dummy.txt'
    end

    it "creates a new document" do
    	visit documents_path
    	fill_in 'document_documentName', :with => 'dummyFile.txt'
    	click_button 'Create Document'

    	current_path.should == documents_path
    	page.should have_content('dummyFile.txt')

    	save_and_open_page
    end
  end

end

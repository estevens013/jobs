require 'spec_helper'

describe "Customers" do

  before do
    @customer = Customer.create customername: "Nar Wahl, Inc."
  end

  describe "GET /customers" do
    it "display some customers" do
    	visit customers_path
    	page.should have_content 'Nar Wahl, Inc.'
    end
  
    it "creates a new customer" do
   	  visit customers_path
   	  fill_in 'customer_customername', :with => 'Freighter Freight Co.'
   	  click_button 'Create Customer'

   	  current_path.should == customers_path
   	  page.should have_content('Freighter Freight Co.')
      
      save_and_open_page
    end
  end

  describe "PUT /customers" do
    it "edits a customer" do
      visit customers_path
      click_link 'Edit'
      
      current_path.should == edit_customer_path(@customer)

      # page.should have_content 'Nar Wahl, Inc.'
      find_field('customer_customername').value.should == 'Nar Wahl, Inc.'

      fill_in 'customer_customername', :with => 'ABC Gum, Inc.'
      click_button 'Update Customer'

      current_path.should == customers_path

      page.should have_content 'ABC Gum, Inc.'
    end

    it "should not update an empty customer" do
      visit customers_path
      click_link 'Edit'

      fill_in 'customer_customername', :with => ''
      click_button 'Update Customer'

      current_path.should == edit_customer_path(@customer)
      page.should have_content 'There was an error updating your Customer'
    end
  end

  describe "DELETE /customers" do
    it "should delete a customer" do
      visit customers_path
      find("#customer_#{@customer.id}").click_link 'Delete'
      page.should have_content 'Customer has been deleted'
      page.should have_no_content 'Nar Wahl, Inc.'
    end
  end


end

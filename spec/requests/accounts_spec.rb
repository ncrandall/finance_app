require 'spec_helper'

describe "Accounts" do

  subject { page }

  describe "New Page" do
    before { visit new_account_path }

    it { should have_selector("h1", :text => "New Account") }    

    describe "with valid information" do
      let(:account) { FactoryGirl.create(:account) }
      before do
        fill_in "name",		:with => account.name
        fill_in "description",	:with => account.description
        fill_in "amount",	:with => account.amount
        click_button "Create Account"
      end
    
      it { should have_selector("h1", :text => "Account Profile - #{account.name}") }
    end

    describe "with invalid information" do
      before { click_button "Create Account" }

      it { should have_selector("#error_explanation", :text => "error") }
    end
  end
end

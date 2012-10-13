require 'spec_helper'

describe "Mortgages Page" do

  subject { page }

  describe "index page" do
    let(:mortgage) { FactoryGirl.create(:mortgage) }
    before do
      visit mortgages_path
    end


    it { should have_selector("h1", :text => "Mortgage Calculations") }
    it { should have_selector("title", :text => "Mortgages") }
    it { should have_link("Delete", :href => mortgage_path(Mortgage.first)) }

    it "decrement the count when a mortgage is deleted" do
      expect { click_link "Delete" }.to change(Mortgage, :count).by(-1)
    end
  end

  describe "new mortgage page" do
    before { visit new_mortgage_path }

    it { should have_selector("h1", :text => "New Mortgage") }

    it "should not increment count with invalid information" do
      expect { click_button "Create Mortgage" }.not_to change(Mortgage, :count)
    end

    describe "with valid information" do
      before do
        fill_in "principal",	:with => 1000
        fill_in "annual_rate",	:with => 5
        fill_in "term",		:with => 1
      end

      it "should change count by one" do
        expect { click_button "Create Mortgage" }.to change(Mortgage, :count).by(1)
      end
    end
  end
end

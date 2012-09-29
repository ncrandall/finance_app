require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    describe "visiting index page" do

      it { should have_content("Finance App") }
      it { should have_selector("title", :text => "Finance App") }
    end
  end
end

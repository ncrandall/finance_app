require 'spec_helper'

describe Account do

  before { @account = Account.new(:name => "Account1", :description => "Lorem ipsum", :amount => 55.05) }
  
  subject { @account }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:amount) }

  describe "with invalid information" do
    before do
     @account.name = ""
     @account.amount = nil
    end

    it { should_not be_valid }
  end
end

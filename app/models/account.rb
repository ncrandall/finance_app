class Account < ActiveRecord::Base
  attr_accessible :amount, :description, :name

  validates :amount, :presence => true
  validates :name, :presence => true
end

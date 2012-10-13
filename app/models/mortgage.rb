class Mortgage < ActiveRecord::Base
  attr_accessible :annual_rate, :principal, :term

  validates :annual_rate, :presence => true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
  validates :principal, :presence => true
  validates :term, :presence => true

  def monthly_payment   
    n = self.term * 12
    p = self.principal
    i = annual_rate
    j = i / (12.0 * 100.0)

    monthly = p * (j / ( 1 - ((1 + j )**-n)))
    monthly.round(2)
  end

  def amortization_table
    table = []

    remaining_principal = self.principal
    monthly = monthly_payment

    #for each month calculate interest & principal
    for i in 0..(self.term*12 - 1)

       interest = remaining_principal * (annual_rate / (12.0 * 100.0))
       equity = monthly - interest
       remaining_principal -=  equity

       table[i] = {:payment => monthly,
                   :principal => remaining_principal,
                   :interest => interest,
                   :equity => equity }
    end
    table
  end

  def amortization_table_to_string
    amortization_table.each do |record|
      puts "#{record[:principal].round(2)} -> #{record[:interest].round(2)} + #{record[:equity].round(2)} = #{record[:payment]}\n"
    end
  end
end

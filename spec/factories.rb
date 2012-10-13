FactoryGirl.define do
  factory :account do
    name	"Account1"
    description	"Lorem ipsum"
    amount	55.05
  end

  factory :mortgage do
    principal	1000
    annual_rate	10
    term	1
  end
end

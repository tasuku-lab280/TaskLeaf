FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'Rspec & Capybara & factoryBot を準備する' }
    user
  end
end
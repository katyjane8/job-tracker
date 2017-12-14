FactoryBot.define do
  factory :category do
    sequence(:title) {|n|"Silly walking#{n}"}
  end
end

FactoryBot.define do
  factory :company do
    sequence(:name) {|n|"ESPN#{n}"}
  end
end

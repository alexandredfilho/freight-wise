FactoryBot.define do
  factory :company do
    association :user, factory: :user
    association :carrier, factory: :carrier
    association :customer, factory: :customer

    name { Faker::Company.name }
  end
end

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

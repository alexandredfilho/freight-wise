FactoryBot.define do
  factory :state do
    association :city, factory: :city

    name { Faker::Address.state }
    acronym { Faker::Address.state_abbr }
  end
end

# == Schema Information
#
# Table name: states
#
#  id         :bigint           not null, primary key
#  acronym    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :state do
    name { "MyString" }
    acronym { "MyString" }
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

FactoryBot.define do
  factory :freight_charge do
    association :carrier, factory: :carrier

    table { Faker::Commerce.product_name }
  end
end

# == Schema Information
#
# Table name: freight_charges
#
#  id         :bigint           not null, primary key
#  table      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  carrier_id :bigint           not null
#
# Indexes
#
#  index_freight_charges_on_carrier_id  (carrier_id)
#
# Foreign Keys
#
#  fk_rails_...  (carrier_id => carriers.id)
#

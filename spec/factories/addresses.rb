FactoryBot.define do
  factory :address do
    street { "MyString" }
    street_details { "MyString" }
    state { nil }
    city { nil }
    zip_code { "MyString" }
    addressable { nil }
  end
end

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string           not null
#  street           :string
#  street_details   :string
#  zip_code         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint           not null
#  city_id          :bigint           not null
#  state_id         :bigint           not null
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#  index_addresses_on_city_id      (city_id)
#  index_addresses_on_state_id     (state_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (state_id => states.id)
#

FactoryBot.define do
  factory :carrier do
    association :company, factory: :company
    association :freight_charge, factory: :freight_charge

    name { Faker::Company.name }
  end
end

# == Schema Information
#
# Table name: carriers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_carriers_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

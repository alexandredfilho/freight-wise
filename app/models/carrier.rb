# frozen_string_literal: true

#
# This model is responsible to create new instances of Carriers
#
class Carrier < ApplicationRecord
  belongs_to :company
  has_many :freight_charges
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

# frozen_string_literal: true

#
# This model is responsible to create new instances of Freight Charges
#
class FreightCharge < ApplicationRecord
  belongs_to :carrier

  validates :table, presence: true, uniqueness: true
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

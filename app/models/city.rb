# frozen_string_literal: true

#
# This model is responsible to create new instances of Cities
#
class City < ApplicationRecord
  belongs_to :address
  belongs_to :state

  validates :name, presence: true
end

# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state_id   :bigint           not null
#
# Indexes
#
#  index_cities_on_state_id  (state_id)
#
# Foreign Keys
#
#  fk_rails_...  (state_id => states.id)
#

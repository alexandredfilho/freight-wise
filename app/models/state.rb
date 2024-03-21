# frozen_string_literal: true

#
# This model is responsible to create new instances of States
#
class State < ApplicationRecord
  has_many :cities

  validates :name, presence: true
  validates :acronym, presence: true
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

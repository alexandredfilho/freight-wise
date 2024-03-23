# frozen_string_literal: true

#
# This model is responsible to create new instances of States
#
class State < ApplicationRecord
  belongs_to :address
  has_many :cities

  validates :name, presence: true, uniqueness: true
  validates :acronym, presence: true, uniqueness: true
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

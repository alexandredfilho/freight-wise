# frozen_string_literal: true

#
# This model is responsible to create new instances of Companies
#
class Company < ApplicationRecord
  has_many :users
  has_many :carriers
  has_many :customers
  has_many :addresses, as: :addressable

  validates :name, presence: true, uniqueness: true
end

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

#
# This model is responsible to create new instances of Companies
#
class Company < ApplicationRecord
  has_many :users
end

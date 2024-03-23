# frozen_string_literal: true

module API
  module V1
    #
    # State serializer
    #
    class CitySerializer
      include JSONAPI::Serializer
      attributes :id, :name

      belongs_to :state

      # Exclude created_at and updated_at
      # attribute(:created_at) { nil }
      # attribute(:updated_at) { nil }
    end
  end
end

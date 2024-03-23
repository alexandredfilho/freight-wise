# frozen_string_literal: true

module API
  module V1
    #
    # State serializer
    #
    class StateSerializer
      include JSONAPI::Serializer
      attributes :id, :name, :acronym

      has_many :cities
    end
  end
end

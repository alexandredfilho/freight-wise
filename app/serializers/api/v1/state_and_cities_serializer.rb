# frozen_string_literal: true

module API
  module V1
    #
    # State and Cities serializer
    #
    class StateAndCitiesSerializer
      include JSONAPI::Serializer
      attributes :id, :name, :acronym, :cities

      has_many :cities
    end
  end
end

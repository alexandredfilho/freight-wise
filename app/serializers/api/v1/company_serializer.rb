# frozen_string_literal: true

module Api
  module V1
    #
    # Company serializer
    #
    class CompanySerializer
      include JSONAPI::Serializer
      attributes :id, :name, :created_at

      has_many :users
    end
  end
end

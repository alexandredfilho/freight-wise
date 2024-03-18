# frozen_string_literal: true

module API
  module V1
    #
    # Company serializer
    #
    class CompanySerializer
      include JSONAPI::Serializer
      attributes :id, :name, :created_at
    end
  end
end

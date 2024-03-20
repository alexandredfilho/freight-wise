# frozen_string_literal: true

module API
  module V1
    #
    # Customer serializer
    #
    class CustomerSerializer
      include JSONAPI::Serializer
      attributes :id, :name, :company_id, :created_at
    end
  end
end

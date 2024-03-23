# frozen_string_literal: true

module API
  module V1
    #
    # Address serializer
    #
    class AddressSerializer
      include JSONAPI::Serializer
      attributes :id, :street, :street_details, :zip_code, :addressable_type

      belongs_to :city
      belongs_to :state
    end
  end
end

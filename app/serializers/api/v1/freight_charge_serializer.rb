# frozen_string_literal: true

module API
  module V1
    #
    # Freight Charger serializer
    #
    class FreightChargeSerializer
      include JSONAPI::Serializer
      attributes :id, :table, :carrier_id, :created_at
    end
  end
end

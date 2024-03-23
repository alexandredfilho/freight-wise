# frozen_string_literal: true

module API
  module V1
    #
    # Carrier serializer
    #
    class CarrierSerializer
      include JSONAPI::Serializer
      attributes :name, :company_id
    end
  end
end

# == Schema Information
#
# Table name: carriers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_carriers_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

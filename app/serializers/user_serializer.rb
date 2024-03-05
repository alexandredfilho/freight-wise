# frozen_string_literal: true

#
# User serializer
#
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at

  attribute :created_at do |user|
    user.created_at&.strftime('%m/%d/%Y')
  end
end

# frozen_string_literal: true

#
# This model is responsible to create new instances of Users
#
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  belongs_to :company
  accepts_nested_attributes_for :company

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  def build_company(attributes = {})
    self.company = Company.create!(attributes)
  end

  after_create lambda {
    ::CompanyMailer::WelcomeMailer.welcome_email(self).deliver_now
  }
end

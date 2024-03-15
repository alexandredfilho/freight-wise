# frozen_string_literal: true

module CompanyMailer
  #
  # This class is used to send email notifications for users
  #
  class WelcomeMailer < ApplicationMailer
    #
    # This method is responsible for send an email when a new company is successful created.
    #
    # @param [company_user] company_user
    #
    # @return [void]
    #
    def welcome_email(user)
      @user = user

      mail(to: @user.email, subject: 'Welcome to Freight Wise!')
    end
  end
end

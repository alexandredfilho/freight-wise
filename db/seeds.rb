# frozen_string_literal: true

User.create!(
  email: 'admin@admin.com',
  password: 'VerySecure@2024',
  password_confirmation: 'VerySecure@2024',
  company_attributes: {
    name: 'My Company'
  }
)

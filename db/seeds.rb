# frozen_string_literal: true
require 'tty-spinner'

spinners = TTY::Spinner::Multi.new("[:spinner] Initializing database preparation!")

# Create a user and company with nested attributes
create_user_and_company = spinners.register "[:spinner] Creating a user and company..."
create_user_and_company.auto_spin

User.create!(
  email: 'admin2@admin.com',
  password: 'VerySecure@2024',
  password_confirmation: 'VerySecure@2024',
  company_attributes: {
    name: Faker::Company.name
  }
)

create_user_and_company.success
# User and Company were created

# Fetch states and cities from IBGE public API
fetch_sates_and_cities = spinners.register "[:spinner] Fetching states and cities from IBGE API..."
fetch_sates_and_cities.auto_spin

states_and_cities = ::PublicAPI::IbgeService.execute

states_and_cities.each do |state_data|
  state = State.create(name: state_data[:name], acronym: state_data[:acronym])
  state_data[:cities].each do |city_name|
    City.create(name: city_name, state: state)
  end
end

fetch_sates_and_cities.success
# States and cities were retrieved from the IBGE public API

# Create customers and assign them to the first company
create_customers = spinners.register "[:spinner] Creating Customers"
create_customers.auto_spin

5.times do
  Customer.create!(
    name: Faker::Company.name,
    company_id: 1
  )
end

create_customers.success
# Customers were created

# Create address and assign it to the Company
create_company_address = spinners.register "[:spinner] Creating Company Address..."
create_company_address.auto_spin

Address.create(
  street: Faker::Address.street_name,
  street_details: Faker::Address.secondary_address,
  city_id: 1,
  state_id: 1,
  zip_code: Faker::Address.zip_code,
  addressable_id: 1,
  addressable_type: "Company",
)
create_company_address.success
# Company address has been created

# Create address and assign it to the Company
create_customer_address = spinners.register "[:spinner] Creating Customer Address..."
create_customer_address.auto_spin

Address.create(
  street: Faker::Address.street_name,
  street_details: Faker::Address.secondary_address,
  city_id: 1,
  state_id: 1,
  zip_code: Faker::Address.zip_code,
  addressable_id: 1,
  addressable_type: "Customer",
)
create_customer_address.success
# Company address has been created

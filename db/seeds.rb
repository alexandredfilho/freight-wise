# frozen_string_literal: true
require 'tty-spinner'

spinners = TTY::Spinner::Multi.new("[:spinner] Initializing database preparation!")

sp1 = spinners.register "[:spinner] Creating a user and company..."
sp1.auto_spin

User.create!(
  email: 'admin@admin.com',
  password: 'VerySecure@2024',
  password_confirmation: 'VerySecure@2024',
  company_attributes: {
    name: 'My Company'
  }
)

sp1.success

sp2 = spinners.register "[:spinner] Fetching states and cities from IBGE API..."
sp2.auto_spin

states_and_cities = ::PublicAPI::IbgeService.execute

states_and_cities.each do |state_data|
  state = State.create(name: state_data[:name], acronym: state_data[:acronym])
  state_data[:cities].each do |city_name|
    City.create(name: city_name, state: state)
  end
end

sp2.success

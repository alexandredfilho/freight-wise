# frozen_string_literal: true

module PublicAPI
  #
  # IBGE public API to fetch states an cities
  #
  class IbgeService
    include HTTParty
    base_uri 'https://servicodados.ibge.gov.br/api/v1'

    def self.execute
      districts = fetch_districts
      extract_states_and_cities(districts)
    end

    def self.fetch_districts
      response = get('/localidades/distritos')
      JSON.parse(response.body)
    end

    def self.extract_states_and_cities(districts)
      states = {}

      districts.each do |district|
        state_acronym = extract_state_acronym(district)
        state_name = extract_state_name(district)
        city_name = extract_city_name(district)

        add_city_to_state(states, state_acronym, state_name, city_name)
      end

      states.values
    end

    def self.extract_state_acronym(district)
      district['municipio']['microrregiao']['mesorregiao']['UF']['sigla']
    end

    def self.extract_state_name(district)
      district['municipio']['microrregiao']['mesorregiao']['UF']['nome']
    end

    def self.extract_city_name(district)
      district['municipio']['nome']
    end

    def self.add_city_to_state(states, state_acronym, state_name, city_name)
      states[state_acronym] ||= { name: state_name, cities: [], acronym: state_acronym }
      return if states[state_acronym][:cities].include?(city_name)

      states[state_acronym][:cities] << city_name
    end
  end
end

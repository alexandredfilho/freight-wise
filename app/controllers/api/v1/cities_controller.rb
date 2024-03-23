# frozen_string_literal: true

module API
  module V1
    #
    # This controller is responsible for handle cities requests
    #
    class CitiesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_city, only: %i[show]

      def index
        @cities = City.all.order(:name)

        city_serializer = @cities.map do |city|
          CitySerializer.new(city).serializable_hash[:data][:attributes]
        end

        render json: city_serializer, status: :ok
      end

      def show
        render json: CitySerializer.new(@city).serializable_hash[:data][:attributes],
               status: :ok
      end

      private

      def set_city
        @city = City.find(params[:id])
      end
    end
  end
end

# frozen_string_literal: true

module API
  module V1
    #
    # This controller is responsible for handle address requests
    #
    class AddressesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_address, only: %i[show update destroy]

      def index
        @addresses = Address.all.order(:state_id).includes(:state, :city)

        address_serialized = @addresses.map do |address|
          AddressSerializer.new(address,
                                { include: params[:include].split(',') })
                           .serializable_hash
        end

        render json: address_serialized, status: :ok
      end

      def show
        render json: AddressSerializer.new(@address).serializable_hash[:data][:attributes],
               status: :ok
      end

      def create
        @address = Address.new(address_params)
        @address.save!

        render json: AddressSerializer.new(@address).serializable_hash[:data][:attributes],
                     status: :created
      end

      def update
        @address.update(address_params)
        render json: AddressSerializer.new(@address).serializable_hash[:data][:attributes],
               status: :ok
      end

      def destroy
        @address.destroy
        head :no_content
      end

      private

      def set_address
        @address = Address.find(params[:id])
      end

      def address_params
        params.require(:address).permit(:street, :street_details, :city_id, :state_id, :zip_code,
                                        :addressable_id, :addressable_type)
      end
    end
  end
end

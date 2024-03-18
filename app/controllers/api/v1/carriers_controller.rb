# frozen_string_literal: true

module API
  module V1
    #
    # This controller is responsible for handle carriers requests
    #
    class CarriersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_carrier, only: %i[show update destroy]

      def index
        @carriers = Carrier.all.order(:name)

        carriers_serialized = @carriers.map do |carrier|
          CarrierSerializer.new(carrier).serializable_hash[:data][:attributes]
        end

        render json: carriers_serialized, status: :ok
      end

      def show
        render json: CarrierSerializer.new(@carrier).serializable_hash[:data][:attributes],
               status: :ok
      end

      def create
        @carrier = Carrier.new(carrier_params)
        @carrier.save!

        render json: @carrier, status: :created
      end

      def update
        @carrier.update(carrier_params)
        render json: CarrierSerializer.new(@carrier).serializable_hash[:data][:attributes],
               status: :ok
      end

      def destroy
        @carrier.destroy
      end

      private

      def set_carrier
        @carrier = Carrier.find(params[:id])
      end

      def carrier_params
        params.require(:carrier).permit(:name, :company_id)
      end
    end
  end
end

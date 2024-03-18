# frozen_string_literal: true

module API
  module V1
    #
    # This controller is responsible  for creating users sessions
    #
    class FreightChargesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_charge, only: %i[show update destroy]

      def index
        @freight_charges = FreightCharge.all.order(:carrier_id)

        serialized_charges = @freight_charges.map do |charger|
          FreightChargeSerializer.new(charger).serializable_hash[:data][:attributes]
        end

        render json: serialized_charges, status: :ok
      end

      def show
        render json: FreightChargeSerializer.new(
          @freight_charge
        ).serializable_hash[:data][:attributes], status: :ok
      end

      def create
        @freight_charge = FreightCharge.new(freight_charge_params)
        @freight_charge.save!

        render json: @freight_charge, status: :created
      end

      def update
        @freight_charge.update(freight_charge_params)

        render json: FreightChargeSerializer.new(
          @freight_charge
        ).serializable_hash[:data][:attributes], status: :ok
      end

      def destroy
        @freight_charge.destroy
      end

      private

      def set_charge
        @freight_charge = FreightCharge.find(params[:id])
      end

      def freight_charge_params
        params.require(:freight_charge).permit(:table, :carrier_id)
      end
    end
  end
end

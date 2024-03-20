# frozen_string_literal: true

module API
  module V1
    #
    # This controller is responsible for handle customer requests
    #
    class CustomersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_customer, only: %i[show update destroy]

      def index
        @customers = Customer.all.order(:name)

        serialized_companies = @customers.map do |customer|
          CustomerSerializer.new(customer).serializable_hash[:data][:attributes]
        end

        render json: serialized_companies, status: :ok
      end

      def show
        render json: CustomerSerializer.new(@customer).serializable_hash[:data][:attributes],
               status: :ok
      end

      def create
        @customer = Customer.new(customer_params)
        @customer.save!

        render json: @customer, status: :created
      end

      def update
        @customer.update(customer_params)
        render json: CustomerSerializer.new(@customer).serializable_hash[:data][:attributes],
               status: :ok
      end

      def destroy
        @customer.destroy
      end

      private

      def set_customer
        @customer = Customer.find(params[:id])
      end

      def customer_params
        params.require(:customer).permit(:name, :company_id)
      end
    end
  end
end

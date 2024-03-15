# frozen_string_literal: true

module Api
  module V1
    #
    # This controller is responsible  for creating users sessions
    #
    class CompaniesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_company, only: %i[show update destroy]

      def index
        @companies = Company.all.order(:name)

        render json: CompanySerializer.new(@companies).serializable_hash[:data][:attributes],
               status: :ok
      end

      def show
        render json: CompanySerializer.new(@company).serializable_hash[:data][:attributes],
               status: :ok
      end

      def create
        @company = Company.new(company_params)
        @company.save!

        render json: @company, status: :created
      end

      def update
        @company.update(company_params)
        render json: CompanySerializer.new(@company).serializable_hash[:data][:attributes],
               status: :ok
      end

      def destroy
        @company.destroy
      end

      private

      def set_company
        @company = Company.find(params[:id])
      end

      def company_params
        params.require(:company).permit(:name)
      end
    end
  end
end

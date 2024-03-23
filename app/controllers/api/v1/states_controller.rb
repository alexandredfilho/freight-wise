# frozen_string_literal: true

module API
  module V1
    #
    # This controller is responsible for handle states requests
    #
    class StatesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_state, only: %i[show]

      def index
        @states = State.all.order(:name).includes(:cities)

        state_serialized = @states.map do |state|
          StateSerializer.new(state).serializable_hash[:data][:attributes]
        end

        render json: state_serialized, status: :ok
      end

      def show
        render json: StateAndCitiesSerializer.new(@state, include: [:cities])
                                             .serializable_hash[:data][:attributes],
               status: :ok
      end

      private

      def set_state
        @state = State.find(params[:id])
      end
    end
  end
end

class ParticipantsController < ApplicationController
	def index
		@participants = Participant.all.order('points desc')
	end

	def show
		@participant = Participant.find(params[:id])
	end
end

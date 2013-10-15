class DrawingsController < ApplicationController
	def index
		fetch_winners
	end
private

	def fetch_winners
		@drawings = Drawing.all.order('cycle desc, id desc')
	end

	def draw_winner
		# TODO
	end
end

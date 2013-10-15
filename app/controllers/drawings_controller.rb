class DrawingsController < ApplicationController
	def index
		fetch_winners
	end

	def create
		winner_info = draw_winner

		fetch_winners

		respond_to do |format|
      format.html { render 'index' }
      format.js { render json: winner_info.to_json }
    end			
	end

private

	def fetch_winners
		@drawings = Drawing.all.order('cycle desc, id desc')
	end

	def draw_winner
		cycle = Setting.value('drawing_cycle').to_i

		ineligible_winner_ids = Drawing.where(cycle: cycle).map {|d| d.participant_id}
		ineligible_winner_ids = "" if ineligible_winner_ids.length == 0

		eligible_winners = Participant.where('id not in (?)', ineligible_winner_ids)

		if eligible_winners.length > 0
			point = 0
			all_points = eligible_winners.sum(:points)
			winning_point = rand(all_points)

			eligible_winners.each do |p|
				point += p.points
				if point >= winning_point
					drawing = Drawing.create(participant_id: p.id, cycle: cycle)
					return {
	      		name: p.name,
	      		points: p.points,
	      		drawing_id: drawing.id,
	      		cycle: cycle
	      	}
				end
			end

			return nil
		elsif Participant.count > 0			
			puts "ran out of winners in this cycle"
			Setting.set_value('drawing_cycle', cycle + 1)
			return draw_winner
		else
			puts "No eligible winners"
		end
	end
end

class DrawingsController < ApplicationController
	def index
		@drawings = Drawing.all.order('cycle desc')
	end
end

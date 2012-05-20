class PollController < ApplicationController
	respond_to :json, except: [:index]
	
	def index
		@constituencies = Constituency.find :all
		@parties = Party.find :all
	end

	def results
	end

	def vote
	end
end

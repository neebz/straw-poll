class PollController < ApplicationController
	respond_to :json, except: [:index]
	
	def index
		@constituencies = Constituency.find :all
		@parties = Party.find :all
	end

	def results
	end

	def vote
		if params[:constituency_id] and params[:party_id]
			@vote = Vote.create do  |v|
				v.constituency_id =  params[:constituency_id]  
				v.party_id = params[:party_id]
			end
			@vote.save
		end
	end
end

class PollController < ApplicationController
	respond_to :json, except: [:index]
	
	def index
		@constituencies = Constituency.find :all
		@parties = Party.find :all
	end

	def results
	end

	def vote
		if params[:constituency_id]
			con = Constituency.find_by_id params[:constituency_id]
			par = params[:party_id] ? Party.find_by_id(params[:party_id]) : nil
			@vote = Vote.create will_vote: params[:will_vote], constituency: con, party: par
			@vote.save
		end
	end
end

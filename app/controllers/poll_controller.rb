class PollController < ApplicationController
	respond_to :json, except: [:index]
	
	def index
		@constituencies = Constituency.find :all
		@parties = Party.find :all
	end

	def vote
		if params[:constituency_id]
			@con = Constituency.find_by_id params[:constituency_id]
			par = params[:party_id] ? Party.find_by_id(params[:party_id]) : nil
			Vote.create will_vote: params[:will_vote], constituency: @con, party: par

			@nationalYes = Vote.find_all_by_will_vote(true).count
			@nationalNo = Vote.find_all_by_will_vote(false).count

			conVotes = Vote.find_all_by_constituency_id @con.id
			@conYes = conVotes.count { |cv| cv.will_vote == true }
			@conNo = conVotes.count { |cv| cv.will_vote == false }
		end
	end
end

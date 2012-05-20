class Vote < ActiveRecord::Base
	attr_accessible :will_vote, :constituency, :party
	belongs_to :constituency
	belongs_to :party
end

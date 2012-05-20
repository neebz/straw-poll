class Constituency < ActiveRecord::Base
  attr_accessible :name
  has_many :votes
end

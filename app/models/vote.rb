class Vote < ActiveRecord::Base
  attr_accessible :count
  belongs_to :constituency
  belongs_to :party
end

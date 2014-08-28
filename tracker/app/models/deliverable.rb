class Deliverable < ActiveRecord::Base
	has_one :project
	has_many :issues
end

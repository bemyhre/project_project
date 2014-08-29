class Client < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, format: { with: /[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})/}
	validates_uniqueness_of :email
	has_many :projects
end



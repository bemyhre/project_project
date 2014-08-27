require 'rails_helper'

RSpec.describe Client, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.create(:client)).to be_valid
	end

	it "is invalid without a first name" do
		person=FactoryGirl.build(:client, first_name: nil)
		expect(person).to_not be_valid
	end

	it "is invalid without a last name" do
		person=FactoryGirl.build(:client, last_name: nil)
		expect(person).to_not be_valid
	end

	it "is invalid without an email" do
		person=FactoryGirl.build(:client, email: nil)
		expect(person).to_not be_valid
	end
	
	it "is invalid with a bad email" do
		person=FactoryGirl.build(:client, email: "DDD@d")
		expect(person).to_not be_valid
	end
	
	it "is invalid if the email already exists" do
		person_1=FactoryGirl.create(:client)
		person_1_email =person_1.email
		person2=FactoryGirl.build(:client, email: person_1_email)
		expect(person2).to_not be_valid
	end
end

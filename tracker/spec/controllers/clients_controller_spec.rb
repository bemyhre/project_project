require 'rails_helper'

RSpec.describe ClientsController, :type => :controller do

	describe "GET #new" do

		it "renders the :new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	# describe "POST #create" do
	# 	context "with valid attributes" do

	# 		it "saves new client" do
	# 		end

	# 		it "redirects to the home page"

	# 	end

	# 	context "with invalid attributes" do 

	# 		it "does not save when first name is blank"

	# 		it "does not save when last name is blank" 

	# 		it "does not save when email is blank"

	# 		it "does not save with existing email"

	# 	end
	# end

end

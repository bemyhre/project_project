require 'rails_helper'

RSpec.describe ClientsController, :type => :controller do

	describe "GET #index" do
		it "populates an array of contacts" do 
			client=FactoryGirl.create(:client)
			get :index
			expect(assigns(:clients)).to eq([client])
		end

		it "renders the :index view" do 
			get :new
			expect(response).to render_template(:new)
		end

	end

	describe "GET #new" do
		it "renders the :new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe "POST #create" do
		context "with valid attributes" do

			it "saves new client" do 
				
				expect{post :create, client: FactoryGirl.attributes_for(:client)}.to change(Client,:count).by(1)
			end

			it "redirects to the home page" do
				post :create, client: FactoryGirl.attributes_for(:client)
				expect(response).to redirect_to(root_url)
			end

		end

	end

end

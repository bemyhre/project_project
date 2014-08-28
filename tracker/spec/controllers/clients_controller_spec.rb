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

	describe "GET #show" do
		it "assigns the requested contact to @contact" do
			client =FactoryGirl.create(:client)
			get :show, id: client
			expect(assigns(:client)).to eq(client)
		end

		it "renders the :show template" do 
			client =FactoryGirl.create(:client)
			get :show, id: client
			expect(response).to render_template(:show)
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

	describe "GET #edit" do 

		it "assigns the requested contact to @contact" do
			client =FactoryGirl.create(:client)
			get :show, id: client
			expect(assigns(:client)).to eq(client)
		end

		it "renders the :edit template" do 
			client =FactoryGirl.create(:client)
			get :edit, id: client
			expect(response).to render_template(:edit)
		end


		it "redirects to the home page" do 
			post :create, client: FactoryGirl.attributes_for(:client)
			expect(response).to redirect_to(root_url)
		end
	end

	describe "PUT update" do
		before :each do
			@client=FactoryGirl.create(:client, first_name:"Dilly", last_name:"Bar",
				company_name:"This Company", email: "dilly@bar.com")
		end

		context "valid attributes" do

			it "located the requested @contact" do
				put :update, id: @client, client: FactoryGirl.attributes_for(:client)
				expect(assigns(:client)).to eq(@client)
			end

			it "changes @contact's attributes" do 
				put :update, id: @client, client: FactoryGirl.attributes_for(:client, first_name: "Laser", last_name: "Spiderman")
				@client.reload
				expect(@client.first_name).to eq("Laser")
				expect(@client.last_name).to eq("Spiderman")
			end

			it "redirects to the home page" do
				put :update, id: @client, client: FactoryGirl.attributes_for(:client)
				expect(response).to redirect_to(root_url)
			end
		end

		context "invalid attributes" do 
			it "locates the requested @contact" do 
				put :update, id: @client, client: FactoryGirl.attributes_for(:invalid_client)
				expect(assigns(:client)).to eq(@client)
			end

			it "does not change @contact's attributes" do 
				put :update, id: @client,
				client: FactoryGirl.attributes_for(:client, first_name: "Larry", last_name: nil)
				@client.reload
				expect(@client.first_name).to_not eq("Larry")
				expect(@client.last_name).to eq("Bar")
			end

			it "re-renders the edit method" do 
				put :update, id: @client, client: FactoryGirl.attributes_for(:invalid_client)
				expect(response).to render_template(:edit)
			end
		end
	end



end

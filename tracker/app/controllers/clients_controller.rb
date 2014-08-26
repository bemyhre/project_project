class ClientsController < ApplicationController

  def index
  end
  
  def new
  	@client=Client.new
  end

  def create
  	@client=Client.new(client_params)
  	validate_new_client_form
  end

  private

  def validate_new_client_form
  	if @client.save
  		flash[:notice] = 'Client successfully added!'
  		redirect_to root_url
  	else
  		render "new"
  	end
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email)
  end
end

class ClientsController < ApplicationController

  def index
    @clients=Client.all 
  end
  
  def new
  	@client=Client.new
  end

  def create
  	@client=Client.new(client_params)
  	validate_new_client_form
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:notice] = 'Client successfully edited!'
      redirect_to root_url
    else
      render "edit"
    end

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
    params.require(:client).permit(:first_name, :last_name, :company_name, :email)
  end
end

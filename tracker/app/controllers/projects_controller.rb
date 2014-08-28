class ProjectsController < ApplicationController
  def index
    @projects=Project.all 
  end
  
  def new
  	@client=Client.find(params[:client_id])
  	@project=Project.new
  end

  def create
  	@client=Client.find(params[:client_id])
  	@project=@client.projects.create(project_params)
  	redirect_to client_path(@client)
  end

  def show
  	@client=Client.find(params[:client_id])
  	@project=@client.projects.find(params[:id])
  end
  
  def edit
  	puts "fuuuuuuuuuk"
  	@client=Client.find(params[:client_id])
  	@project=@client.projects.find(params[:id])
  end

  private

  def validate_new_project_form
  	if @project.save
  		flash[:notice] = 'Project successfully added!'
  		redirect_to root_url
  	else
  		render "new"
  	end
  end


  def project_params
    params.require(:project).permit(:name, :description)
  end
end


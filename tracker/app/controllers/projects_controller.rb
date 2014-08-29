class ProjectsController < ApplicationController
  
  def new
    if current_user
    	@client=Client.find(params[:client_id])
    	@project=Project.new
    else
      flash[:notice] = 'You must be logged in to do that!'
      redirect_to root_url
    end
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
    if current_user
    	@client=Client.find(params[:client_id])
    	@project=@client.projects.find(params[:id])
    else
      flash[:notice] = 'You must be logged in to do that!'
      redirect_to root_url
    end
  end

  def update
    @client = Client.find(params[:client_id])
    @project=@client.projects.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = 'project successfully edited!'
      redirect_to client_project_path(@client,@project)
    else
      render "edit"
    end

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


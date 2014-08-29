class DeliverablesController < ApplicationController
	def new
		
	  	@project=Project.find(params[:project_id])
	  	@deliverable=Deliverable.new
	end

	def create
		@project=Project.find(params[:project_id])
  		@deliverable=@project.deliverables.create(deliverable_params)
  		redirect_to root_url

	end

	def show
	  	@deliverable=Deliverable.find(params[:id])
	end

	def edit
	  	@deliverable=Deliverable.find(params[:id])
	  	puts @deliverable.inspect
	end

	def update
	    @deliverable = Deliverable.find(params[:id])
	    if @deliverable.update(deliverable_params)
	      flash[:notice] = 'deliverable successfully edited!'
	      redirect_to deliverable_path(@deliverable)
	    else
	      render "edit"
	    end
	end

	private

	def validate_new_deliverable_form
		if @deliverable.save
			flash[:notice] = 'Deliverable successfully added!'
			redirect_to root_url
		else
			render "new"
		end
	end


	def deliverable_params
		params.require(:deliverable).permit(:name, :description)
	end

end

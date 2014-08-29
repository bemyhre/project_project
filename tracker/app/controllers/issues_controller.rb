class IssuesController < ApplicationController
	def new
		@deliverable=Deliverable.find(params[:deliverable_id])
	  	@issue=Issue.new
	end

	def create
		@deliverable=Deliverable.find(params[:deliverable_id])
  		@issue=@deliverable.issues.create(issue_params)
  		redirect_to root_url
	end

	def show
	  	@issue=Issue.find(params[:id])
	end

	def edit
	  	@issue=Issue.find(params[:id])
	end

	def update
	    @issue = Issue.find(params[:id])
	    if @issue.update(issue_params)
	      flash[:notice] = 'issue successfully edited!'
	      redirect_to issue_path(@issue)
	    else
	      render "edit"
	    end
	end

	private

	def validate_new_issue_form
		if @issue.save
			flash[:notice] = 'Issue successfully added!'
			redirect_to root_url
		else
			render "new"
		end
	end


	def issue_params
		params.require(:issue).permit(:title, :body, :budgeted_time, :priority)
	end
end

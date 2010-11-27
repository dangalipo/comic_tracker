class IssuesController < ApplicationController
  
  # GET /issues
  def index
    @issues = Issue.all
    
    respond_to do |format|
      format.html { render }
    end
    
  end
  
  # GET /issues/1
  def show
    @issue = Issue.find(params[:id])
    
    respond_to do |format|
      format.html { render }
    end
    
  end
  
  # GET /issues/new
  def new
    @issue = Issue.new
    
    respond_to do |format|
      format.html { render }
    end
    
  end
  
  # POST /issues
  
  def create
    @issue = Issue.new(params[:issue])
    
    if @issue.save
      respond_to do |format|
        format.html{
          flash[:notice] = "Successfully create issue"
          redirect_to issues_path
        }
      end
    else
      respond_to do |format|
        format.html{
          flash[:error] = "Failed to create issue"
          redirect_to new_issue_path
        }
      end
      
    end
    
  end
  
  # GET /issues/edit  
  def edit
    @issue = Issue.find(params[:id])
    
    respond_to do |format|
      format.html { render}
    end
    
  end
  
  # PUT /issues/1
  def update
    @issue = Issue.find(params[:id])
    
    if @issue.update_attributes(params[:issue])
      respond_to do |format|
        format.html{
          flash[:notice] = "Successfully update issue"
          redirect_to issues_path
        }
      end
    else
      respond_to do |format|
        format.html{
          flash[:error] = "Failed to update issue"
          redirect_to edit_issue_path(@issue.id)
        }
      end
      
    end
    
  end
  
  # DELETE /issues/1
  def destroy
    @issue = Issue.find(params[:id])
    
    if @issue.destroy
      respond_to do |format|
        format.html{
          flash[:notice] = "Successfully deleted issue"
          redirect_to issues_path
        }
      end
    else
      respond_to do |format|
        format.html{
          flash[:error] = "Failed to deleted issue"
          redirect_to issue_path(@issue.id)
        }
      end
    end
  end
  
end
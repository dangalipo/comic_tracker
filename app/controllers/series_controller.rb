class SeriesController < ApplicationController
  
  # GET /series
  def index
    @series = Series.all
    
    respond_to do |format|
      format.html { render }
    end
    
  end
  
  # GET /series/1
  def show
    @series = Series.find(params[:id])
    
    respond_to do |format|
      format.html { render }
    end
    
  end
  
  # GET /series/new
  def new
    @series = Series.new
    
    respond_to do |format|
      format.html { render }
    end
    
  end
  
  # POST /series
  
  def create
    @series = Series.new(params[:series])
    
    if @series.save
      respond_to do |format|
        format.html{
          flash[:notice] = "Successfully create series"
          redirect_to series_index_path
        }
      end
    else
      respond_to do |format|
        format.html{
          flash[:error] = "Failed to create series"
          redirect_to new_series_path
        }
      end
      
    end
    
  end
  
  # GET /series/edit  
  def edit
    @series = Series.find(params[:id])
    
    respond_to do |format|
      format.html { render}
    end
    
  end
  
  # PUT /series/1
  def update
    @series = Series.find(params[:id])
    
    if @series.update_attributes(params[:series])
      respond_to do |format|
        format.html{
          flash[:notice] = "Successfully update series"
          redirect_to series_index_path
        }
      end
    else
      respond_to do |format|
        format.html{
          flash[:error] = "Failed to update series"
          redirect_to edit_series_path(@series.id)
        }
      end
      
    end
    
  end
  
  # DELETE /series/1
  def destroy
    @series = Series.find(params[:id])
    
    if @series.destroy
      respond_to do |format|
        format.html{
          flash[:notice] = "Successfully deleted series"
          redirect_to series_index_path
        }
      end
    else
      respond_to do |format|
        format.html{
          flash[:error] = "Failed to deleted series"
          redirect_to series_path(@series.id)
        }
      end
    end
  end
  
end
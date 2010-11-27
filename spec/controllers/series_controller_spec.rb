require File.dirname(__FILE__) + '/../spec_helper'

describe SeriesController do
  
  before :each do
    @series = Series.make
  end
  
  context '#index' do
    
    before :each do
      @series = [Series.new , Series.new]
      mock(Series).all{ @series }
      get :index
    end
    
    it 'should return all series' do
      assigns(:series).should == @series
    end
    
    it 'should render the index template' do
      response.should render_template(:index)
    end
    
  end
  
  context '#show' do 
    
    before :each do
      @series = Series.make
      mock(Series).find(1) {@series}
      get :show, :id => 1
    end
    
    it 'should find the correct series' do
      assigns(:series).should == @series
    end
    
    it 'should render the show template' do
      response.should render_template(:show)
    end
    
  end
  
  context '#new' do
    
    before :each do
      get :new
    end
    
    it 'should instantiate a new series object' do
      assigns(:series).new_record?.should be_true
    end
    
    it 'should render the new template' do
      response.should render_template(:new)
    end
    
  end
  
  context '#create' do
    
    before :each do
      @series = Series.make
      mock(Series).new(anything) { @series }    
    end
    
    context 'successfully created' do
      
      before :each do
        mock(@series).save { true }
        post :create, :series => {} 
      end
      
      it 'should display a successful flash notice' do
        flash.now[:notice].should == 'Successfully create series'
      end
      
      it 'should redirect to index' do
        response.should redirect_to(series_index_path())
      end
      
    end
    
    context 'failed to create' do
      
      before :each do
        mock(@series).save { false }
        post :create, :series => {}
      end
      
      it 'should display a flash error' do
        flash.now[:error].should == 'Failed to create series'
      end

      it 'should redirect to new' do
        response.should redirect_to(new_series_path())
      end
      
    end
    
  end
  
  context '#edit' do
    
    before :each do
      @series = Series.make 
      mock(Series).find(1) { @series }
      get :edit, :id => 1
    end
    
    it 'should find the correct series' do
      assigns(:series).should == @series
    end
    
    it 'should render the edit template' do
      response.should render_template(:edit)
    end
    
  end
  
  context '#update' do
    
    before :each do
      @series = Series.make
      mock(Series).find(anything) { @series }
    end

    context 'successfully updated' do
      
      before :each do
        mock(@series).update_attributes(anything) { true }
        put :update, :id => 1, :series => {}
      end
      
      it 'should display a successful flash notice' do
        flash.now[:notice].should == 'Successfully update series'
      end
      
      it 'should redirect to index' do
        response.should redirect_to(series_index_path())
      end
      
    end
    
    context 'failed to create' do
      
      before :each do
        mock(@series).update_attributes(anything) { false }
        put :update, :id => 1, :series => {}
      end
      
      it 'should display a flash error' do
        flash.now[:error].should == 'Failed to update series'
      end

      it 'should redirect to new' do
        response.should redirect_to(edit_series_path(@series.id))
      end
      
    end    
        
  end
  
  context '#destroy' do
    
    before :each do
      @series = Series.make
      mock(Series).find(1) { @series }    
    end
    
    context 'successfully updated' do

      before :each do
        mock(@series).destroy { true }
        delete :destroy, :id => 1
      end

      it 'should display a successful flash notice' do
        flash.now[:notice].should == 'Successfully deleted series'
      end

      it 'should redirect to index' do
        response.should redirect_to(series_index_path())
      end

    end

    context 'failed to destroy' do

      before :each do
        mock(@series).destroy { false }
        delete :destroy, :id => 1
      end

      it 'should display a flash error' do
        flash.now[:error].should == 'Failed to deleted series'
      end

      it 'should redirect to show' do
        response.should redirect_to(series_path(@series.id))
      end

    end    

  end
  
end
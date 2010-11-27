require File.dirname(__FILE__) + '/../spec_helper'

describe IssuesController do
  
  before :each do
    @issue = Issue.make
  end
  
  context '#index' do
    
    before :each do
      @issues = [Issue.new , Issue.new]
      mock(Issue).all{ @issues }
      get :index
    end
    
    it 'should return all issues' do
      assigns(:issues).should == @issues
    end
    
    it 'should render the index template' do
      response.should render_template(:index)
    end
    
  end
  
  context '#show' do 
    
    before :each do
      @issue = Issue.make
      mock(Issue).find(1) {@issue}
      get :show, :id => 1
    end
    
    it 'should find the correct issue' do
      assigns(:issue).should == @issue
    end
    
    it 'should render the show template' do
      response.should render_template(:show)
    end
    
  end
  
  context '#new' do
    
    before :each do
      get :new
    end
    
    it 'should instantiate a new issue object' do
      assigns(:issue).new_record?.should be_true
    end
    
    it 'should render the new template' do
      response.should render_template(:new)
    end
    
  end
  
  context '#create' do
    
    before :each do
      @issue = Issue.make
      mock(Issue).new(anything) { @issue }    
    end
    
    context 'successfully created' do
      
      before :each do
        mock(@issue).save { true }
        post :create, :issue => {} 
      end
      
      it 'should display a successful flash notice' do
        flash.now[:notice].should == 'Successfully create issue'
      end
      
      it 'should redirect to index' do
        response.should redirect_to(issues_path())
      end
      
    end
    
    context 'failed to create' do
      
      before :each do
        mock(@issue).save { false }
        post :create, :issue => {}
      end
      
      it 'should display a flash error' do
        flash.now[:error].should == 'Failed to create issue'
      end

      it 'should redirect to new' do
        response.should redirect_to(new_issue_path())
      end
      
    end
    
  end
  
  context '#edit' do
    
    before :each do
      @issue = Issue.make 
      mock(Issue).find(1) { @issue }
      get :edit, :id => 1
    end
    
    it 'should find the correct issue' do
      assigns(:issue).should == @issue
    end
    
    it 'should render the edit template' do
      response.should render_template(:edit)
    end
    
  end
  
  context '#update' do
    
    before :each do
      @issue = Issue.make
      mock(Issue).find(anything) { @issue }
    end

    context 'successfully updated' do
      
      before :each do
        mock(@issue).update_attributes(anything) { true }
        put :update, :id => 1, :issue => {}
      end
      
      it 'should display a successful flash notice' do
        flash.now[:notice].should == 'Successfully update issue'
      end
      
      it 'should redirect to index' do
        response.should redirect_to(issues_path())
      end
      
    end
    
    context 'failed to create' do
      
      before :each do
        mock(@issue).update_attributes(anything) { false }
        put :update, :id => 1, :issue => {}
      end
      
      it 'should display a flash error' do
        flash.now[:error].should == 'Failed to update issue'
      end

      it 'should redirect to new' do
        response.should redirect_to(edit_issue_path(@issue.id))
      end
      
    end    
        
  end
  
  context '#destroy' do
    
    before :each do
      @issue = Issue.make
      mock(Issue).find(1) { @issue }    
    end
    
    context 'successfully updated' do

      before :each do
        mock(@issue).destroy { true }
        delete :destroy, :id => 1
      end

      it 'should display a successful flash notice' do
        flash.now[:notice].should == 'Successfully deleted issue'
      end

      it 'should redirect to index' do
        response.should redirect_to(issues_path())
      end

    end

    context 'failed to destroy' do

      before :each do
        mock(@issue).destroy { false }
        delete :destroy, :id => 1
      end

      it 'should display a flash error' do
        flash.now[:error].should == 'Failed to deleted issue'
      end

      it 'should redirect to show' do
        response.should redirect_to(issue_path(@issue.id  ))
      end

    end    

  end
  
end
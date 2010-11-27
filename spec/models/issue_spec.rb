require File.dirname(__FILE__) + '/../spec_helper'

describe Issue do
  
  context 'attributes' do
    
    before :each do
      @issue = Issue.make
    end
    
    it 'should have and issue number' do
      @issue.issue_number.class.should == Fixnum
    end
    
    it 'should have a release date' do
      @issue.release_date.class.should == ActiveSupport::TimeWithZone
    end
    
  end
  
end
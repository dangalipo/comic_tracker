require File.dirname(__FILE__) + '/../spec_helper'

describe Series do
  
  context 'attributes' do
     
    before :each do
      @series = Series.make
    end
    
    it 'should have and name' do
      @series.name.class.should == String
    end
    
    it 'should not be a one shot' do
      @series.one_shot.class.should == FalseClass
    end
    
    it 'should not be finished' do
      @series.finished.class.should == FalseClass
    end
    
  end
  
end
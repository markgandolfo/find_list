require 'spec/spec_helper'

describe FindList do

  it "should find a list of the posts" do
    Post.list(:display => :title).should eql([["1: January", 1], ["2: February", 2], ["3: March", 3], ["4: April", 4], ["5: May", 5], ["6: June", 6], ["7: July", 7], ["8: August", 8], ["9: September", 9], ["10: October", 10], ["11: November", 11], ["12: December", 12]])
  end
  
  
  
end
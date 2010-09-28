require 'spec_helper'

describe Fid, "(flat diff)" do
  it 'two empty objects' do
    Fid.diff({}, {}).should == {}
  end
end


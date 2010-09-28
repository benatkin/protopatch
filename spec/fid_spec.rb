require 'spec_helper'

describe Fid, "#diff" do
  it 'returns {} for two empty objects' do
    Fid.diff({}, {}).should == {}
  end

  it 'returns "<" for item not in 2nd object' do
    Fid.diff({'apples' => 1}, {}).should == {'apples' => {'<' => 1}}
  end

  it 'returns ">" for item not in 1st object' do
    Fid.diff({}, {'bananas' => 3}).should == {'bananas' => {'>' => 3}}
  end
end


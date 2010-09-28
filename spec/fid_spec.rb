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

  it 'returns "<" and "> for changed item' do
    Fid.diff({'bananas' => 5}, {'bananas' => 3})
       .should == {'bananas' => {'<' => 5, '>' => 3}}
  end

  it 'omits unchanged item' do
    Fid.diff({'bananas' => 5}, {'bananas' => 5}).should == {}
  end

  it 'correctly returns diff from README' do
    Fid.diff({
               "pears"   => 1,
               "apples"  => {"red" => 2, "green" => 1},
               "bananas" => 5,
               "mangos"  => 2
             },
             {
               "apples"  => {"golden" => 1},
               "bananas" => 3,
               "oranges" => 6,
               "mangos"  => 2
             })
       .should == {
                    "apples"  => {
                                   ">" => {"golden" => 1},
                                   "<" => {"red" => 2, "green" => 1}
                                 },
                    "bananas" => {">" => 3, "<" => 5},
                    "oranges" => {">" => 6},
                    "pears"   => {"<" => 1}
                  }
  end
end


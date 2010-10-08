require 'spec_helper'

flat_doc1 = {
              "pears"   => 1,
              "apples"  => {"red" => 2, "green" => 1},
              "bananas" => 5,
              "mangos"  => 2
            }
flat_doc2 = {
              "apples"  => {"golden" => 1},
              "bananas" => 3,
              "oranges" => 6,
              "mangos"  => 2
            }
flat_diff = {
              "apples"  => {
                             ">" => {"golden" => 1},
                             "<" => {"red" => 2, "green" => 1}
                           },
              "bananas" => {">" => 3, "<" => 5},
              "oranges" => {">" => 6},
              "pears"   => {"<" => 1}
            }

describe Fid, "#diff" do
  it 'returns nil for two empty objects' do
    Fid.diff({}, {}).should be_nil
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
    Fid.diff({'bananas' => 5}, {'bananas' => 5}).should be_nil
  end

  it 'correctly returns diff from README' do
    Fid.diff(flat_doc1, flat_doc2).should == flat_diff
  end
end

describe Fid, "#patch" do
  it 'returns the same when patching with nil' do
    Fid.patch({}, nil).should == {}
  end

  it 'removes "<" item in patch' do
    Fid.patch({'apples' => 1}, {'apples' => {'<' => 1}}).should == {}
  end

  it 'adds ">" item in patch' do
    Fid.patch({}, {'bananas' => {'>' => 3}}).should == {'bananas' => 3}
  end

  it 'replaces "<" and ">" item in patch' do
    Fid.patch({'bananas' => 5}, {'bananas' => {'<' => 5, '>' => 3}})
       .should == {'bananas' => 3}
  end

  it 'leaves unchanged with nil patch' do
    Fid.patch({'bananas' => 5}, nil).should == {'bananas' => 5}
  end

  it 'correctly patches with diff from README' do
    Fid.patch(flat_doc1, flat_diff).should == flat_doc2
  end
end


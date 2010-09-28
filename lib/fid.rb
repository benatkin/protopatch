module Fid
  def self.diff(doc1, doc2)
    _diff = {}
    ({}.to_set + doc1.keys + doc2.keys).each do |k|
      if doc1.include?(k) and doc2.include?(k)
        unless doc1[k] == doc2[k]
          _diff[k] = {'<' => doc1[k], '>' => doc2[k]}
        end
      elsif doc1.include?(k)
        _diff[k] = {'<' => doc1[k]}
      elsif doc2.include?(k)
        _diff[k] = {'>' => doc2[k]}
      end
    end
    _diff
  end
end

module Fid
  def self.diff(doc1, doc2)
    if doc1 == doc2
      nil
    elsif (doc1.keys & doc2.keys).size > 0
      _diff = {}
      (doc1.keys | doc2.keys).each do |k|
        if doc1.include?(k) and doc2.include?(k)
          unless doc1[k] == doc2[k]
            _diff[k] = {'-' => doc1[k], '+' => doc2[k]}
          end
        elsif doc1.include?(k)
          _diff[k] = {'-' => doc1[k]}
        elsif doc2.include?(k)
          _diff[k] = {'+' => doc2[k]}
        end
      end
      _diff
    else
      _diff = {'-' => doc1, '+' => doc2}
    end
  end

  def self.patch(doc, _patch)
    case _patch
      when Hash
        if _patch.include?('-') and _patch.include?('+')
          _patch['+']
        else
          patched = doc.clone
          _patch.each do |k, v|
            if v.include?('-') and v.include?('+')
              patched[k] = v['+']
            elsif v.include?('-')
              patched.delete(k)
            elsif v.include?('+')
              patched[k] = v['+']
            end
          end
          patched
        end
      when nil
        doc
    end
  end
end

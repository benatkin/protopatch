module Fid
  def self.diff(a, b)
    if a == b
      nil
    elsif (a.keys & b.keys).size > 0
      p = {}
      (a.keys | b.keys).each do |k|
        if a.include?(k) and b.include?(k)
          unless a[k] == b[k]
            p[k] = {'-' => a[k], '+' => b[k]}
          end
        elsif a.include?(k)
          p[k] = {'-' => a[k]}
        elsif b.include?(k)
          p[k] = {'+' => b[k]}
        end
      end
      p
    else
      p = {'-' => a, '+' => b}
    end
  end

  def self.patch(a, p)
    case p
      when Hash
        if p.include?('-') and p.include?('+')
          p['+']
        else
          patched = a.clone
          p.each do |k, v|
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
        a
    end
  end
end

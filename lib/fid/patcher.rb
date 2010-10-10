module Fid
  class Patcher
    def initialize(opts={})
      @opts = opts
    end

    def diff(a, b)
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

    def patch(a, p)
      case p
        when Hash
          if p.include?('-') and p.include?('+')
            p['+']
          else
            b = a.clone
            p.each do |k, v|
              if v.include?('-') and v.include?('+')
                b[k] = v['+']
              elsif v.include?('-')
                b.delete(k)
              elsif v.include?('+')
                b[k] = v['+']
              end
            end
            b
          end
        when nil
          a
      end
    end
  end
end

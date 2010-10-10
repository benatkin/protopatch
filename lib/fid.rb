module Fid
  class << self
    attr_writer   :default_differ

  private
    def method_missing(name, *args, &block)
      default_differ.send(name, *args, &block)
    end
  end
  
  def self.default_differ
    @default_differ || Differ.new
  end
end

require 'fid/differ'


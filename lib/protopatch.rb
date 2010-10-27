module ProtoPatch
  class << self
    attr_writer   :default_patcher

  private
    def method_missing(name, *args, &block)
      default_patcher.send(name, *args, &block)
    end
  end
  
  def self.default_patcher
    @default_patcher || Patcher.new
  end
end

require 'protopatch/patcher'


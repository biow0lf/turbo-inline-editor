# frozen_string_literal: true

module TurboInlineEditor
  def self.configure
    @configuration ||= Configuration.new
    yield @configuration if block_given?
  end

  class Configuration
    attr_accessor :container #, :skip_blur

    def initialize
      @container = :span
      # @skip_blur = false
    end
  end

  configure
end

require 'dotenv'

# Support for dotenv configuration within the view.
module MiddlemanDotenvHelpers
  def env
    @config ||= DotenvConfiguration.new
  end

  # A helper class for finding configuration with ENV and presenting it
  # in a concise way within the view. Using the helper method `env`, one
  # can request the value of any environment variable through Dotenv by
  # running its method like so:
  #
  #     env.segment_write_key
  #
  # They will then be able to view the `$SEGMENT_WRITE_KEY` from the
  # environment within the view.
  class DotenvConfiguration
    def initialize
      Dotenv.load
    end

    def method_missing(method, *arguments)
      ENV[method.to_s.upcase]
    end
  end
end

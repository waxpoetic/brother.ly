
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
    def method_missing(method, *arguments)
      super unless respond_to? method
      get attr_name_for(method)
    end

    def respond_to?(method)
      attr_exists?(method) || super
    end

    private

    def attr_exists?(method)
      ENV[attr_name_for(method)].present?
    end

    def attr_name_for(method_name)
      method_name.gsub(/=\Z/, '').downcase
    end

    def get(attribute)
      if attribute =~ /\?\Z/
        !!ENV[attribute]
      else
        ENV[attribute]
      end
    end
  end
end

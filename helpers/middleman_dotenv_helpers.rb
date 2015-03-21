module MiddlemanDotenvHelpers
  def env
    @config ||= DotenvConfiguration.new
  end

  class DotenvConfiguration
    def method_missing(method, *arguments)
      super unless respond_to? method
      method_name = name_of(method)

      case
      when method =~ /\=\Z/
        ENV[method_name] = arguments.first
      when method =~ /\?\Z/
        !!ENV[method_name]
      when method =~ /\!\Z/
        ENV[method_name] = true
      else
        ENV[method_name
      end
    end

    def respond_to?(method)
      ENV[name_of(method)].present?
    end

    private

    def name_of(method)
      method.gsub(/=\Z/, '').downcase
    end
  end
end

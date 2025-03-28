# frozen_string_literal: true

require_relative "weather_api_ruby/version"
require_relative "weather_api_ruby/client"

module WeatherApiRuby
  class << self
    attr_accessor :api_key

    def configure
      yield self
    end
  end
end

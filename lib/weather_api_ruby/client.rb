# frozen_string_literal: true

require "httparty"

module WeatherApiRuby
  class Client
    include HTTParty
    base_uri "http://api.weatherapi.com/v1"

    def initialize(api_key = WeatherApiRuby.api_key)
      @api_key = api_key
    end

    def current_weather(location)
      response = self.class.get("/current.json", query: { key: @api_key, q: location })
      parsed_response(response)
    end

    def forecast(location, days: 3)
      response = self.class.get("/forecast.json", query: { key: @api_key, q: location, days: days })
      parsed_response(response)
    end

    private

    def parsed_response(response)
      return response.parsed_response if response.success?

      # add response code
      { error: response["error"] || "Unknown error", code: response.code }
    end
  end
end

# frozen_string_literal: true

require "spec_helper"
require "weather_api_ruby/client"
require "webmock/rspec"

RSpec.describe WeatherApiRuby::Client do
  let(:api_key) { "test_api_key" }
  let(:client) { described_class.new(api_key) }

  describe "#current_weather" do
    it "fetches the current weather for a given location" do
      stub_request(:get, %r{api.weatherapi.com/v1/current.json})
        .to_return(status: 200, body: '{"location": {"name": "London"}, "current": {"temp_c": 15.0}}', headers: { "Content-Type" => "application/json" })

      response = client.current_weather("London")
      expect(response).to include("location" => { "name" => "London" })
      expect(response).to include("current" => { "temp_c" => 15.0 })
    end
  end

  describe "#forecast" do
    it "fetches the weather forecast for a given location and number of days" do
      stub_request(:get, %r{api.weatherapi.com/v1/forecast.json})
        .to_return(status: 200, body: '{"forecast": {"forecastday": [{"day": {"maxtemp_c": 20.0}}]}}', headers: { "Content-Type" => "application/json" })

      response = client.forecast("London", days: 2)
      expect(response).to include("forecast" => { "forecastday" => [{ "day" => { "maxtemp_c" => 20.0 } }] })
    end
  end
end

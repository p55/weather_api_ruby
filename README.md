# WeatherApiRuby

Simple watherapi (https://github.com/weatherapicom) ruby gem

## Usage

Get your weatherapi api key from https://www.weatherapi.com/. Run `bundle console`, then
```
client = WeatherApiRuby::Client.new('your_api_key')
client.current_weather('London')
client.forecast('London', days: 2)
```
to get you weather data


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[p55]/weather_api_ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# Rome2rio

A Ruby wrapper for the Rome2rio API. See http://www.rome2rio.com/documentation/search for the official documentation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rome2rio', github: 'exAspArk/rome2rio'
```

## Usage

```ruby
require 'rome2rio'
rome2rio_search = Rome2rio::Connection.new(api_key: 'your api key').search(search_options)
puts rome2rio_search.path
puts rome2rio_search.results.routes[0].duration
```

All field names (both request and response) use the original naming as in the API documentation.

The API key and endpoint URL both can be set when creating an instance, but they can be overwritten by passing them for a request.

Complex datatypes (such as Position, Size, Offset, DayFlags) will be parsed.

Using Position for input:

```ruby
Rome2rio::Connection.new.search({:oPos => Rome2rio::Position.new(41.79443,12.25108), :dPos => Rome2rio::Position.new(-22.81215,-43.24721)})
```

The original JSON response is also available in the `verbatim` field.

## Copyright

See LICENSE for details.

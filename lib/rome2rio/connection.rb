module Rome2rio
  class Connection
    API_ENDPOINT = "http://free.rome2rio.com"

    attr_reader :api_key, :endpoint

    def initialize(options = {})
      @api_key = options[:api_key]
      @endpoint = options[:endpoint] || API_ENDPOINT
    end

    def search(options)
      Search.new(@endpoint, options.merge(key: @api_key))
    end
  end
end

module Rome2rio
  class Connection
    API_ENDPOINT = "http://free.rome2rio.com"
    API_PATH = "/api/1.2/json/Search"

    attr_reader :api_key, :api_path, :endpoint

    def initialize(options = {})
      @api_key = options[:api_key]
      @api_path = options[:api_path] || API_PATH
      @endpoint = options[:endpoint] || API_ENDPOINT
    end

    def search(options)
      Search.new(endpoint, api_path, options.merge(key: @api_key))
    end
  end
end

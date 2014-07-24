module Rome2rio
  class Search
    API_PATH = "/api/1.2/json/Search"

    attr_reader :endpoint, :options

    def initialize(endpoint, options)
      @endpoint = endpoint
      @options = options.clone

      if options[:flags].is_a?(Symbol) || options[:flags].is_a?(Array)
        @options[:flags] = SearchRequestFlags.new(options[:flags])
      end
    end

    def path
      "#{ API_PATH }?#{ URI.encode_www_form(options) }"
    end

    def results
      @results ||= begin
        response = Faraday.new(url: endpoint).get(path)

        if response.status == 200
          SearchResponse.new(MultiJson.decode(response.body))
        else
          { status: response.status, body: response.body }
        end
      end
    end
  end
end

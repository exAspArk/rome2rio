module Rome2rio
  class Search
    attr_reader :endpoint, :api_path, :options

    def initialize(endpoint, api_path, options)
      @endpoint = endpoint
      @api_path = api_path
      @options = options.clone

      if options[:flags].is_a?(Symbol) || options[:flags].is_a?(Array)
        @options[:flags] = SearchRequestFlags.new(options[:flags])
      end
    end

    def path
      "#{ api_path }?#{ URI.encode_www_form(options) }"
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

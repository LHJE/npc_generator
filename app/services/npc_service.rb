class NPCService
  def self.get_npc_name
    key = ENV['NAME_API_KEY']
    url = ENV['NAME_URL']
    uri = "/?api_key=#{key}&endpoint=generate"
    get_results(url, key, uri)[:data][0]
  end

  def self.get_npc_ancestry
    url = ENV['ANCESTRY_URL']
    uri = "/races/"
    results = Faraday.get url + uri
    JSON.parse(results.body, symbolize_names: true)[:results].sample
  end

  def self.get_npc_class
    url = ENV['ANCESTRY_URL']
    uri = "/classes/"
    results = Faraday.get url + uri
    JSON.parse(results.body, symbolize_names: true)[:results].sample
  end

  def self.get_results(url, key, uri)
    conn = Faraday.new(url: url) do |faraday|
      faraday.headers['X-API-Key'] = key
    end
    results = conn.get(uri)
    JSON.parse(results.body, symbolize_names: true)
  end
end

class NPCService
  def self.create_npc_ancestry
    url = ENV['DND_URL']
    uri = '/races/'
    results = Faraday.get url + uri
    JSON.parse(results.body, symbolize_names: true)[:results].sample
  end

  def self.create_npc_class
    url = ENV['DND_URL']
    uri = '/classes/'
    results = Faraday.get url + uri
    JSON.parse(results.body, symbolize_names: true)[:results].sample
  end
end

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

  def self.get_spells
    url = ENV['SECOND_DND_URL']
    uri = '/spells/'
    results = Faraday.get url + uri
    JSON.parse(results.body, symbolize_names: true)[:results]
  end

  def self.get_spell_info(spell_url)
    url = ENV['SECOND_DND_URL']
    uri = spell_url
    results = Faraday.get url + uri
    JSON.parse(results.body, symbolize_names: true)
  end
end

require 'mjolnir'

# The configuration class is for search
module ElasticSearchRailsHelper
  # Load elastic search configuration parameters from elastic_search.yml
  class SearchConfiguration < Mjolnir::Core::YamlConfiguration
    attr_reader :shards, :replicas, :analyzer,
                :host, :prefix, :log

    # rubocop:disable all
    def initialize
      config = load('elastic_search')
      @host = ENV['ELASTIC_SEARCH_URL'] || config['host'] || 'http://localhost:9200'
      @prefix = config['prefix'] || 'esrh_'
      @shards = config['shards'] || 5
      @replicas = config['replicas'] || 0
      @analyzer = config['analyzer'] || 'snowball'
      @log = config['log'] || false
    end
    # rubocop:enable all
  end
end

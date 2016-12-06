require 'elasticsearch'
require 'elasticsearch/model'

config = ElasticSearchRailsHelper::SearchConfiguration.instance
Elasticsearch::Model.client = Elasticsearch::Client.new(host: config.host, log: config.log)

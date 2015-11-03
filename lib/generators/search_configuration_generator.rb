# This generator produces a YAML file for connecting to ElasticSearch. It should
# remain pretty much fixed, but may be altered for some deployments
class SearchConfigurationGenerator < Rails::Generators::Base
  desc 'This generator creates an yml file in config/'

  CONFIGURATION = <<END
defaults: &defaults
  prefix: 'my_rails_app'
  shards: 5
  replicas: 0
  analyzer: snowball
  log: false

development:
  <<: *defaults
  host: http://localhost:9200
  log: false
  logging:
    file: 'log/elasticsearch.log'
    level: 'debug'

test:
  <<: *defaults
  host: http://localhost:9200
  log: true
  logging:
    file: 'log/elasticsearch.log'
    level: 'debug'

uat:
  <<: *defaults

staging:
  <<: *defaults

production:
  <<: *defaults
END

  def create_initializer_file
    create_file('config/elastic_search.yml', CONFIGURATION)
  end
end

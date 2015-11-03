$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'elastic_search_rails_helper/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'elasticsearch-rails-helper'
  s.version     = ElasticSearchRailsHelper::VERSION
  s.authors     = ['Chris Manouvrier', 'Shirren Premaratne', 'Leslie Fung']
  s.email       = ['shirren@filmpond.com']
  s.homepage    = 'https://github.com/shirren/elasticsearch-rails-helper'
  s.summary     = 'Helper raps the Ruby elastic search engine in a gem'
  s.description = 'Helper raps the Ruby elastic search engine in a gem'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']
end

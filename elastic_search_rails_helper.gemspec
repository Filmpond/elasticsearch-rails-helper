$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'elastic_search_rails_helper/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'elastic_search_rails_helper'
  s.license     = "MIT"
  s.version     = ElasticSearchRailsHelper::VERSION
  s.authors     = ['Chris Manouvrier', 'Shirren Premaratne', 'Leslie Fung']
  s.email       = ['shirren@filmpond.com']
  s.homepage    = 'https://github.com/shirren/elasticsearch-rails-helper'
  s.summary     = 'Helper raps the Ruby elastic search engine in a gem'
  s.description = 'This engine provides a simple active model concern which allows a ' +
                  'class to mixin generic elastic search functionality.'
  s.files       = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']

  s.add_runtime_dependency 'rails', '~> 4.2'
  s.add_runtime_dependency 'elasticsearch-model', '~> 5.0'
  s.add_runtime_dependency 'elasticsearch', '~> 5.0'

  s.add_development_dependency 'byebug'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2'
  s.add_development_dependency 'rspec-rails', '~> 3.2'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3', '~> 1.3'
end

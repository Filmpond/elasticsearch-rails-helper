class Post < ActiveRecord::Base
  include ElasticSearchRailsHelper::Searchable

  mapping dynamic: 'false' do
    indexes :title, type: 'text', boost: 10, analyzer: 'snowball'
    indexes :body,  type: 'text', analyzer: 'snowball'
  end

  def as_indexed_json(_options = {})
    as_json(only: %w(title body))
  end

  after_save on: [:create, :update] do
    __elasticsearch__.index_document
  end

  after_destroy do
    __elasticsearch__.delete_document
  end
end

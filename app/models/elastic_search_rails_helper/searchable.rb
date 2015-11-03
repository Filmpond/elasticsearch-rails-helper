# Root ElasticSearchRailsHelper namespace
module ElasticSearchRailsHelper
  # Including this module adds generic functionality for elastic search
  module Searchable
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model

      # Set the defaults
      index_name "#{SearchConfiguration.instance.prefix}#{Rails.env}"

      settings index: {
        number_of_shards: SearchConfiguration.instance.shards,
        number_of_replicas: SearchConfiguration.instance.replicas,
        analysis: {
          analyzer: {
            default: {
              type: SearchConfiguration.instance.analyzer
            }
          }
        }
      } do
      end
    end

    # When this module is included, Ruby checks to see if the method as_indexed_json
    # is implemented. This needs to be implemented so the object can be uploaded to
    # elastic search
    def self.included(klass)
      if klass.instance_methods(false).include?(:as_indexed_json)
        fail ElasticSearchRailsHelperInclude, 'Missing overwritten as_indexed_json'
      end
      klass.extend(ClassMethods)
    end

    # The following methods are added to the included class
    module ClassMethods
      # In the unlikely event you still want to order your objects using
      # the primary key in your database. Not sure if we should keep this method
      def order_by_ids(ids)
        if ids.count > 0
          order_by = ['case']
          ids.each_with_index.map do |id, index|
            order_by << "WHEN id='#{id}' THEN #{index}"
          end
          order_by << 'end'
          order(order_by.join(' '))
        else
          order('updated_at DESC')
        end
      end
    end
  end
end

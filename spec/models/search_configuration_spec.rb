require 'spec_helper'

# Specs for search engine
module ElasticSearchRailsHelper
  describe SearchConfiguration do
    subject(:config) { SearchConfiguration.instance }

    it { is_expected.to respond_to(:shards) }
    it { is_expected.to respond_to(:replicas) }
    it { is_expected.to respond_to(:analyzer) }
    it { is_expected.to respond_to(:host) }
    it { is_expected.to respond_to(:prefix) }
    it { is_expected.to respond_to(:log) }

    context 'with no configuration file' do
      it 'should specify some defaults' do
        expect(config.shards).to eq(5)
        expect(config.replicas).to eq(0)
        expect(config.analyzer).to eq('snowball')
        expect(config.host).to eq('http://localhost:9200')
        expect(config.prefix).to eq('esrh_')
        expect(config.log).to_not be_truthy
      end
    end
  end
end

require 'spec_helper'

describe Post do
  subject(:post) { build(:basic_post) }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:body) }

  it { is_expected.to respond_to(:as_indexed_json) }

  context 'which is indexed' do
    before(:each) do
      Post.__elasticsearch__.create_index! force: true
    end

    describe 'for a job' do
      before(:each) do
        @post = create(:basic_post)
      end

      it 'should add the post to the index' do
        Post.__elasticsearch__.refresh_index!
        expect(Post.search('basic').results.total).to eq(1)
      end

      it 'should refresh when edited' do
        @post.title = 'AA'
        @post.save
        Post.__elasticsearch__.refresh_index!
        expect(Post.search('AA').results.total).to eq(1)
      end

      it 'should remove the post from the index when deleted' do
        @post.destroy
        Post.__elasticsearch__.refresh_index!
        expect(Post.search('*').results.total).to eq(0)
      end
    end

    it 'should sort results by boosting scores' do
      create(:basic_post)
      create(:not_basic_post)
      Post.__elasticsearch__.refresh_index!
      expect(Post.search('basic').to_a.map(&:title)).to eq(['Test Name basic', 'Test Name'])
    end

    it 'should sort results by boosting scores when using active record and order_by_ids' do
      create(:basic_post)
      create(:not_basic_post)
      Post.__elasticsearch__.refresh_index!
      ids = Post.search('basic').results.map(&:_id)
      expect(Post.where(id: ids).order_by_ids(ids).map(&:title)).to eq(['Test Name basic', 'Test Name'])
    end
  end
end

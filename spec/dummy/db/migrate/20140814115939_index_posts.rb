class IndexPosts < ActiveRecord::Migration
  def change
    Post.import force: true
  end
end

migration_superclass = if ActiveRecord::VERSION::MAJOR >= 5
  ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
else
  ActiveRecord::Migration
end

class CreateBlogEntries < migration_superclass
  def up
    create_table :spree_blog_entries do |t|
      t.string   :title
      t.text     :body
      t.string   :permalink
      t.boolean  :visible, default: false
      t.datetime :published_at
      t.text     :summary
      t.integer  :author_id
      t.timestamps
    end
    add_index :spree_blog_entries, :author_id
  end

  def down
    drop_table :spree_blog_entries
  end
end

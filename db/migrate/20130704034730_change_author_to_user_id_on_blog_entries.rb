migration_superclass = if ActiveRecord::VERSION::MAJOR >= 5
  ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
else
  ActiveRecord::Migration
end

class CreateCkeditorAssets < migration_superclass
  def up
    remove_column :spree_blog_entries, :author
    add_column :spree_blog_entries, :author_id, :integer
    add_index :spree_blog_entries, :author_id
    Spree::Role.create!(:name => "blogger") unless Spree::Role.where(:name => "blogger").any?
  end
  def down
    add_column :spree_blog_entries, :author, :string
    remove_column :spree_blog_entries, :author_id
    Spree::Role.where(:name => "blogger").destroy_all
  end
end

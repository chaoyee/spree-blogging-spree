migration_superclass = if ActiveRecord::VERSION::MAJOR >= 5
  ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
else
  ActiveRecord::Migration
end

class CreateCkeditorAssets < migration_superclass
  def change
    add_column :spree_blog_entries, :author, :string
  end
end

migration_superclass = if ActiveRecord::VERSION::MAJOR >= 5
  ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
else
  ActiveRecord::Migration
end

class CreateRoleBlogger < migration_superclass
  def up
    Spree::Role.create!(name: "blogger") unless Spree::Role.where(name: "blogger").any?
  end
  def down
    Spree::Role.where(name: "blogger").destroy_all
  end
end

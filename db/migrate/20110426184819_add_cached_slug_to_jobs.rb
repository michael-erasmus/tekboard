class AddCachedSlugToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :cached_slug, :string
  end

  def self.down
    remove_column :jobs, :cached_slug
  end
end

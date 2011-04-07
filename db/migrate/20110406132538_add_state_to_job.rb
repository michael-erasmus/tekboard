class AddStateToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :state, :string
  end

  def self.down
    remove_column :jobs, :state
  end
end

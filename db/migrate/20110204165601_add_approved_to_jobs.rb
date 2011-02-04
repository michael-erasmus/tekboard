class AddApprovedToJobs < ActiveRecord::Migration
  def self.up
      add_column :jobs, :approved, :boolean
  end

  def self.down
    remove_column :jobs, :approved
  end
end

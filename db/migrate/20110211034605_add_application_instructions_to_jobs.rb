class AddApplicationInstructionsToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :application_instructions, :text
  end

  def self.down
    remove_column :jobs, :application_instructions
  end
end

class AddActivatedDateToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :activated_date, :timestamp
  end

  def self.down
    remove_column :jobs, :activated_date
  end
end

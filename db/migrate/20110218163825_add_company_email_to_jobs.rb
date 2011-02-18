class AddCompanyEmailToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :company_email, :string
  end

  def self.down
    remove_column :jobs, :company_email
  end
end

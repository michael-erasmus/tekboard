class AddCompanyLinkToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :company_link, :string
  end

  def self.down
    remove_column :jobs, :company_link 
  end
end

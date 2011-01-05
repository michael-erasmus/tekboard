class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|

      t.string :title
      t.string :location
      t.string :company
      t.text :description


      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end

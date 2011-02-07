class Job < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "200x200>", :thumb => "100x100>" }

  def self.latest_approved
    self.where("created_at > ? AND approved = ?", 5.days.ago, true)
  end  
end

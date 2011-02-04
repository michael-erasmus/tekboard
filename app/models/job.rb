class Job < ActiveRecord::Base
  def self.latest_approved
    self.where("created_at > ? AND approved = ?", 5.days.ago, true)
  end  
end

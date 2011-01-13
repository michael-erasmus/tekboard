class Job < ActiveRecord::Base
  def self.latest
    self.where("created_at > ?", 5.days.ago)
  end
end

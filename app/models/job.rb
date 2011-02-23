class Job < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "200x200>", :thumb => "100x100>" }
  validates :title, :presence => true
  validates :location, :presence => true
  validates :description, :presence => true
  validates :application_instructions, :presence => true
  validates :company, :presence => true
  validates :company_link, :presence => true
  validates :company_email, :presence => true

  def self.latest_approved
    self.where("created_at > ? AND approved = ?", 5.days.ago, true)
  end  
end

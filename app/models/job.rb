class Job < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "200x200>", :thumb => "100x100>" }
  validates :title, :presence => true
  validates :location, :presence => true
  validates :description, :presence => true
  validates :application_instructions, :presence => true
  validates :company, :presence => true
  validates :company_link, :presence => true
  validates :company_email, :presence => true

  before_save :set_activation_date

  def self.active
    self.where(:state => 'active', :activated_date=> (Time.now.midnight - 30.days)..Time.now)
  end

  def has_logo?()
    logo.file?
  end

  private
  def set_activation_date
    self.activated_date = Time.now if state == 'active'
  end
end

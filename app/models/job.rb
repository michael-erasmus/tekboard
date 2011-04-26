class Job < ActiveRecord::Base
  has_attached_file :logo, 
    :styles => { :medium => "200x200>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/:style/:id/:filename"

  validates :title, :presence => true
  validates :location, :presence => true
  validates :description, :presence => true
  validates :application_instructions, :presence => true
  validates :company, :presence => true
  validates :company_link, :presence => true
  validates :company_email, :presence => true, 
     :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }                 

  before_save :set_activation_date
  after_save :mail_if_active

  def self.active
    self.where(:state => 'active', :activated_date=> (Time.now.midnight - 30.days)..Time.now)
  end

  def self.expired
    self.where('state = ? and activated_date < ?','active', (Time.now.midnight - 30.days))
  end

  def has_logo?()
    logo.file?
  end

  def company_link_url
    company_link.include?("http://") ? company_link : "http://#{company_link}"
  end

  private
  def set_activation_date
    self.activated_date = Time.now if state == 'active'
  end

  def mail_if_active
    JobsMailer.active_job(self).deliver if state == 'active'
  end
end

require 'twitter'

class Job < ActiveRecord::Base
  #Important - protected fields from mass assignment here
  attr_protected :state, :activated_date
  
  has_attached_file :logo, 
    :styles => { :medium => "200x200>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/:style/:id/:filename"

  has_friendly_id :company_and_title, :use_slug => true

  validates :title, :presence => true
  validates :location, :presence => true
  validates :description, :presence => true
  validates :application_instructions, :presence => true
  validates :company, :presence => true
  validates :company_link, :presence => true
  validates :company_email, :presence => true, 
     :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }                 

  before_save do |j|
      j.activated_date = Time.now if j.is_active? && j.state_changed?
  end

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

  def is_active?
    state == 'active'
  end
  
  def company_and_title
    "#{company} #{title}"
  end

  def tweet
    #Twitter.update("#{company_and_title} http://techboard.co.za/jobs/#{cached_slug}")
    bitly = Bitly.new('techboard','R_17b2bf51119ed9aa76f1175d47e9a60f')
    short_url = bitly.shorten("http://techboard.co.za/jobs/#{cached_slug}") 
    
    Twitter.update(company_and_title + ' ' + short_url.shorten)
  end
end

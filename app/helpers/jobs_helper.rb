module JobsHelper
  def friendly_date_ago(job)
    time_ago_in_words(job.created_at)
  end

  def back_home
    link_to "Click here to go back to the home page", :action => "index" 
  end
end

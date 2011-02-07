module JobsHelper
  def friendly_date_ago(job)
    time_ago_in_words(job.created_at)
  end
end

xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "techboard.co.za"
    xml.description "Only the best tech jobs in South Africa. No recruitment agents."
    xml.link jobs_url 

    for job in @jobs
      xml.item do
        xml.title "#{job.title} at #{job.company}"
        xml.description job.description
        xml.pubDate job.activated_date.to_s(:rfc822)
        xml.link job_url(job)
        xml.guid job_url(job)
      end
    end
  end
end

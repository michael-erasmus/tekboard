task :active_jobs => :environment do
  Job.active.each{|j| puts j.title }
end

task :expired_jobs => :environment do
  Job.expired.each{|j|puts j.title}
end

module Whenever
  
  def self.cron(options)
    Whenever::JobList.new(options).generate_cron_output
  end
  
  def self.path
    Rails.root if defined?(Rails)
  end

end
class SampleJob
  include Sidekiq::Job

  def perform(*args); end
end

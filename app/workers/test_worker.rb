class TestWorker
  include Sidekiq::Worker

  def perform
    Post.create(title: "Blogging at #{Time.current}")
  end
end

class SendEmailsWorker
  include Sidekiq::Worker

  def perform comment_id
    comment = Comment.find comment_id
    CommentsMailer.sent_email_comment(comment).deliver_now
  end
end

class CommentsMailer < ApplicationMailer
  def sent_email_comment comment
    @current_user = comment.user
    mail to: comment.review.user.email, subject: t("email_comment.subject")
  end
end

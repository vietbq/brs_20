class Admin::RequestMailer < ApplicationMailer

  def respond_request request
    @request = request
    mail to: request.user.email, subject: "Respont request a new book"
  end
end

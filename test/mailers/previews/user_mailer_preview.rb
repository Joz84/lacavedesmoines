class UserMailerPreview < ActionMailer::Preview
  def confirmation
    order = Order.first
    UserMailer.confirmation(order)
  end
end

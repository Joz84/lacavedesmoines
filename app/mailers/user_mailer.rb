class UserMailer < ApplicationMailer
  def confirmation(order)
    @user = order.user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Votre commande sur la cave des moînes')
  end
end

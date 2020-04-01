class OrderMailer < ApplicationMailer
  default from: 'Jay Jay <jay@example.com>'

  def received(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end

  def error(order, payment_method)
    @order = order
    @payment_method = payment_method
    mail to: order.email, subject: 'Order not placed'
  end
end

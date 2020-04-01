require 'ostruct'

class Pago
  # note: order_id is not yet in use
  def self.make_payment(order_id:, payment_method:, payment_details:)
    case payment_method
    when :check
      Rails.logger.info 'Processing check: ' +
        payment_details.fetch(:routing).to_s + '/' +
        payment_details.fetch(:accounting).to_s
    when :credit_card
      Rails.logger.info 'Procesing credit card: ' +
        payment_details.fetch(:cc_num).to_s + '/' +
        payment_details.fetch(:expiration_month).to_s + '/' +
        payment_details.fetch(:expiration_year).to_s
    when :po
      Rails.logger.info 'Processing purchase order: ' +
        payment_details.fetch(:po_num).to_s
    else
      Rails.logger.info "Unknown payment type: #{payment_method}"
      OpenStruct.new(succeeded?: false)
    end

    sleep 3 unless Rails.env.test?
    Rails.logger.info 'Done processing Payment'
    OpenStruct.new(succeeded?: true)
  end
end

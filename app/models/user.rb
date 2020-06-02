class User < ApplicationRecord
  has_secure_password

  after_destroy :ensure_an_admin_remains

  before_validation :current_password_is_valid, on: :update
  validate :current_password_is_valid, if: -> { password.present? }, on: :update
  validates :name, presence: true, uniqueness: true

  attr_accessor :current_password

  class Error < StandardError
  end

  def ensure_an_admin_remains
    raise Error.new("Can't delete last user") if User.count.zero?
  end

  def current_password_is_valid
    # pp password
    # pp current_password
    #
    # if password_digest_changed?
    #   errors.add(:current_password, 'is not valid') unless current_password == password
    # end
  end
end

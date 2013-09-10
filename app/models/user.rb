class User < ActiveRecord::Base
  attr_accessor :unencrypted_password, :password_confirmation

  belongs_to :domain

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false, scope: :domain_id }, email: true
  validates :unencrypted_password, presence: true, on: :create
  validate :check_password_confirmation
  validate :check_if_email_match_domain

  before_save :encrypt_password

  delegate :name, to: :domain, prefix: true

  private

  def check_password_confirmation
    if password_confirmation != unencrypted_password
      errors.add(:password_confirmation, I18n.t('activerecord.errors.messages.password_confirmation'))
    end
  end

  def check_if_email_match_domain
    unless email.ends_with? "@#{domain_name}"
      errors.add(:email, I18n.t('activerecord.errors.messages.does_not_match_domain'))
    end
  end

  def encrypt_password
    unless unencrypted_password.blank?
      query = "SELECT ENCRYPT('#{unencrypted_password}', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16)))"
      self.password = ActiveRecord::Base.connection.execute(query).first.first
    end
  end
end

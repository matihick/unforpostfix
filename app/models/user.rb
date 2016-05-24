 class User < ActiveRecord::Base
  attr_accessor :unencrypted_password, :password_confirmation

  belongs_to :domain
  belongs_to :role, primary_key: :code, foreign_key: :role_code

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false, scope: :domain_id }, email: true
  validates :unencrypted_password, presence: true, on: :create
  validate :check_password_confirmation
  validate :check_if_email_match_domain

  before_save :encrypt_password
  before_create :set_defaults

  delegate :name, to: :domain, prefix: true

  scope :enabled, -> { where({ enabled: true }) }

  default_scope -> { order(:name) }

  def limited?
    (role_code == 'limited') || role_code.blank?
  end

  def has_role?(input_role_code)
    input_role_code.to_s == role_code
  end

  def authenticate(supplied_password)
    query = "SELECT ENCRYPT('#{supplied_password}', '#{password}')"
    encrypted_password = ActiveRecord::Base.connection.execute(query).first.first

    encrypted_password == password
  end

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

  def set_defaults
    self.role_code = 'limited' if role_code.blank?

    true
  end
end

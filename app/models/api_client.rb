class ApiClient < ApplicationRecord
  before_save :set_defaults

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :enabled, -> { where(enabled: true) }
  scope :disabled, -> { where(enabled: [false, nil]) }

  private

  def set_defaults
    if access_token.blank?
      begin
        self.access_token = SecureRandom.urlsafe_base64(70)
      end while self.class.exists?(access_token: access_token)
    end
  end
end

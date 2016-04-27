class ApiClient < ActiveRecord::Base
  before_save :set_defaults

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private

  def set_defaults
    if access_token.blank?
      begin
        self.access_token = SecureRandom.hex(70)
      end while self.class.exists?(access_token: access_token)
    end
  end
end

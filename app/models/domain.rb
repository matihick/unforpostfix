class Domain < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }, domain: true

  has_many :aliases, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :recipient_bccs, dependent: :destroy
  has_many :sender_bccs, dependent: :destroy

  default_scope order(:name)

  def has_data?
    aliases.any? || users.any? || recipient_bccs.any? || sender_bccs.any?
  end
end

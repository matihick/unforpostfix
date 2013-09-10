class Domain < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }, domain: true

  has_many :aliases, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :recipient_bccs, dependent: :destroy
  has_many :sender_bccs, dependent: :destroy
end

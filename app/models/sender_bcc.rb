class SenderBcc < ActiveRecord::Base
  belongs_to :domain

  validates :from, presence: true, uniqueness: { case_sensitive: false }, email: true
  validates :to, presence: true, email: true
  validate :check_if_from_match_domain

  delegate :name, to: :domain, prefix: true

  private

  def check_if_from_match_domain
    unless from.ends_with? "@#{domain_name}"
      errors.add(:from, I18n.t('activerecord.errors.messages.does_not_match_domain'))
    end
  end
end

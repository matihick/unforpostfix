class Alias < ActiveRecord::Base
  belongs_to :domain

  validates :from, presence: true, uniqueness: { case_sensitive: false }, email: true
  validates :to, presence: true, email_list: true
  validate :check_if_from_match_domain
  validate :from_and_to_are_different

  delegate :name, to: :domain, prefix: true

  scope :enabled, -> { where({ enabled: true }) }

  default_scope -> { order(:from) }

  before_validation :normalize_recipients

  def recipients
    to.split(',')
  end

  private

  def normalize_recipients
    self.to = to.strip.gsub(/\r\n?/, ",").gsub(';',',')
    self.to = to.split(',').map(&:strip).reject(&:empty?).uniq.sort.join(',')
  end

  def from_and_to_are_different
    if recipients.include?(from)
      errors.add(:to, I18n.t('activerecord.errors.messages.has_to_be_different'))
    end
  end

  def check_if_from_match_domain
    unless from.ends_with? "@#{domain_name}"
      errors.add(:from, I18n.t('activerecord.errors.messages.does_not_match_domain'))
    end
  end
end

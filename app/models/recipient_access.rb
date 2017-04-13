class RecipientAccess < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :status, presence: true

  before_save :set_rule

  private

  def set_rule
    if status == 'ok'
      self.rule = 'OK'
    elsif status == 'reject'
      if reject_note.present?
        self.rule = "REJECT #{reject_note}"
      else
        self.rule = 'REJECT you are not allowed!'
      end
    else
      raise 'invalid status!'
    end
  end
end

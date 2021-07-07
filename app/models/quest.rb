class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :records, dependent: :destroy

  validates :quest_title, presence: true
  validate :start_end_check

  enum quest_status: { 未: 0, 進行中: 1, 完了: 2 }

  def start_end_check
    if start_date.present? && end_date.present?
      if self.start_date > self.end_date
        errors.add(:end_date, "は開始日より前の日付で登録できません。")
      end
    end
  end

end

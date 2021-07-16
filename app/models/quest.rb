class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :quest_title, presence:{ message: 'は１文字以上入力してください。' }
  validate :start_end_check
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0
  }

  scope :active, -> { where(is_paid: false) }

  enum quest_status: { 未契約: 0, 進行中: 1, 完了: 2 }
  enum is_paid: { 未決済: false, 支払い済み: true }

  # 開始日より終了日が早い日付ならエラーメッセージを返す
  def start_end_check
    errors.add(:end_date, 'は開始日より前の日付で登録できません。') if start_date.present? && end_date.present? && (start_date > end_date)
  end
end

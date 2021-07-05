class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :records, dependent: :destroy

  validates :quest_title, presence: true
  # validate :start_end_check

  enum quest_status: { 未: 0, 進行中: 1, 完了: 2 }

end

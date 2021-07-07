class List < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :quests, dependent: :destroy

end

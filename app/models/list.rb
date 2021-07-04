class List < ApplicationRecord
  belongs_to :user
  has_many :quests, dependent: :destroy

end

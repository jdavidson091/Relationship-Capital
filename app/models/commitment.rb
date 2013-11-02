class Commitment < ActiveRecord::Base
  validates :overseer_user_id, presence: true
  validates :date_end, presence: true
  validates :description, presence: true
  validates :score_weight, presence: true
end

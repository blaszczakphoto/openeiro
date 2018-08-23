class User < ApplicationRecord
  validates :uuid, presence: true
  validates :registration_id, presence: true
end

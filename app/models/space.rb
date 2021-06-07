class Space < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user }

  belongs_to :user
  has_many :tasks, dependent: :destroy
end

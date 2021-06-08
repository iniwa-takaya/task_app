class Task < ApplicationRecord
  belongs_to :user
  belongs_to :space

  with_options presence: true do
    validates :content
    validates :deadline
  end
end

class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :clickbait?

  CLICKBAIT_PATTERNS = [
    "Won't Believe",
    "Secret",
    "Top [number]",
    "Guess"
  ]

  def clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| title&.match pat }
      errors.add(:title, "must be clickbait")
    end
  end
end
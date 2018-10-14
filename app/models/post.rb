class Post < ActiveRecord::Base

  validate :title_is_present
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # , message: "%{value} is not a valid size" }

    def title_is_present
      if !title.present?
        errors.add(:title, "title can't be empty")
      end
      if title.present? && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        errors.add(:title, "this title is not clickbait")
      end
    end
end

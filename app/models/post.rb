class Post < ApplicationRecord 
    validates :title, presence: true
    validate :clickbait_title
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 } 
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "is not included in the list" }

    private 

    def clickbait_title 
        unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
            errors.add(:title, "must be sufficiently clickbait-y")
        end
    end 
end

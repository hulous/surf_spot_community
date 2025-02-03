class Spot < ApplicationRecord
  # belongs_to :user

  enum :difficulty, {
    beginner: "beginner",
    intermediate: "intermediate",
    pro: "pro"
  }

  enum :best_season, {
    spring: "spring",
    summer: "summer",
    autumn: "autumn",
    winter: "winter"
  }
end

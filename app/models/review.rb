class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  STARS = [1, 2, 3, 4, 5]
  validates :stars, inclusion: {
  	within: STARS,
  	message: "must be between 1 and 5"
  }
end

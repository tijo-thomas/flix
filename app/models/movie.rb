class Movie < ActiveRecord::Base

	validates :title, :released_on, :duration, presence: true
	validates :title, presence: true, uniqueness: true
	validates :slug, uniqueness: true
	validates :description, length: { minimum: 25 }
	validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
	validates :image_file_name, allow_blank: true, format: {
		with: 		/\w+\.(gif|jpg|png)\z/i,
		message:  "must reference a GIF, JPG, or PNG image"
	}
	# Array constant that contains all possibile ratings.
	RATINGS = %w(G PG PG-13 R NC-17) 
	validates :rating, inclusion: { within: RATINGS }

	has_many :favorites, dependent: :destroy
	has_many :fans, through: :favorites, source: :user
	has_many :critics, through: :reviews, source: :user
	has_many :reviews, dependent: :destroy
	has_many :characterizations, dependent: :destroy
	has_many :genres, through: :characterizations

	before_validation :generate_slug

	scope :released, -> { where("released_on <= ?", Time.now).order(released_on: :desc) }
	scope :hits, -> { released.where("total_gross >= 300000000").order(total_gross: :desc) }
	scope :flops, -> { released.where("total_gross <= 50000000").order(total_gross: :asc) }
	scope :upcoming, -> { where("released_on > ?", Time.now).order(released_on: :asc) }
	scope :rated, ->(rating) { released.where(rating: rating)}
	scope :recent, ->(max=5) { released.limit(max) }
	scope :grossed_less_than, ->(amount) { released.where("total_gross < ?", amount) }
	scope :grossed_greater_than, ->(amount) { released.where("total_gross > ?", amount) }

	def flop?
		total_gross.blank? || total_gross < 50000000
	end

	# def self.released
	# 	where("released_on <= ?", Time.now).order("released_on desc")
	# end

	# def self.hits
	# 	where("total_gross >= 300000000").order("total_gross desc")
	# end

	# def self.flops
	# 	where("total_gross <= 50000000").order("total_gross asc")
	# end

	def self.recently_added
		order("created_at desc").limit(3)
	end

	# Returns the average review score for the movie.
	def average_stars
		reviews.average(:stars)
	end

	# Returns the 2 most recently posted reviews for the movie.
	def recent_reviews
		reviews.order("created_at desc").limit(2)
	end

	def to_param
		slug
	end

	# If the value of self.slug is undefined, nil, or false,
	# evaluate 'title.parameterize' and set self.slug to that
	# value, but only if there is a title.
	def generate_slug
		self.slug ||= title.parameterize if title
	end
end
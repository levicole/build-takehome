class Vegetable < ApplicationRecord
  has_many :ratings

  def average_rating
    number_of_ratings = ratings.count
    total = 0

    ratings.each do |rating|
      total += rating.value
    end

    total/number_of_ratings
  end

  def as_json(options = {})
    super(options).merge(average_rating: average_rating)
  end
end

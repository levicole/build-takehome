class Vegetable < ApplicationRecord
  has_many :ratings

  def average_rating
    ratings.average(:value)
  end

  def as_json(options = {})
    super(options).merge(average_rating: average_rating)
  end
end

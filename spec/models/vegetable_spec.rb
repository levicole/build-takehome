require 'rails_helper'

describe Vegetable do
  subject do
    Vegetable.create(name: "Cucumber")
  end

  describe "#average_rating" do
    let(:ratings) { [ 5, 4, 3 ] }
    before do
      user = User.create(name: "Levi", email: "lckennedy@gmail.com")
      ratings.each do |rating|
        subject.ratings.create(value: rating, user: user)
      end
    end

    it "produces an average of all ratings" do
      avg = ratings.reduce(0, :+)/ratings.count
      expect(subject.average_rating).to eq(avg)
    end
  end
end

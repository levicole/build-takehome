require 'rails_helper'

describe User do
  context "Validations" do
    context "email uniqueness" do
      subject do
        User.new(email: "Levi@levi.com")
      end

      before do
        User.create(email: "levi@levi.com", name: "Levi")
      end

      it { is_expected.to_not be_valid }
    end
  end
end

require 'rails_helper'

describe Comment do
  describe '#create' do
    it "is valid with a comment" do
      comment = build(:comment)
      expect(comment).to be_valid
    end
    it "is invalid without a comment" do
      comment = build(:comment, comment: "")
      comment.valid?
      expect(comment.errors[:comment]).to include("を入力してください")
    end
  end
end

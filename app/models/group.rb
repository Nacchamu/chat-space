class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users ,foreign_key: 'group_id'
  has_many :comments

  accepts_nested_attributes_for :users

  validates :name, presence: true


  def last_comment
    comments.last.try(:comment) || 'メッセージはまだありません'
  end

end

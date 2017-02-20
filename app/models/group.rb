class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_users
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users
  has_many :messages

  def new_message
    if messages.blank?
      "まだメッセージはありません。"
    elsif messages.last[:image]
        "画像が投稿されました。"
    else
      messages.last[:body]
    end
  end
end

class Message < ApplicationRecord
  validates :body, presence: true

  belongs_to :group
  belongs_to :user

 mount_uploader :image, ImageUploader
end

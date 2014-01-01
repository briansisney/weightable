class Weight < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  mount_uploader :pic, ImageUploader
end

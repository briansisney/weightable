class Comment < ActiveRecord::Base
  belongs_to :weight
  belongs_to :user
end

class Weight < ActiveRecord::Base
  belongs_to :user_weight
  belongs_to :user, :through :user_weight
  
  has_many :comments
end

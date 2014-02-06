class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :weights
  has_many :comments, through: :weights

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "confirmed = 0"  # assuming 0 means 'pending'

  mount_uploader :pic, ImageUploader

  def self.bmi(user)
    if user.weights.last && user.height_feet && user.height_in
      current_weight=user.weights.last.weight.to_f
      height_in_inches = (user.height_feet.to_f*12)+user.height_in.to_f
      ((current_weight*703)/(height_in_inches**2)).round(2)
    else
      "bmi not available"
    end
  end

  def self.bmi_translate(bmi)
     case bmi
       when 0.0..18.4
        "underweight"
       when 18.5..24.9
        "normal weight"
       when 25.0..29.9
        "overweight"
       when 30.0..100
        "obese"
       else 
        "n/a"
     end
  end

end

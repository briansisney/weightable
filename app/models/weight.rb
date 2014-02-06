class Weight < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  mount_uploader :pic, ImageUploader

  def self.weight_records(user)
    self.where(user_id: user).order(created_at: :desc)
  end

  def self.chart_headers(records)
    array = []
    records.limit(5).each do |record|
      array << record["date"]
    end
    array.reverse
  end

  def self.chart_data(records)
    array = []
    records.limit(5).each do |record|
      array << record["weight"]
    end
    array.reverse
  end

end



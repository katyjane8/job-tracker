class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.location
    order("city ASC")
  end

  def self.interest
    order("level_of_interest DESC")
  end

  def self.count_of_jobs_by_interest
    group(:level_of_interest).order("level_of_interest DESC").count(:id)
  end

  def self.count_by_city
    group(:city).order("count(city) DESC").count(:id)
  end

  def self.city(city)
    where(city: city)
  end 
end

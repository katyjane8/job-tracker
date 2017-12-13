class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.top_three_companies
    joins(:jobs).select("AVG(jobs.level_of_interest) AS avg_interest, companies.name")
    .group("companies.name").order("avg_interest DESC").limit(3)
  end
end

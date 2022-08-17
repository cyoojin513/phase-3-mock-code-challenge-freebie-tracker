class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    devId = Dev.find_by(name: dev).id
    Freebie.create(
      company_id: self.id,
      dev_id: devId, 
      item_name: item_name,
      value: value
    )
  end

  def self.oldest_company
    earliestYear = self.all.pluck(:founding_year).min
    self.all.where("founding_year = ?", earliestYear)
  end
end

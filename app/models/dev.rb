class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    self.freebies.pluck(:item_name).include?(item_name)
  end

  def give_away(dev, freebie)
    devId = Dev.find_by(name: dev).id
    belongItem = self.freebies.find_by("item_name = ?", freebie)
    belongItem ? belongItem.update(dev_id: devId) : "no item be found"
  end
end

puts "Creating companies..."
Company.create(name: "Google", founding_year: 1998)
Company.create(name: "Facebook", founding_year: 2004)
Company.create(name: "Dunder Mifflin", founding_year: 2002)
Company.create(name: "Enron", founding_year: 1995)

puts "Creating devs..."
Dev.create(name: "Rick")
Dev.create(name: "Morty")
Dev.create(name: "Mr. Meseeks")
Dev.create(name: "Gazorpazop")

puts "Creating freebies..."

# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************
# Create freebies Here
companyIds = Company.pluck(:id)
devIds = Dev.pluck(:id) 
30.times do
  Freebie.create(
    company_id: companyIds.sample,
    dev_id: devIds.sample,
    item_name: Faker::IndustrySegments.industry,
    value: rand(0..100)
  )
end

puts "Seeding done!"

require 'date'

FactoryBot.define do
  factory :dog do
    sequence :name do |n|
      "Good Pup #{n}"
    end
    user

    after(:build) do |dog|
      dog.images.attach(
        io: File.open(Rails.root.join('spec', 'factories', 'images', 'bowie_toys.jpg')),
        filename: 'bowie_toys.jpeg',
        content_type: 'image/jpeg')
    end
  end

  factory :user do
    sequence :email do |n|
      "user#{n}@gmail.com"
    end
    created_at { DateTime.now() }
    updated_at { DateTime.now() }
    password { "password" }
  end
end

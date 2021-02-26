# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dogs = [
  {
    name: 'Bowie',
    description: 'Bowie dances when he walks'
  },
  {
    name: 'Brownie',
    description: 'Brownie only sits pretty'
  },
  {
    name: 'Jax',
    description: ''
  },
  {
    name: 'Jiro',
    description: 'Jiro takes a long time to destroy his toys'
  },
  {
    name: 'Pete',
    description: 'Pete has a best friend named Lua'
  },
  {
    name: 'Bijou',
    description: 'Bijou is the fluffiest of them all'
  },
    {
    name: 'Britta',
    description: 'Britta has two different colored eyes'
  },
  {
    name: 'Noodle',
    description: 'Noodle is an Instagram celebrity'
  },
  {
    name: 'Stella',
    description: 'Stella loves to dig'
  },
  {
    name: 'Tonks',
    description: 'Tonks loves to run'
  },
]

users = [
  {
    name: 'Ian',
    email: 'ian@gmail.com'
  },
  {
    name: 'Kat',
    email: 'kat@gmail.com'
  },
  {
    name: 'Chloe',
    email: 'chloe@gmail.com'
  },
  {
    name: 'Pip',
    email: 'pip@gmail.com'
  },
  {
    name: 'Stanley',
    email: 'stanley@gmail.com'
  },
  {
    name: 'Dodo',
    email: 'dodo@gmail.com'
  },
  {
    name: 'Mel',
    email: 'mel@gmail.com'
  },
  {
    name: 'Dell',
    email: 'dell@gmail.com'
  },
  {
    name: 'Rachel',
    email: 'rachel@gmail.com'
  },
  {
    name: 'Ross',
    email: 'ross@gmail.com'
  }
]

users.length.times do |i|
  user = users[i]
  date = DateTime.new(20201, 2, 23, 2, 2 , 2)

  user = User.create(
    name: user[:name],
    email: user[:email],
    created_at: date,
    updated_at:date,
    password: 'password'
  )
  user.save!

  dog_info = dogs[i]
  dog = user.dogs.create(name: dog_info[:name], description: dog_info[:description])
  directory_name = File.join(Rails.root, 'db', 'seed', "#{dog_info[:name].downcase}", "*")

  Dir.glob(directory_name).each do |filename|
    if !dog.images.any?{|i| i.filename == filename}
      dog.images.attach(io: File.open(filename), filename: filename.split("/").pop)
      sleep 1
    end
  end
end

# Here is where I will create some seed data to work with and test associations

# Create 2 users

maurice = User.create(name: "Maurice", email: "maurice@maurice.com", password: "password")
kelly = User.create(name: "Kelly", email: "kelly@kelly.com", password: "password")

# Create some savings accounts

SavingsAccount.create(item: "Macbook", price: "1500", priority_level: "Medium", user_id: maurice.id)
SavingsAccount.create(item: "Vacation", price: "2500", priority_level: "High", user_id: maurice.id)

SavingsAccount.create(item: "Louboutin", price: "800", priority_level: "Low", user_id: kelly.id)
SavingsAccount.create(item: "Artwork", price: "450", priority_level: "Medium", user_id: kelly.id)


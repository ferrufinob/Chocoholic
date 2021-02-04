# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat1 = Category.create(name: "Dark Chocolate")
cat2 = Category.create(name: "Milk Chocolate")
cat3 = Category.create(name: "White Chocolate")

user = User.create(name: "Brenda", email: "example@email.com", password: "password")
user2 = User.create(name: "Tom", email: "test@test.com", password: "password")

chocolate = Chocolate.create(brand: "Endangered Species", flavor: "Bold +Silky Dark Chocolate", note: "dairy free", category_id: cat1.id, user_id: user.id)

#how do I find my chocolate's category?
#Chocolate.find(1).category

#how do I find all the chocolates in that category?
#Category.find(1).chocolates

#how do I find all of the reviews I created?
#User.find(1).reviews

#how to I find all the chocolate my review belongs to?
#User.find(1).Review.find(1).chocolate

#how do I find all reviews I recieved on my chocolate?
#User.find(1).chocolates.find(1).reviews

#what is my has many through doing in users(reviews)?
#if i got rid of my through relationship the user can't see the chocolates they reviewed
#provides quicker lookup(instead of user.reviews.chocolate i do => user.reviewed_chocolates)
# user.reviewed_chocolates lists the actual object they reviewed without displaying what they wrote
#has_many reviews => shows their actual review but no info on what chocolate they revieweds

#how do I access the names of those who reviewed my chocolate
#chocolate.reviewers

#how do I find all of my chocolates tasting notes?
#Chocolate.find(1).tasting_notes

#how do I find all the chocolates with the same tasting notes
#TastingNote.find(1).chocolates

#how do I create a review?
# create the review,
#then set the reviews user_id to current user,
#lastly set the reviews chocolate id to the chcolate found by id

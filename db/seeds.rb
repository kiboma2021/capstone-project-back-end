# Seed data for users
User.create(name: "John", email: "john@gmail.com", password: "123#john")
User.create(name: "Bob", email: "bob33@gmail.com", password: "123#Bob")
User.create(name: "Pablo", email: "pablo99@gmail.com", password: "8Bb3#Pablo")
User.create(name: "Alice", email: "alice@example.com", password: "password123")
User.create(name: "Emma", email: "emma@example.com", password: "password456")

# Seed data for books
Book.create(title: "The Power of Habit", price: 20, author: "Charles Duhigg",
            description: "Explores why habits exist and how they can be changed.", year: 2012, rating: 4, user_id: 1)
Book.create(title: "Atomic Habits", price: 25, author: "James Clear",
            description: "Provides strategies for building good habits and breaking bad ones.", year: 2018, rating: 5, user_id: 2)
Book.create(title: "Thinking, Fast and Slow", price: 30, author: "Daniel Kahneman",
            description: "Delves into the two systems that drive the way we think.", year: 2011, rating: 4, user_id: 3)
Book.create(title: "Sapiens: A Brief History of Humankind", price: 18, author: "Yuval Noah Harari",
            description: "Explores the history of humankind.", year: 2014, rating: 4, user_id: 4)
Book.create(title: "The Subtle Art of Not Giving a F*ck", price: 22, author: "Mark Manson",
            description: "Offers a counterintuitive approach to living a good life.", year: 2016, rating: 4, user_id: 5)

# Seed data for join table
FavoriteBook.create(user_id: 1, book_id: 1)
FavoriteBook.create(user_id: 1, book_id: 2)
FavoriteBook.create(user_id: 2, book_id: 3)
FavoriteBook.create(user_id: 2, book_id: 4)
FavoriteBook.create(user_id: 3, book_id: 5)
# Find the user
user = User.find(1)

# Create a FavoriteBook instance with the desired book
favorite_book = FavoriteBook.new(user: user, book: Book.find(3))

# Save the favorite_book instance
favorite_book.save

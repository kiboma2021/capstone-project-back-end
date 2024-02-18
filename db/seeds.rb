# Seed data for users
User.create(name: "John", email: "john@gmail.com", password: "123#john")
User.create(name: "Bob", email: "bob33@gmail.com", password: "123#Bob")
User.create(name: "Pablo", email: "pablo99@gmail.com", password: "8Bb3#Pablo")
User.create(name: "Alice", email: "alice@example.com", password: "password123")
User.create(name: "Emma", email: "emma@example.com", password: "password456")
User.create(name: "Michael", email: "michael@example.com", password: "password789")
User.create(name: "Sophia", email: "sophia@example.com", password: "passwordABC")
User.create(name: "David", email: "david@example.com", password: "passwordDEF")
User.create(name: "Emily", email: "emily@example.com", password: "passwordGHI")
User.create(name: "Daniel", email: "daniel@example.com", password: "passwordJKL")


# Seed data for books
Book.create(title: "The Power of Habit", price: 20, author: "Charles Duhigg", description: "Explores the science behind why habits exist and how they can be changed.", year: 2012, rating: 4, user_id: 1)
Book.create(title: "Atomic Habits", price: 25, author: "James Clear", description: "Provides practical strategies for building good habits, breaking bad ones, and mastering the tiny behaviors that lead to remarkable results.", year: 2018, rating: 5, user_id: 2)
Book.create(title: "Thinking, Fast and Slow", price: 30, author: "Daniel Kahneman", description: "Delves into the two systems that drive the way we think: the fast, intuitive, and emotional System 1, and the slower, more deliberative, and more logical System 2.", year: 2011, rating: 4, user_id: 3)
Book.create(title: "Sapiens: A Brief History of Humankind", price: 18, author: "Yuval Noah Harari", description: "Explores the history of humankind, from the emergence of Homo sapiens in Africa to the present day.", year: 2014, rating: 4, user_id: 4)
Book.create(title: "The Subtle Art of Not Giving a F*ck", price: 22, author: "Mark Manson", description: "Offers a counterintuitive approach to living a good life by embracing adversity and not caring about things that don't truly matter.", year: 2016, rating: 4, user_id: 5)
Book.create(title: "Good to Great: Why Some Companies Make the Leap... and Others Don't", price: 28, author: "Jim Collins", description: "Examines why some companies make the transition from good to great and sustains greatness, while others fail to do so.", year: 2001, rating: 5, user_id: 6)
Book.create(title: "The 7 Habits of Highly Effective People", price: 24, author: "Stephen R. Covey", description: "Presents a holistic, principle-centered approach for solving personal and professional problems.", year: 1989, rating: 4, user_id: 7)
Book.create(title: "The Lean Startup", price: 26, author: "Eric Ries", description: "Introduces the lean startup methodology, which emphasizes rapid iteration, customer feedback, and continuous improvement to create successful businesses.", year: 2011, rating: 4, user_id: 8)
Book.create(title: "Start with Why: How Great Leaders Inspire Everyone to Take Action", price: 23, author: "Simon Sinek", description: "Explores the concept of the 'golden circle' and the importance of starting with 'why' when communicating and leading.", year: 2009, rating: 4, user_id: 9)
Book.create(title: "Rich Dad Poor Dad", price: 21, author: "Robert T. Kiyosaki", description: "Shares personal finance lessons learned from the author's 'rich dad' and 'poor dad' to help readers achieve financial independence.", year: 1997, rating: 4, user_id: 10)

# seed data for join table
FavoriteBook.create(user_id: 1, book_id: 1)
FavoriteBook.create(user_id: 1, book_id: 2)
FavoriteBook.create(user_id: 2, book_id: 3)
FavoriteBook.create(user_id: 2, book_id: 4)
FavoriteBook.create(user_id: 3, book_id: 5)


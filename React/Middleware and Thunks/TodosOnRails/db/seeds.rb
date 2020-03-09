# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

todos = Todo.create(
  [
    { title: 'Play videogames', body: "They're lots of fun, do it!", done: false },
    { title: 'Cook dinner', body: 'Food is an essential part of life', done: false },
    { title: 'Sleep', body: 'Sleep is also an essential part of life', done: false },
    { title: 'Take out trash' },
    { title: 'Take a shower' },
    { title: 'Keep up with the coding', body: "It's tricky, but you can do it!", done: false }
  ]
)

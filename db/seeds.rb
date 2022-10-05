# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Task.create!(
  description: "Read Ailton Krenak's book 'Ideias para adiar o fim do mundo'"
)

Task.create!(
  description: "Read Bell Hooks book 'Tudo Sobre Amor'"
)

Task.create!(
  description: "Re-read John Green's book 'Anthropocene Reviewed'"
)

Task.create!(
  description: "Read Michael Chabon's book 'The Mysteries of Pittsburgh'"
)

Task.create!(
  description: "Watch 'Aronofski's The Whale' movie"
)

Task.create!(
  description: 'Take bicycle to workshop for yearly review'
)

Task.create!(
  completed: true,
  description: 'Take dog for a walk'
)

Task.create!(
  completed: true,
  description: "Read 'Dune'"
)

Task.create!(
  completed: true,
  description: "Vote on Brazil's Election 2022"
)

Task.create!(
  completed: true,
  description: "Pay credit card's invoice"
)

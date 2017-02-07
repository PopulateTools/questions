fixtures_to_load = [
  "decks",
  "questions",
  "options",
  "users",
  "answers"
]

ENV["FIXTURES"] = fixtures_to_load.join(",")
Rake::Task["db:fixtures:load"].invoke

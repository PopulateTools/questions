json.id @question.id
json.title @question.title
json.body @question.body
json.options(@question.options) do |option|
  json.id option.id
  json.value option.value
end

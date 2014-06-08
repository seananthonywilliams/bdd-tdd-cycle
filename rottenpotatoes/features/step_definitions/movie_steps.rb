# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /^the director of "(.*?)" should be "(.*?)"$/ do |arg1, arg2|
  Movie.find_by_title(arg1).director == arg2
  #pending # express the regexp above with the code you wish you had
end


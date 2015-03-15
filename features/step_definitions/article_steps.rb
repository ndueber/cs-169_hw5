Given(/^the following articles exist:$/) do |articles_table|
  articles_table.hashes.each do |hash|
    user = User.find(hash.delete("user_id"))
    article = Article.new(hash.merge(user_id: user.id))
    article.save(validate: false)
    user.articles << article
  end
end

Then /^I merge article "(.*?)"$/ do |article_id|
  step %Q{I fill in "Article ID" with "#{article_id}"}
  step %Q{I press "Merge"}
end

Given /^the article with id "(.*?)" and "(.*?)" are merged$/ do |id1, id2|
    step %Q{I am logged into the admin panel}
    step %Q{I go to the edit page of article given id "3"}
    step %Q{I merge article "4"}
end

Given /the following author of "(.*?)" is "(.*?)"$/ do |article_title, author_name|
  article = Article.find_by_title(article_title)
  assert article.author == author_name
end

Given /the article with id "(.*?)" exists$/ do |article_id|
  assert !!Article.find_by_id(article_id)
end

Given /the article with id "(.*?)" does not exist$/ do |article_id|
  assert !Article.find_by_id(article_id)
end
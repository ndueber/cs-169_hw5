Given(/^the following articles exist:$/) do |articles_table|
  articles_table.hashes.each do |hash|
    user = User.find(hash.delete("user_id"))
    article = Article.new(hash.merge(user_id: user.id))
    article.save(validate: false)
    user.articles << article
  end
end

Then /^merge article "(.*?)"$/ do |article_id|
  step %Q{I fill in "Article ID" with "#{article_id}"}
  step %Q{I press "Merge"}
end
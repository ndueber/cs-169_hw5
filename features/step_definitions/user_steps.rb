When /^I am signed in$/ do
  step %Q{I am on the homepage}
  step %Q{I follow "Sign up"}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I wait a bit}
  step %Q{I fill in "Email" with "helloworld@gmail.com"}
  step %Q{I fill in "First name" with "Hello"}
  step %Q{I fill in "Last name" with "World"}
  step %Q{I fill in "Password" with "helloworld"}
  step %Q{I fill in "Password confirmation" with "helloworld"}
  step %Q{I press "Sign up"}
end
Feature: Articles Merging
  As an admin
  In order to aggregate similar topics into one place
  I want to merge two similar articles
  
  Background:
    Given the blog is set up
    Given the following users exist:
      | profile_id | login | name  | password | email             | state  |
      | 2          | yoda  | User1 | asdf123  | yoda@example.com | active |
      | 3          | user2 | User2 | asdf222  | user2@example.com | active |
    
    Given the following articles exist:
      | id | title    | author         | user_id | body     | state     | type    |
      | 3  | Article1 | yoda           | 2       | Content1 | published | article |
      | 4  | Article2 | captain falcon | 3       | Content2 | published | article |
  
#   Scenarios: To do this properly, we want to keep the following in mind:
#   1. A non-admin cannot merge articles.
#   2. When articles are merged, the merged article should contain the text of both previous articles.
#   3. When articles are merged, the merged article should have one author (either one of the authors of the original article).  
#   4. Comments on each of the two original articles need to all carry over and point to the new, merged article.
#   5. The title of the new article should be the title from either one of the merged articles.

  Scenario: non-admin cannot merge articles
    # Given a non admin is created
    # And I am logged in as a non admin
    Then I go to the login page
    And I fill in "user[login]" with "yoda"
    And I fill in "user[password]" with "asdf123"
    Then I press "Login"
    And I go to the edit page of article given id "3"
    Then I should see "Logged in as"
    But I should not see "Merge"
  
  Scenario: merged article contains the text from both parent articles
    Given I am logged into the admin panel
    And I go to the edit page of article given id "3"
    And I merge article "4"
    Then I go to the admin content page
    Then I should not see "Article2"
    Then the article with id "4" does not exist
    And I follow "Article1"
    Then I should see "Content1"
    And I should see "Content2"

  Scenario: a merged article has a single author (either of original authors)
    And the article with id "3" and "4" are merged
    And the following author of "Article1" is "yoda"
    Then the article with id "4" does not exist
    
  Scenario: merged articles should carry over comments from original articles
  	And I am on the home page
  	Then I should see "Article1"
    Then I follow "Article1"
    Then I fill in "comment[author]" with "Samuel Clemens"
  	Then I fill in "comment[email]" with "whatsup@youknowwhatitis.com"
  	Then I fill in "comment[url]" with "google.com"
  	Then I fill in "comment[body]" with "my great comment"
  	Then I press "comment"
  	And I am on the home page
  	Then I should see "Article2"
    Then I follow "Article2"
    Then I fill in "comment[author]" with "Samuel Jackson"
  	Then I fill in "comment[email]" with "whatsup@yes.com"
  	Then I fill in "comment[url]" with "yahoo.com"
  	Then I fill in "comment[body]" with "love me!"
  	Then I press "comment"
  	And the article with id "3" and "4" are merged
  	Then the article with id "4" does not exist
  	Then I am on the home page
  	Then I should see "Article1"
  	Then I follow "Article1"
  	Then I should see "my great comment"
  	And I should see "love me!"
  
  Scenario: title of new article is the same as one of the original articles
    And the article with id "3" and "4" are merged
    And the following author of "Article1" is "yoda"
    Then the article with id "4" does not exist
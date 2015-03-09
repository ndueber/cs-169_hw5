Feature: Articles Merging
  As an admin
  In order to aggregate similar topics into one place
  I want to merge two similar articles
  
#   Scenarios: To do this properly, we want to keep the following in mind:
#   1. A non-admin cannot merge articles.
#   2. When articles are merged, the merged article should contain the text of both previous articles.
#   3. When articles are merged, the merged article should have one author (either one of the authors of the original article).  
#   4. Comments on each of the two original articles need to all carry over and point to the new, merged article.
#   5. The title of the new article should be the title from either one of the merged articles.

  Scenario: non-admin cannot merge articles
    Given I am not an admin
    Then I should see "article 1"
    And I should not see "merge articles"
  
  Scenario: merged article contains the text from both parent articles
    Given I am an admin
    And I merge article '1' and article '2'
    Then I should see text from article '1' and article '2' in article '3'
    
  Scenario: a merged article has a single author (either of original authors)
    Given I am an admin
    And I merge article '1' and article '2'
    Then I should see that author of merged article is either author of article '1' or author of article '2'
    
  Scenario: merged articles should carry over comments from original articles
    Given I am an admin
    And I merge article '1' and article '2'
    Then I should see comments from article '1' and article '2' on article '3'
  
  Scenario: title of new article is the same as one of the original articles
    Given I am an admin
    And I merge article '1' and article '2'
    Then I should see that title of merged article is either title of article '1' or title of article '2'
Feature: Search
  Scenario: Should be able to search by first name
    Given the following alumni exist in the system:
    | first_name | last_name| email | password | ug_college | pg_college |specialty|
    | Sam  | Bah   | foo@foo.com    |foobar |Rutgers  | Penn State | Internal medicine |
    When I search using "Sam"
    Then I should get 1 result
    When I search using "something else"
    Then I should get 0 result

    Scenario: Should be able to search by city in address
    Given the following alumni exist in the system:
    | first_name | last_name| email | password | ug_college | pg_college |specialty| city |  country |
    | Sam  | Bah | foo@foo.com | foobar        | Rutgers | Penn State | Internal medicine | Brunswick |  USA |
    When I search using "Brunswick"
    Then I should get 1 result
    When I search using "something else"
    Then I should get 0 result
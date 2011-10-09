Feature: Authenticate
  Scenario: Should be able to authenticate by email and password
    Given the following alumni exist in the system:
    | first_name | last_name| ug_college | pg_college |specialty| email | password |
    | Sam  | Bah   | Rutgers    | Penn State | Internal medicine | foo@foo.com | foobar |
    When I authenticate using "foo@foo.com" and password "foobar"
    Then I should get user Bah
    When I authenticate using "foo@foo.com" and password "invalid"
    Then I should get user nil
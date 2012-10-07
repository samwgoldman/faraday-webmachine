Feature: it works

  Scenario: Happy path
    Given a Faraday stack using Webmachine
    And a "Hello, World!" Webmachine application
    When I request a greeting
    Then I am greeted with "Hello, World!"

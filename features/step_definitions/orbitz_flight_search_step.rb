Given(/^user is on the orbitz homepage$/) do
  visit OrbitzHomePage
end

When(/^user selects the flights tab$/) do
  on(OrbitzHomePage).select_flights_tab_element.click
end

And(/^user choose round trip option$/) do
  on(OrbitzHomePage).choose_round_trip_element.click
end

And(/^user search for "([^"]*)" city and selects "([^"]*)" airport for departure$/) do |city_name, airport_code|
  on(OrbitzHomePage).choose_dep_airport city_name, airport_code
end

And(/^user search for "([^"]*)" city and selects "([^"]*)" airport for arrival$/) do |city_name, airport_code|
  on(OrbitzHomePage).choose_arr_airport city_name, airport_code
end

And(/^user choose future dates for the arrival and departure dates$/) do
  on(OrbitzHomePage).choose_dep_date 1
  on(OrbitzHomePage).choose_arr_date 3
end

And(/^search for the available flights$/) do
  on(OrbitzHomePage).submit_button_element.click
end

Then(/^verify user should see the available flights$/) do
  #fail "No results are found" unless on(OrbitzFlightSearchResultsPage).get_flight_results_count > 1
  expect(on(OrbitzFlightSearchResultsPage).get_flight_results_count).should be > 1 ###for Rspect
end

And(/^verify user gets the flight results for the selected dep date$/) do
  exp_date = on(OrbitzFlightSearchResultsPage).display_date_format_in_the_search_results 1
  actual_date = on(OrbitzFlightSearchResultsPage).flight_results_title_element.text
  on(OrbitzFlightSearchResultsPage).verify_both_results_are_same? exp_date, actual_date

  # exp_destination = "Columbus (CMH) - Cleveland (CLE)"
  # actual_destination = on(OrbitzFlightSearchResultsPage).all_flights_results_new.lis[0].text
  # on(OrbitzFlightSearchResultsPage).verify_partial_text_exists? actual_destination, exp_destination
end

Then(/^user should see the "([^"]*)" error message$/) do |error_message|
  all_errors = on(OrbitzHomePage).get_all_error_message
  #fail "Error Message - #{error_message} is not found in the list of errors - #{all_errors}" unless all_errors.include? error_message
  expect(all_errors).should include error_message ###RSpec
end

When(/^user search for the available flights for the future dates$/) do
  on(OrbitzHomePage).select_flights_tab_element.click
  on(OrbitzHomePage).choose_round_trip_element.click
  on(OrbitzHomePage).choose_dep_airport city_name, airport_code
  on(OrbitzHomePage).choose_arr_airport city_name, airport_code
  on(OrbitzHomePage).choose_dep_date 1
  on(OrbitzHomePage).choose_arr_date 3
  on(OrbitzHomePage).submit_button_element.click

  #####Instead of abovw way we can do it in this way This is teh best way

  on(OrbitzHomePage) do |page|
    page.select_flights_tab_element.click
    page.choose_round_trip_element.click
    page.choose_dep_airport city_name, airport_code
    page.choose_arr_airport city_name, airport_code
    page.choose_dep_date 1
    page.choose_arr_date 3
    page.submit_button_element.click
  end
  ###We can use this way
  step "user selects the flights tab"
  step "user choose round trip option"
  step "user search for " "#{Columbus}" " city and selects " "#{CMH}" " airport for departure"
  step "user search for " "#{Cleveland}" " city and selects " "#{CLE}" " airport for arrival"
  step "user choose future dates for the arrival and departure dates"
  step "search for the available flights"
  ####Or we can use this way
  steps %Q{
  When user selects the flights tab
    And user choose round trip option
    And user search for "Columbus" city and selects "CMH" airport for departure
    And user search for "Cleveland" city and selects "CLE" airport for arrival
    And user choose future dates for the arrival and departure dates
    And search for the available flights
        }

end
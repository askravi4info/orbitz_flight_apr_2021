class OrbitzHomePage
  require_relative '../modules/utilities_module'

  include PageObject
  include UtilitiesModule

  page_url "www.orbitz.com"


  link(:select_flights_tab, class: 'uitk-tab-anchor', index: 1)
  link(:select_cars_tab, class: 'uitk-tab-anchor', index: 2)
  link(:choose_round_trip, text: 'Roundtrip')

  # airport search fields
  button(:leaving_from_button, aria_label: 'Leaving from')
  button(:going_to_button, aria_label: 'Going to')
  text_field(:set_dep_edit_box, id: 'location-field-leg1-origin')
  text_field(:set_arr_edit_box, id: 'location-field-leg1-destination')
  ul(:all_dep_airports, data_stid: 'location-field-leg1-origin-results')
  ul(:all_arr_airports, data_stid: 'location-field-leg1-destination-results')

  # date picker fields
  button(:choose_dep_date_btn1, id: 'd1-btn')
  button(:date_done_button, data_stid: 'apply-date-picker')
  button(:choose_arr_date_btn1, id: 'd2-btn')

  button(:submit_button, data_testid: 'submit-button')

  divs(:error_messages, class: 'uitk-error-message')


  def get_all_error_message
    error_messages_elements.map(&:text)

    #
    # all_errors = []
    # error_messages.each do |each_error|
    #   all_errors << each_error.text
    # end
    # all_errors
  end
  #RAM GADDE
  def choose_dep_airport city_name, airport_code
    leaving_from_button_element.click
    set_dep_edit_box_element.set city_name
    # self.set_dep_edit_box = city_name
    sleep 1
    all_dep_airports_element.list_item_elements.each do |each_airport|
      p each_airport.text
      if each_airport.text.include? airport_code
        each_airport.click
        break
      end
    end
  end


  def choose_arr_airport city_name, airport_code
    going_to_button_element.click
    set_arr_edit_box_element.set city_name
    # self.set_arr_edit_box = city_name
    sleep 1
    all_arr_airports_element.list_item_elements.each do |each_airport|
      p each_airport.text
      if each_airport.text.include? airport_code
        each_airport.click
        break
      end
    end
  end

  def choose_dep_date no_of_days
    dep_date = change_correct_date_format no_of_days
    choose_dep_date_btn1_element.click
    sleep 1
    @browser.button(aria_label: dep_date).click
    date_done_button
  end

  def choose_arr_date no_of_days
    arr_date = change_correct_date_format no_of_days
    choose_arr_date_btn1_element.click
    sleep 1
    @browser.button(aria_label: arr_date).click
    date_done_button
  end

  def search
    @browser.button(data_testid: 'submit-button').click
  end


end
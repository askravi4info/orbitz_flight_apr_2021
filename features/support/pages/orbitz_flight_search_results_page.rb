class OrbitzFlightSearchResultsPage
  require_relative '../modules/utilities_module'

  include PageObject
  include UtilitiesModule
  include UtilitiesModule

  ul(:all_flights_results, id: 'flightModuleList')
  ul(:all_flights_results_new, data_test_id:'listings')
  div(:flight_results_title, class: 'title-date-rtv')



  def get_flight_results_count
    all_flights_results_element.list_item_elements.count
  end

  fdsafds
ffdsafdsf
  fafdasfsaf


  fsadfs
  asf
  dsa
  f



end
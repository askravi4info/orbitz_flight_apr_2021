require 'rspec'
require 'page-object'
require 'data_magic'
require 'yaml'


if ENV['browser'] == nil
  $browser_type = :chrome
else
  $browser_type = ENV['browser']
end


case ENV['ENVIRONMENT']
when 'CI'
  puts 'using CI environment'
  $base_url = 'http://www.expedia.com/'
  $db_host = 'adev01:8066'
when 'ITG'
  puts 'using ITG1 environment'
  $base_url = 'https://www.expediaitg.com/'
when 'QAREG'
  puts 'using QA Reg environment'
  $base_url = 'https://www.expediaqa.com/'
else
  puts 'using default environment (local)'
  $base_url = 'http://localhost:8080/expedia/'
  $db_host = 'localhost:8083'
end



if ENV['env'] == nil
  environment_name = ''
else
  environment_name = ENV['env']
end

$url = "www.orbitz#{environment_name}.com"

World(PageObject::PageFactory)

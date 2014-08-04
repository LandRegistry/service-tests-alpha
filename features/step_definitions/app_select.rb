# Since these tests test a multitude of microservices, offer
# the ability to choose which app to test from the feature.
# (possibly do same as https://github.com/alphagov/smokey/blob/master/features/support/base_urls.rb)

Given(/^app (.*?)$/) do |app|
  case app
  when /^[Ss]ystem.*/                   then @app = $app_systemofrecord
  when /^[Cc]asework.*/                 then @app = $app_casework_frontend
  when /^[Ss]earch[- ]?[Ff]rontend.*/   then @app = $app_search_frontend
  when /^[Pp]roperty.*/                 then @app = $app_property_frontend
  when /^[Mm]int.*/                     then @app = $app_mint
  when /^[Pp]ublic[- ]?[Tt]itle.*/      then @app = $app_public_titles_api
  when /^[Ss]earch[- ]?[Aa]pi.*/        then @app = $app_search_api
  when /^[Ss]ervice[- ]?[Ff]rontend.*/  then @app = $app_service_frontend
  else
    raise 'Invalid app ' + app 
  end
end



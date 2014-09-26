# Since these tests test a multitude of microservices, offer
# the ability to choose which app to test from the feature.
# (possibly do same as https://github.com/alphagov/smokey/blob/master/features/support/base_urls.rb)

Given(/^app (.*?)$/) do |app|
  case app
  when /^[Ss]ystem.*/                   then @app = $app_systemofrecord
  when /^[Mm]int.*/                     then @app = $app_mint
  when /^[Pp]roperty.*/                 then @app = $app_property_frontend
  when /^[Ss]earch[- ]?[Aa]pi.*/        then @app = $app_search_api
  when /^[Cc]asework.*/                 then @app = $app_casework_frontend
  when /^[Ss]earch[- ]?[Ff]rontend.*/   then @app = $app_search_frontend
  when /^[Pp]ublic[- ]?[Tt]itle.*/      then @app = $app_public_titles_api
  when /^[Ss]ervice[- ]?[Ff]rontend.*/  then @app = $app_service_frontend
  when /^[Dd]ecision.*/                 then @app = $app_decision
  when /^[Oo]wnership.*/                then @app = $app_ownership
  when /^[Mm]atching.*/                 then @app = $app_matching
  when /^[Ii]ntroductions.*/            then @app = $app_introductions
  when /^[Cc]ases.*/                    then @app = $app_cases
  when /^[Hh]istorian.*/                then @app = $app_historian
#  when /^[Xx]xx.*/                      then @app = $app_xx
  else
    raise 'Invalid app ' + app 
  end
end



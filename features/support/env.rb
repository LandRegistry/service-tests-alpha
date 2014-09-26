
$app_systemofrecord         = (ENV['SYSTEM_OF_RECORD_API_URL']      || 'http://0.0.0.0:8000')
$app_mint                   = (ENV['MINT_API_URL']                  || 'http://0.0.0.0:8001')
$app_property_frontend      = (ENV['PROPERTY_FRONTEND_URL']         || 'http://0.0.0.0:8002')
$app_search_api             = (ENV['SEARCH_API_URL']                || 'http://0.0.0.0:8003')
$app_casework_frontend      = (ENV['CASEWORK_FRONTEND_URL']         || 'http://0.0.0.0:8004')
$app_public_titles_api      = (ENV['PUBLIC_TITLES_API_URL']         || 'http://0.0.0.0:8005')
# the-feeder (not a webapp)                                             http://0.0.0.0:8006
$app_service_frontend       = (ENV['SERVICE_FRONTEND_URL']          || 'http://0.0.0.0:8007')
$app_decision               = (ENV['DECISION_URL']                  || 'http://0.0.0.0:8009')
$app_ownership              = (ENV['OWNERSHIP_URL']                 || 'http://0.0.0.0:8010')
$app_matching               = (ENV['MATCHING_URL']                  || 'http://0.0.0.0:8011')
# fixtures (internal use only)                                          http://0.0.0.0:8012
$app_introductions          = (ENV['INTRODUCTIONS_URL']             || 'http://0.0.0.0:8013')
$app_cases                  = (ENV['CASES_URL']                     || 'http://0.0.0.0:8014')
$app_historian              = (ENV['HISTORIAN_URL']                 || 'http://0.0.0.0:8015')

#$app_XXX                    = (ENV['XX_URL']                         || 'http://0.0.0.0:80XX')

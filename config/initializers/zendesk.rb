require 'zendesk_api'

@client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://crybaby.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

  # Basic / Token Authentication
  config.username = "thrifthshopdowntheroad@gmail.com/token"

  # Choose one of the following depending on your authentication choice
  config.token = "lqsfsaBM0NFS7pxYvsTUb2CnKKRAkSxRqMTe4yeS"

  # OAuth Authentication
  #config.access_token = "fc97c122167bbfc083997948973587aa3fba6aa1e41f4b8f5dbccabf9bd5bdeb"

  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true

  # Raise error when hitting the rate limit.
  # This is ignored and always set to false when `retry` is enabled.
  # Disabled by default.
config.raise_error_when_rate_limited = false

  # Logger prints to STDERR by default, to e.g. print to stdout:
 require 'logger'
  config.logger = Logger.new(STDOUT)

  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
end
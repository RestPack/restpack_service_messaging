require 'require_all'
require 'rubykiq'
require 'restpack_service'
require 'restpack_service_messaging/version'

require 'restpack_service_messaging/commands/email/send'
require 'restpack_service_messaging/commands/email/send_raw'

#TODO: GJ: load Rubykiq configuration
#Rubykiq.url = "redis://127.0.0.1:6379"


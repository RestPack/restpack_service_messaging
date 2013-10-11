require 'require_all'
require 'restpack_service'
require "restpack_service_messaging/version"
# require "restpack_service_messaging/configuration"
require_all 'lib/restpack_service_messaging/commands'

module Commands
  include RestPack::Service::Messaging::Commands
end

# require 'restpack_service'
# RestPack::Service::Loader.load 'service_mesaging'

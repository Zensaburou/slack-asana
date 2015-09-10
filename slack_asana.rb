require_relative './application'

class SlackAsanaApp
  def self.call(env)
    ParamParser.new.parse_commands(env)
  end
end

Rack::Server.start app: SlackAsanaApp

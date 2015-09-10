require 'rack'

class ParamParser
  attr_accessor :command_string
  attr_accessor :project

  def parse_commands(env)
    req = Rack::Request.new(env)
    self.command_string = req.params['text']
    [200, {}, [req.params.inspect]]
  end
end

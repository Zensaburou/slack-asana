require 'json'
require 'net/https'

class TaskFinder
  def find_tasks_by_project(team_name, params_hash)
    uri = ApiEndpoint.new.tasks_by_project(team_name)
    http_client = HttpClient.new.generate_client(uri)
    request = HttpRequest.new.generate_request(uri.path, params_hash)
    make_request(http_client, request)
  end

  def make_request(http_client, request)
    http_client.start { |http| http.request(request) }
  end
end

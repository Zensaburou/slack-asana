class ApiEndpoint
  def tasks_by_project(team_name)
    URI.parse('https://app.asana.com/api/1.0/projects/' + ENV["#{team_name}ProjectId"] + '/tasks')
  end
end

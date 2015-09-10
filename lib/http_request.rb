class HttpRequest
  def generate_request(path, param_hash)
    request = generate_get_request(path)
    add_token(request)
    add_params_to_body(request, param_hash)
    request
  end

  def generate_get_request(path)
    Net::HTTP::Get.new(path, generate_header)
  end

  def add_token(request)
    request.basic_auth(ENV['API_KEY'], '')
  end

  def add_params_to_body(request, param_hash)
    request.body = json_params(param_hash)
  end

  def json_params(param_hash)
    { 'data' => param_hash }.to_json
  end

  def generate_header
    { 'Content-Type' => 'application/json' }
  end
end

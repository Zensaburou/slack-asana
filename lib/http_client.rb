class HttpClient
  def generate_client(uri)
    http_client = client(uri)
    enable_ssl(http_client)
    http_client
  end

  def client(uri)
    Net::HTTP.new(uri.host, uri.port)
  end

  def enable_ssl(http_client)
    http_client.use_ssl = true
    http_client.verify_mode = OpenSSL::SSL::VERIFY_PEER
  end
end


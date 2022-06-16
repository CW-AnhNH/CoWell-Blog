Imgproxy.configure do |config|
    config.endpoint = 'http://localhost:8080'
    config.key = '696d6770726f7879' # imgproxy
    config.salt = '73616c74' # salt
  end
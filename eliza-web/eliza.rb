require_relative 'lib/eliza_questions'
require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new env
  user_response = req.params['user_input']
  [200, {'Content-Type' => 'text/html'}, ["
    <form method='POST'>
    <p><input class='textarea' name='user_input' style='width:200'></input></p><br>
    <button type='submit' >OK</input>"]]
end

Rack::Handler::WEBrick.run app

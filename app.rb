require 'sinatra'
set :bind, '0.0.0.0'

# This would be the 'default' route. All request to just '/' will go here
get '/' do
  'Welcome!'
end

# An example of a named route. Try changing it to something else.
get '/hello' do
  'Hello world!'
end

# This is a route with a 'parameter' in the route request.
# Using this, we can send data to the application even via a GET request
# as long as the information is embedded in the URL.
get '/hello/:name' do
  # #{XXX} is what we call string interpolation.
  # This allows you to evaluate ruby code from within a string.
  # Try #{1+1} and see what is the results.
  "Hello #{params[:name]}"
end

__END__
Read more about Sinatra here => http://www.sinatrarb.com/intro.html


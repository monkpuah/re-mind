require 'sinatra'
require 'sinatra/reloader' if development?
set :bind, '0.0.0.0'


# First we render our index page, and we display the form
get '/' do
  erb :index
end

# When a form is submitted, it goes to this route
post '/' do
  @greet = params[:name]
  erb :greet
end

__END__
Read more about Sinatra POST requests here => http://www.sinatrarb.com/intro.html


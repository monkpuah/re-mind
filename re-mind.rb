require 'rubygems'
require 'sinatra'
require 'data_mapper'

set :bind, '0.0.0.0'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/remind.db")

class Reminder
  include DataMapper::Resource
  property :id, Serial
  property :content, Text, :required => true
  property :due_date, DateTime, :required => true, :default => false
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!

get '/' do
  @reminders = Reminder.all 
  @title = 'Much Reminders'
  erb :homepage
end

post '/' do
	r = Reminder.new
	r.content = params[:content]
	r.created_at = Time.now
	r.updated_at = Time.now
  r.due_date = params[:duedate]
	r.save
	redirect '/'
end

get '/:id/edit' do
  @reminder = Reminder.get params[:id]
  @title = "Edit Your Reminder"
  erb :edit
end

put '/:id' do
  r = Reminder.get params[:id]
  r.content = params[:content]
  r.updated_at = Time.now
  r.due_date = params[:duedate]
  r.save
  redirect '/' 
end

get '/:id/delete' do
  @reminder = Reminder.get params[:id]
  @title = "Delete Your Reminder"
  erb :delete
end

delete '/:id' do 
  r = Reminder.get params[:id]
  r.destroy
  redirect '/'
end
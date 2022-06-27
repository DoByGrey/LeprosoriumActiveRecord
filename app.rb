#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# Создаем соединение с БД
set :database, { adapter: 'sqlite3', database: 'leprosoriumActiveRecord.db' }

# Создаем модели Пост и Комментарий

class Post < ActiveRecord::Base
	has_many :comments
end	

class Comment < ActiveRecord::Base
end	

before do
	@posts = Post.all
end	

get '/' do
	# выбираем список постов из БД

	@posts = Post.order "created_at Desc"

	erb :index
end

# обработчик get-запроса /new
# (браузер получает таблицу с сервера)
get '/new' do
  erb :new
end

# обработчик post-запроса /new
# (браузер отправляет данные на сервер)
post '/new' do
	@p = Post.new params[:post]
	
	if @p.save
		erb "<h2>Спасибо, вы  записались!</h2>"
	else	
		@error = @p.errors.full_messages.first
		erb :new
	end	
end

# вывод информации о посте
get '/details/:id' do
	
	@post = Post.find(params[:id])
	@comments = Comment.find(params[])

	erb :details
end	

# обработчик post-запроса /details/...
# (браузер отправляет данные на сервер, мы их принимаем)

post '/details/:id' do
	@c = Comment.new params[:comment]
	
	if @c.save
		erb :details
	else	
		@error = @c.errors.full_messages.first
		erb :details
	end	
end	
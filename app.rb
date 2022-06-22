#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# Создаем соединение с БД
set :database, { adapter: 'sqlite3', database: 'leprosoriumAR.db' }

# Создаем модели Пост и Комментарий

class Post < ActiveRecord::Base
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

end

# вывод информации о посте
get '/details/:post_id' do
	
end	

# обработчик post-запроса /details/...
# (браузер отправляет данные на сервер, мы их принимаем)

post '/details/:post_id' do

end	
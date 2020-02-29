#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School!!!</a>"
end
get '/about'do
	@error = "somethings"
	erb :about
end
get '/visit' do
	erb :visit
end
get '/contacts' do
	erb :contacts
end
post '/visit'do
	@name = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]
	hh ={:username=>'Введите имя',:phone=>'Введите номер телефона',:datetime=>'Выберите дату и время'}
	@error=hh.select{|key,_| params[key]==''}.values.join(", ")
	if @error !=''
			return erb :visit
	end
	# f = File.open './public/users.txt','a'
	# f.write "Nane: #{@name}, phone number: #{@phone}, your date and time #{@datetime}, your master: #{@barber} color: #{@color}"
	# f.close
	# erb :visit
	erb "Nane: #{@name}, phone number: #{@phone}, your date and time #{@datetime}, your master: #{@barber} color: #{@color}"
end
post '/contacts'do
	@email = params[:email]
	c = File.open './public/contacts.txt','a'
	c.write "#{@email},"
	c.close
end

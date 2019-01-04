require_relative './config/init.rb'
enable :sessions
set :run, true

get '/' do
  @questions = Question.all.order('created_at DESC')
  @answers = Answer.all.order('total_vote DESC')
  if session[:signed_in]
    @user = session[:user_id]
    p @user
  else
    
  end
  erb :"home"
end
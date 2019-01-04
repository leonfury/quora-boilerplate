class Question < ActiveRecord::Base
    has_many :answers
    belongs_to :user
end

post '/ask_question' do
    Question.create(params[:question])
    p params[:question]
    p params[:question][:user_id]
    redirect to "/user_profile/#{session[:user_id]}"
end 

delete '/question_delete/:id' do #delete action
    Question.find(params[:id]).delete
    redirect to "/user_profile/#{session[:user_id]}"
end

patch '/question_edit/:id' do #edit action
    question = Question.find(params[:id])
    question.question = params[:question]
    question.save
    redirect to "/user_profile/#{session[:user_id]}"
end

post '/search_question' do
    p "#############################################################"
    p params[:search]

    redirect to "/question_all/#{params[:search]}"
end
get '/question/new' do
  erb :"question/question_new"
end

get '/question/:id' do
    p "Question id #{params[:id]}"
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @answers = Answer.where(question_id: params[:id])
    erb :"question/question_show"
end

get '/question_edit/:id' do  #load edit form
    if session[:signed_in]
        @question = Question.find(params[:id])
        erb :'question/question_edit'
      else
        p "Question edit fail"
        redirect to '/'
      end
end

get '/question_all' do
    @questions = Question.all
    erb :"question/question_all_page"
end

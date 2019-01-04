class Answer < ActiveRecord::Base
    belongs_to :question
    belongs_to :user
    has_many :votes
end

post '/answer_add' do
    Answer.create(params[:answer])
    p params[:answer][:question_id]
    p params[:answer]
    redirect to "/question/#{params[:answer][:question_id]}"

end 

get '/answer/:id/edit' do  #id is answer id
    if session[:signed_in]
        @answer = Answer.find(params[:id])
        @question = Question.find(@answer.question_id)
        erb :'answer/answer_edit'
      else
        p "Answer not logged in"
        redirect to '/'
      end
end

patch '/answer/:id/edit' do #edit action
    answer = Answer.find(params[:id])
    answer.answer = params[:answer]
    answer.save
    redirect to "/question/#{answer.question_id}"
end

delete '/answer/:id/delete' do #answer id
    answer = Answer.find(params[:id])
    ques_id = Question.find(answer.question_id).id
    answer.delete
    redirect to "/question/#{ques_id}"
end
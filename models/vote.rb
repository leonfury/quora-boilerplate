require_relative './../config/init.rb'
class Vote < ActiveRecord::Base
    belongs_to :answer
    belongs_to :user

end

#upvote
post '/answer/:id/upvote/:user_id' do
    if session[:signed_in]
        p "#########################################Enter UP vote"
        # checks for downvote
        down_query = check_vote(params[:id], params[:user_id], -1)
        down_exist = down_query[0]
        down_vote_id = down_query[1]

        # checks for upvote
        up_query = check_vote(params[:id], params[:user_id], 1)
        up_exist = up_query[0]
        up_vote_id = up_query[1]

        #if downvote exists, delete it
        p "downvote exists : #{down_exist}"   
        if down_exist
            Vote.find(down_vote_id).delete
            answer = Answer.find(params[:id])
            answer.update(total_vote: answer.total_vote + 1)
        end

        # if upvote doesn't exist, create it
        p "upvote exists : #{up_exist}"   
        if !up_exist
            Vote.create(vote: 1, answer_id: params[:id], user_id: params[:user_id])
            answer = Answer.find(params[:id])
            answer.update(total_vote: answer.total_vote + 1)
            p "Total vote ---------> #{answer.total_vote}"
            p "new upvote created"
        else
            p "do nothing"
        end
        redirect to "/question/#{Question.find(Answer.find(params[:id]).question_id).id}"
    end
end

#novote
post '/answer/:id/novote/:user_id' do
    if session[:signed_in]
        #if any vote exist, delete vote
        query = check_vote_exist(params[:id], params[:user_id])
        vote_exist = query[0]
        vote_id = query[1]
        
        p "vote exists : #{vote_exist}"   
        if vote_exist

            vote = Vote.find(vote_id)

            if vote.vote == 1
                answer = Answer.find(params[:id])
                answer.update(total_vote: answer.total_vote - 1)
            end
            
            if vote.vote == -1
                answer = Answer.find(params[:id])
                answer.update(total_vote: answer.total_vote + 1)
            end

            vote.delete

        end
        redirect to "/question/#{Question.find(Answer.find(params[:id]).question_id).id}"
    end
end


#downvote
post '/answer/:id/downvote/:user_id' do
    
    if session[:signed_in]
        p "#########################################Enter DOWN vote"
        # checks for downvote
        down_query = check_vote(params[:id], params[:user_id], -1)
        down_exist = down_query[0]
        down_vote_id = down_query[1]

        # checks for upvote
        up_query = check_vote(params[:id], params[:user_id], 1)
        up_exist = up_query[0]
        up_vote_id = up_query[1]

        #if upvote exists, delete it
        p "upvote exists : #{up_exist}"   
        if up_exist
            "upvote DELETEEEEED"
            Vote.find(up_vote_id).delete
            
            answer = Answer.find(params[:id])
            answer.update(total_vote: answer.total_vote - 1)
            p answer.total_vote
        end

        # if downvote doesn't exist, create it
        p "downvote exists : #{down_exist}"   
        if !down_exist
            Vote.create(vote: -1, answer_id: params[:id], user_id: params[:user_id])
            answer = Answer.find(params[:id])
            answer.update(total_vote: answer.total_vote - 1)
            p "new downvote created"
        else
            p "do nothing"
        end

        redirect to "/question/#{Question.find(Answer.find(params[:id]).question_id).id}"
    end
end


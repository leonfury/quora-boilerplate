
helpers do
  def sum(id) #answer_id
    ans = Answer.find(id)
    sum = 0
    ans.votes.each do |vote|
        sum += vote.vote
    end 
    # p "Vote sum for answer #{id} is #{sum}"
    return sum
  end


  def check_vote(answer, user, vote_type) #answer, user refer to id; vote is -/+1
    p "############################################################Enter check_vote"
    votes = Vote.where(answer_id: answer) #return all votes matching answer_id
    votes.each do |vote| 
      #if vote_type & user exists, return true and vote.id
      if vote.vote == vote_type && vote.user_id == user.to_i
        return [true, vote.id]    
      end
    end
    return [false, -1]        
  end

  def check_vote_exist(answer, user) #answer, user refer to id; vote is -/+1
    p "############################################################Enter check_vote_exist"
    votes = Vote.where(answer_id: answer) #return all votes matching answer_id
    votes.each do |vote| 
      #if vote_type & user exists, return true and vote.id
      if vote.user_id == user.to_i
        return [true, vote.id]    
      end
    end
    return [false, 0]        
  end

=begin

  # This will return the current user, if they exist
    # Replace with code that works with your application
    def current_user
        p 
      if session[:user_id]
        @current_user ||= User.find_by_id(session[:user_id])
      end
    end
  
    # Returns true if current_user exists, false otherwise
    def logged_in?
      !current_user.nil?
    end
  
    # a convenient method to set the session to given user's id with the `:user_id` key
    def sign_in(user)
      session[:user_id] = user.id
    end
  
    # clears the session by setting the value of `:user_id` key to `nil`
    def sign_out
      session[:user_id] = nil
    end
=end
end


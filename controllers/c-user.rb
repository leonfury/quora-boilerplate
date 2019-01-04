get '/signup_page' do
  erb :"user/signup_page"
end
 
get '/login_page' do
  erb :"user/login_page"
end

get '/user_profile/:id' do
    print "Is session signed in : "
    p session[:signed_in]
    if session[:signed_in] == true
        @session = true
        @user = User.find(params[:id])
        @answers = Answer.where(user_id: params[:id])
        @questions = Question.where(user_id: params[:id])
        @user_edit = true
        erb :"user/user_profile"
    else
        redirect to '/login_page'
    end
end
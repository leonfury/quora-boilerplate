require_relative './../config/init.rb'
enable :sessions
set :run, true

class User < ActiveRecord::Base
    validates :full_name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /.+@.+\...+/ } 
    validates :password, presence: true
    validates :password, length: { minimum: 10 }
    # requires column password_digest in user database to work
    has_secure_password
    has_many :questions
    has_many :answers
    has_many :votes
end

post '/signup' do
    user = User.new(params[:user])
    if user.save
      # what should happen if the user is saved?
      p "User Created Successfully. Welcome #{user.full_name}."
      redirect to '/login_page'
      # p user.password #password still displayable
    else
      # what should happen if the user keyed in invalid date?
      p 'Sign up fail. Please ensure password is at least 10 characters long and email is valid.'
      redirect to '/signup_page'
    end
end 

post '/login' do
    user_current = User.find_by("email = ?", params[:user][:email])
    if user_current
        if user_current.authenticate(params[:user][:password])
            p "User login successful"
            session[:signed_in] = true
            session[:user_id] = user_current.id
            redirect to "/user_profile/#{session[:user_id]}"
        else
            # wrong password
            p 'Wrong password. Try again'
            @error = 'wrong_password'
            erb :"user/login_page"
        end
    else
        # wrong email
        p "User doesn't exist. Please sign up"
        @error = 'wrong_email'
        erb :"user/login_page"
    end
  end
  
post '/logout' do
# kill a session when a user chooses to logout, for example, assign nil to a session
    session[:signed_in] = false
    p "Logout successful"
    redirect to '/'
# redirect to the appropriate page
end




=begin

user1 = User.create(full_name: 'user1', email: 'user1@mail.com', password: 'qwerty')
user1.authenticate('notright')
user1.authenticate('qwerty')

=end
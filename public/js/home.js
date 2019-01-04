const login_signup = document.getElementById('login_signup');
const user_profile = document.getElementById('user_profile');
// console.log(<%= session[:signed_in] %>);
if (<%= session[:signed_in] %>) {
    login_signup.style.display = 'none';
    user_profile.style.display = 'block';
    // console.log('true executed')
}
else {
    login_signup.style.display = 'block';
    user_profile.style.display = 'none';
    // console.log('false executed')
}

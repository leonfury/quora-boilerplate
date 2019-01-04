console.log('Hi');
if ('<%= @error %>' === 'wrong_password') {
    alert(`Wrong password, please try again`);
}
if ('<%= @error %>' === 'wrong_email') {
    alert(`User email doesn't exist`);
}
console.log('<%= @error %>');
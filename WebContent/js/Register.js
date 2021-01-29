var user_id=document.getElementById("user_id")
	var user_name=document.getElementById("user_name")
	var user_mail=document.getElementById("user_mail")
	var submit=document.getElementById("btn_submit")
	var fm=document.getElementById("user_form")
	var userName=document.getElementById('user-name')
	var message=document.getElementById('message')

		//ログイン状態で表示分岐
firebase.auth().onAuthStateChanged(user => {
  if (user) {
    loginBtn.classList.add("d-none")
    logoutBtn.classList.remove("d-none")
    submit.classList.remove("d-none")
    user_id.value=user.uid
    user_name.value=user.displayName
    user_mail.value=user.email
    userName.innerHTML="Googleアカウント：<a href=\"#\">"+user.displayName+"</a>"
    message.innerHTML="このアカウントで登録しますか？"

  } else {
    loginBtn.classList.remove("d-none")
    logoutBtn.classList.add("d-none")
    submit.classList.add("d-none")
    userName.innerHTML=""
    message.innerHTML=""
  }
})
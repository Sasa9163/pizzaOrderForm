var user_id=document.getElementById("user_id")
		var user_name=document.getElementById("user_name")
		var user_mail=document.getElementById("user_mail")
		var fm=document.getElementById("user_form")
		//ログイン状態で表示分岐
		firebase.auth().onAuthStateChanged(user => {
  		if (user) {
    		loginBtn.classList.add("d-none")
    		user_id.value=user.uid
    		user_name.value=user.displayName
    		user_mail.value=user.email
    		fm.submit()
  		} else {
    		loginBtn.classList.remove("d-none")
  		}
		})
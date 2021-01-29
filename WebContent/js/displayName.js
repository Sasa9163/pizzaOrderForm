	var userName=document.getElementById('user-name')
	firebase.auth().onAuthStateChanged(user => {
	  if (user) {
	    loginBtn.classList.add("d-none")
	    logoutBtn.classList.remove("d-none")
	    userName.innerHTML="ようこそ、<a href=\"javascript:link.submit()\">"+user.displayName+"</a>さん"
	  } else {
	    logoutBtn.classList.add("d-none")
	    loginBtn.classList.remove("d-none")
	    userName.innerHTML=""
	  }
	})
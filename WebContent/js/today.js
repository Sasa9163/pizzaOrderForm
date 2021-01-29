	window.onload=function(){
		var Today=new Date();
		var y=Today.getFullYear();
		var m=("0"+(Today.getMonth()+1)).slice(-2);
		var d=("0"+Today.getDate()).slice(-2);
		var str=y+"-"+m+"-"+d;
		var element=document.getElementById("date");
		element.min=str;
	}
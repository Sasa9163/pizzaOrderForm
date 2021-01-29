var index=document.getElementById("itemIndex");
var size=document.getElementById("pizza_size");
window.onload=function(){
	if(index.value>0 && index.value<=3){
		size.classList.remove("d-none");
	}else{
		size.classList.add("d-none");
	}
}
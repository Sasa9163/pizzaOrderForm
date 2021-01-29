var element = document.getElementById("item_list");
var size=document.getElementById("pizza_size");
var select=document.getElementById("size");
element.onchange=function(){
	if(element.value>0 && element.value<=3){
		size.classList.remove("d-none");
		select.required=true;
	}else{
		size.classList.add("d-none");
		select.required=false;
	}
};
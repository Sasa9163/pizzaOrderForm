document.getElementById("btn_submit").onclick=function() {
	switch_validation("lastname","lastname-valid");
	switch_validation("firstname","firstname-valid");
	switch_validation("address","address-valid");
}

document.getElementById("lastname").oninput=function() {
	switch_validation("lastname","lastname-valid");
}

document.getElementById("firstname").oninput=function() {
	switch_validation("firstname","firstname-valid");
}

document.getElementById("address").oninput=function() {
	switch_validation("address","address-valid");
}

function switch_validation(input,message){
	var element = document.getElementById(input);

	if (element.validity.valueMissing === true) {
		document.getElementById(message).textContent="未入力です";
	} else if (element.validity.patternMismatch === true) {
		document.getElementById(message).textContent="半角ﾀﾞﾌﾞﾙｸｫｰﾃｰｼｮﾝとｶﾝﾏは利用できません";
	}
}

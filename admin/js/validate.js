function validateInput(field, type){
	
	// Email Validation
	switch(type){
		//Email validation
		case 1: if(field.match(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)){
					return true;
				}else {
					//alert("Please enter a valid Email ID.");
					return false;
				}
		// Password validation		
		case 2: if(field.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/)){
					return true;
				}else {
					//alert("Please enter a valid password.");
					return false;
				}
		// Letters		
		case 3: if(field.match(/^[A-Za-z\s]+$/)){
			///^[A-Za-z0-9!\+= ;:.?!%-'",_\*\  \s \n <>-]*$/g;
					return true;
				}else {
					return false;
				}
		// Numbers
		case 4: if(field.match(/^[0-9]+$/)){
					return true;
				}else {
					return false;
				}
		//Letters and numbers, white spaces
		case 5: if(field.match(/^[a-zA-Z0-9 \s \n .-]*$/)){
					return true;
				}else {
					return false;
				}
		//Mobile Number
		case 6: if(field.match(/^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$/)){   //^([0|\+[0-9]{1,5})?([7-9][0-9]{10})$
					return true;
				}else {
					return false;
				}
		//Letters, Digits and some sybmols
		case 7: if(field.match(/^[A-Za-z0-9!\+=;:.?!%-'",_\*\  \s \n <>-]*$/g)){
					return true;
				}else{
					return false;
				}
		default: 
			console.log("Case not found!");
			return false;
	}
		
}


function getBaseURL(){
	var arr = window.location.href.split("/");
	var result = arr[0] + "//" + arr[2]+"/"+arr[3]+"/"+arr[4]+"/";
	
	return result;
}
	
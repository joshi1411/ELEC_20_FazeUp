function myFunction1() {
	var User = document.getElementById("Name").value;
	console.log(User);
	var Password = document.getElementById("login__password").value;
	console.log(Password);
	if(Password == "fazeup") {
		location.href = "organization.html";
	}
 
}
let roomNum = true;
let price = true;
let name = true;
let email = true;
let phone = true;
let address = true;
let pass = true;
let pass2 = true;
function fullNameValidate(){
    let fullName = document.getElementById('FullName').value;
    if(fullName === ""){
        displayMsg("Please enter your full name.", "fullNameMsg", "red");
        name = false;
        if(!name){
            document.getElementById("signup_btn").disabled = true;
        }
    }
    else if(!fullName.match(/^([a-z A-Z])+$/)){
        displayMsg("Numerics values not accepted", "fullNameMsg","red");
         name = false;
         document.getElementById("signup_btn").disabled = true;
        if(!name){
            document.getElementById("signup_btn").disabled = true;
        }
    }
    else if(fullName.length < 3){
        displayMsg("Name must be more than two characters", "fullNameMsg", "red");
             name = false;
        if(!name){
            document.getElementById("signup_btn").disabled = true;
        };
        }
    else{
        displayMsg("", "fullNameMsg", "green");
        name = true;
        document.getElementById('signup_btn').disabled = false;
    }
}

function emailValidate(){
    let email = document.getElementById('email').value;
    if(email === ""){
        displayMsg("Email is required.", "emailMsg", "red");
         name = false;
        if(!email){
            document.getElementById("signup_btn").disabled = true;
        }
    }
    else if(!email.match( /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)){
        displayMsg("Invalid email", "emailMsg", "red");
          email = false;
        if(!email){
            document.getElementById("signup_btn").disabled = true;
        }

    }
    else{
        displayMsg("", "emailMsg", "green");
        email = true;
        document.getElementById('signup_btn').disabled = false;
    }
}

function phoneValidate(){
    let phone = document.getElementById('phone').value;
    if(phone === ""){
        displayMsg("Contact number is required", "phoneMsg", "red");
          phone = false;
        if(!phone){
            document.getElementById("signup_btn").disabled = true;
        };

    }
    else if(phone.length < 10 ){
        displayMsg("Contact number must be of 10 digits", "phoneMsg", "red");
        phone = false;
        if(!phone){
            document.getElementById("signup_btn").disabled = true;
        }
        }
    else if(!phone.match(/^((98)|(97))[0-9]{8}$/)){
        displayMsg("Phone number not valid", "phoneMsg", "red");
        phone = false;
        if(!phone){
            document.getElementById("signup_btn").disabled = true;
        }
    }
    else{
        displayMsg("", "phoneMsg", "green");
        phone = true;
        document.getElementById("signup_btn").disabled = false;
    }
}

function passValidate(){
    let pass = document.getElementById('password').value;
    if(pass === ""){
        displayMsg("Password is required", "passMsg", "red");
        pass = false;
        if(!pass ){
            document.getElementById("signup_btn").disabled = true;
        }
    }
   
    
    else{
        displayMsg("", "passMsg", "green");
        pass = true;
        document.getElementById('signup_btn').disabled = false;
    }
}
function pass2Validate(){
    let pass = document.getElementById('password').value;
    let pass2 = document.getElementById('confirm').value;
    if(pass !== pass2){
        displayMsg("Password not matched", "pass2Msg", "red");
        pass2 = false;
        if(!pass2){
            document.getElementById("signup_btn").disabled = true;
        }
    }
    
    
    else{
        displayMsg("", "pass2Msg", "green");
        pass2 = true;
       document.getElementById('signup_btn').disabled = false;
    }
}



function roomNumValidate() {
     
    const paragraph = document.getElementById('room_number').value;
    const regex = /Room-\d{3}$/gm
    const found = paragraph.match(regex);

    if(paragraph === ""){
        displayMsg("Empty Fields", "roomNumMsg", "red");
        roomNum = false;
        if(!roomNum){
            document.getElementById("signup_btn").disabled = true;
        }
        return false;
    }
    else if (found == null) {
        displayMsg("doesnot match the format", "roomNumMsg", "red");
        roomNum = false;
        if(!roomNum){
            document.getElementById("signup_btn").disabled = true;
        }
        return false;
    } else {
        displayMsg(" ", "roomNumMsg", "green");
        roomNum = false;
        if(!roomNum){
            document.getElementById("signup_btn").disabled = false;
        }
        return true;
    }

}

function priceValidate(){
    const price = document.getElementById('price').value;
    if(price === ""){
        price = false;
        if(!price){
            document.getElementById("signup_btn").disabled = true;
        }
         displayMsg("Empty fields", "priceMsg", "red");
        return false;
    }
    else if(isNaN(price)){
        displayMsg("Please enter the number", "priceMsg", "red");
        price = false;
        if(!price){
            document.getElementById("signup_btn").disabled = true;
        }
        return false;
    }
    else {
        displayMsg("", "priceMsg", "green");
        price = false;
        if(!price){
            document.getElementById("signup_btn").disabled = false;
        }
        return true;
    }
    
}

function displayMsg(msg, id, colorVal){
    document.getElementById(id).innerHTML=msg;
    document.getElementById(id).style.color = colorVal;
}
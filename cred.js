const creditcard = document.getElementById("cred");
const Length_Of_Digits = 19;
const atm_num = document.getElementById("show");
const bye = document.getElementById("b")
const a = document.getElementById("a");

function removeSpaceIfAny(value) {
  let withOutSpace = value.split(" ");
  let stringFromArray = withOutSpace.join("");
  return stringFromArray;
}

function formateCardNumber(event) {
  restrictUserToTypeOnlyNumbers(event);
  myNum();
  setTimeout(() => {
    let MNumber = creditcard.value;



    if (MNumber.length >= 5 && MNumber.length < Length_Of_Digits) {
      MNumber = removeSpaceIfAny(MNumber);

      let arrayOfCardNumber = MNumber.split("");
      arrayOfCardNumber.splice(4, 0, " ");
      arrayOfCardNumber.splice(9, 0, " ");
      arrayOfCardNumber.splice(14, 0, " ");

      let stringFromArray = arrayOfCardNumber.join("");
      creditcard.value = stringFromArray;
      let roll = creditcard.value;

    }

  }, 100);
}
function restrictUserToTypeOnlyNumbers(event) {
  if (
    event.keyCode < 48 ||
    event.keyCode > 57 ||
    creditcard.value.length >= Length_Of_Digits
  ) {
    event.preventDefault();
    return;
  }
}
function show_number(event) {
  let real_num = creditcard.value;
  bye.innerHTML = real_num;
}


function myNum(){
  

  var str = document.getElementById("cred").value;

  var res = str.substring(str.length-4);

  var text="";
   for(let i=0; i<str.length-7; i++){

      text =text+"x"
      
      let text1 = text.split("");
     text1.splice(4, 0, " ");
      text1.splice(9, 0, " ");
      text1.splice(14, 0, " ");

      let me = text1.join("");
      you=me;
  }

  document.getElementById("display").innerHTML=you+res;

}

function view(){

  let a= document.getElementById("cred").value;

  document.getElementById("display").innerHTML=a;

}

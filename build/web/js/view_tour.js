function loadDoc(text)
{   
    var quantity= text.value;
    var name= text.name;
    var code =text.className;
    var input = document.getElementsByClassName(code);
    var sub = document.getElementById("sub");
    var span = document.getElementById(code);
    if(!Number.isInteger(Number(quantity)) || quantity=="" ||quantity<0)
    {
        span.innerHTML="*Please input a positive number!";
        span.style.display="inline";
        sub.disabled="disabled";
        return;
    }
    if(name == "txtAdultQuantity")
    {
        var otherQuantity = input[1].value;
        if(quantity*2<otherQuantity){
             span.innerHTML="*One adult just can bring 2 Kids!";
            span.style.display="inline";
            text.value= Number.isInteger(Number(otherQuantity/2))? Number.parseInt(otherQuantity/2):Number.parseInt(otherQuantity/2)+1;
             sub.disabled="disabled";
            return;
        }
       
    }else
    {
         var otherQuantity = input[0].value;
        if(otherQuantity*2<quantity){
            span.innerHTML="*One adult just can bring 2 Kids!";
            span.style.display="inline";
            text.value=Number.parseInt(otherQuantity*2);
            sub.disabled="disabled";
            return;
        }
    }
    span.style.display="none";
    text.form.submit();
}
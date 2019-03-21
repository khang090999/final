function  getConfirmationCancel(inp)
{
    var check=confirm("Do you want to cancel this Tour?");
    if(check == true) inp.form.submit(); 
}

function  getConfirmationDelete(inp)
{
    var check=confirm("Do you want to delete?");
   return check;
    
}
function  checkLogout(inp)
{
    var check=confirm("Do you want to Log out?");
    return check;
}

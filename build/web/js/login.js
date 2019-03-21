
(function ($) {
    "use strict";



  
  
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'txtEmail') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }else if($(input).attr('name') == 'txtDescription' )
        {
           
            if($(input).val().trim().length>500)  return false;
            
        }else if($(input).attr('name') == 'txtPassword' || $(input).attr('name') == 'txtNewPassword')
        {
           
            if($(input).val().trim().length<6 || $(input).val().trim().length>32) return false;
            
        }else if($(input).attr('name') == 'txtConfirm')
        {          
            if($(input).val() != $('#password').val())
            return false;
        }
        else if($(input).attr('name') == 'txtPhone')
        {
            if($(input).val().trim().match(/[0-9]{10,11}/) == null) return false;
            
        }else if($(input).attr('name') == 'txtAdultPrice' || $(input).attr('name') == 'txtKidPrice')
        {
            if($(input).val().trim().match(/^[0-9]+[.]{0,1}[0-9]{0,}$/) == null) 
                return false;
            else if(parseFloat($(input).val().trim()) <=0)
                return false;
            
        }else if($(input).attr('type') == 'date')
        {   
            if($(input).val().trim()=='') return false;
            var today= (new Date()).getTime();
            var day = (new Date($(input).val())).getTime();

            if(day < today) {return false;}
         
            if($(input).attr('name') == 'dateEnd')
            {
               
                 var el= document.getElementsByName("dateStart");          
                 var startDay= (new Date(el[0].value)).getTime();
                 var endDay = (new Date($(input).val())).getTime();
                 
                if(endDay < startDay) return false;
                
            }
        }else if($(input).attr('name') == 'txtQuantity')
        {
             if($(input).val().trim().match(/^[0-9]+/) == null) return false;
            
        }else if($(input).attr('type') == 'file')
        {
            var imgPath = $(input).val().trim();
            if($(input).attr('name')=='fileInsert' || imgPath !=""){
            var ext=imgPath.split(".")[1];
         
           if(ext!='jpg' && ext!='bmp' && ext!='png' ) return false;
       }
        }
        else {
            if($(input).val().trim() == '' || $(input).val().trim().length>50){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    

})(jQuery);
setupPlaceHolders = function(){
  if(!Modernizr.input.placeholder){
    var setPh = function(input){
      if(input.val() == ''){
        input.val(input.attr("placeholder"));
      }
      if(input.val() == input.attr('placeholder')){
        input.addClass('placeholder-text');
      }
    }
    $("[placeholder]").each(function(){
        setPh($(this));
        $(this).focusin(function(){
          $(this).val('');
          $(this).removeClass('placeholder-text');
        });
        $(this).focusout(function(){ 
          setPh($(this));
        });
    });
  }
}
modernize = function(){
  setupPlaceHolders();
}

validateForm = function(){
  $(":input[required]").siblings(".error").css('display', 'none');
  var empty = $(":input[required][value='']")
  empty.siblings('.error').css('display', 'inline');
  empty.siblings('div.error').css('display', 'block');
  return empty.length == 0;

}

setupFormsValidation = function(){
  $('form.validate').submit(validateForm);
}

$(document).ready(function() {
  setupFormsValidation();
  modernize();
});

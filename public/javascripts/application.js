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
  $(":input[required]").siblings(".error.js").css('display', 'none');
  var empty = $(":input[required][value='']")
  empty.siblings('.error.js').css('display', 'inline');
  empty.siblings('div.error.js').css('display', 'block');
  return empty.length == 0;

}

setupFormsValidation = function(){
  $('form.validate').submit(validateForm);
}

setupWysiwyg = function(){
    $('.wysiwyg').wysiwyg({
        initialContent: '',
        rmUnusedControls: true,
        controls: {
          bold: { visible : true },
          italic: { visible : true },
          underline: { visible : true },
          indent: { visible : true },
          outdent: { visible : true },
          insertUnorderedList : { visible : true },
          h1: { visible : true },
          h2: { visible : true },
          h3: { visible : true },
          html: { visible : true }
        }
    });
}

$(document).ready(function() {
  setupFormsValidation();
  modernize();
  setupWysiwyg();
});

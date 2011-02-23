validateForm = function(){
  var empty = $("[required]:text[value='']");
  empty.siblings('.error').css('display', 'inline');
  empty.siblings('div.error').css('display', 'block');
  return empty.length == 0;

}
setupFormsValidation = function(){
  $('form.validate').submit(validateForm);
  //$('form.validate').submit(function(){
  //  var empty = $("input[required]:text[value='']");
  //  empty.siblings('.error').css('display', 'inline');
  //  empty.siblings('div.error').css('display', 'block');
  //  return empty.length == 0;
  //});
}
$(document).ready(function() {
  setupFormsValidation();
});

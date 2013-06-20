$(document).ready(function(){
  $('.event_items').on('click','.remove_fields', function(e){
    e.preventDefault();
    console.log(this)
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
  });

  $('.form-wrap').on ('click', '.add_fields', function(e){
    e.preventDefault();
    var link = $(this);
    var time =  new Date().getTime();
    var regexp = new RegExp(link.data('id'), 'g');
    var html = link.data('fields').replace(regexp, time);
     console.log(this)
    link.closest('ul.event_items').append(html);

  });
});

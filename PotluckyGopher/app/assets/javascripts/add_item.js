$(document).ready(function(){
  $('.new_event form').on('click','.remove_item', function(e){
    e.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
  });

  $('.new_event form').on ('click', '.add_fields', function(e){
    e.preventDefault();
    var link = $(this);
    var time =  new Date().getTime();
    var regexp = new RegExp(link.data('id'), 'g');

    var html = link.data('fields').replace(regexp, time);

    link.closest('.new_event form').find('ul.event_items').append(html);

  });
});

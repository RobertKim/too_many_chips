function BroughtItem(name, quantity){
  this.name = name;
  this.quantity = quantity;
  this.template = '<li class="brought_item"><p class="'+ this.name +'">'+ this.name +'</p><p class="'+ this.name +'_provided">'+ this.quantity +'</p></li>';
}

BroughtItem.prototype.render = function() {
  quantNode = '.' + this.name + '_provided';
  nameNode   = '.guest_items li p.' + this.name
  if($(nameNode).length > 0) {
    $(quantNode).text(this.quantity);
  }
  else {
    $('.guest_items').append(this.template);
  }
};

$(function() {
  $('.event_items form').on('change', 'select', function(e) {
    selectedValue = $(this).val();
    selectedName  = $(this).attr('class');
    newItem = new BroughtItem(selectedName, selectedValue);
    newItem.render();
  });

  $('form.new_guest').on('ajax:success', function(event, data) {
    window.location = data;
  });
  $('form.new_guest').on('ajax:error', function(event,data) {
    $('.errors').html(data.responseText);
    console.log(data.responseText)
  });
});

function BroughtItem(name, quantity){
  this.name = name;
  this.quantity = quantity;
  this.template = '<div class="brought_item"><div class="'+ this.name +'">Item: '+ this.name +'</div><div class="'+ this.name +'_provided">Bringing ' + this.quantity +'</div><div class="show_cover"></div></div>';
}

BroughtItem.prototype.render = function() {
  quantNode = '.' + this.name + '_provided';
  nameNode   = '.guest_items div .' + this.name
  if($(nameNode).length > 0) {
    $(quantNode).text("Bringing " + this.quantity);
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

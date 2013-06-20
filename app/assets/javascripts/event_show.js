function BroughtItem(name, quantity, id){
  this.name     = name;
  this.quantity = quantity;
  this.id       = id;
  this.nameNode = '.' + this.name + '_new' + this.id;
  this.quantNode = '.' + this.name + '_provided' + this.id;
  this.template = '<div class="brought_item"><div class="'+ this.name +'_new'+ this.id + '">Item: <strong> '+ this.name +' </strong></div><div class="'+ this.name +'_provided' +this.id+'">Bringing: <strong>' + this.quantity +'</strong></div><div class="show_cover"></div></div>';
}

BroughtItem.prototype.render = function() {
  if($(this.nameNode).length > 0) {
    $(this.quantNode).html("Bringing: <strong> " + this.quantity) + "</strong>" ;
  }
  else {
    // debugger
    $('.guest_items').append(this.template);
  }
};

$(function() {
  $('.event_items form').on('change', 'select', function(e) {
    var selectedValue = $(this).val();
    var selectedName  = $(this).attr('class');
    var selectedID    = this.length;
    var newItem = new BroughtItem(selectedName, selectedValue, selectedID);
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

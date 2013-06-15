// :event_items
// t.integer :event_id
// t.integer :item_id

// t.string  :guest_name
// t.string  :guest_email
// t.integer :quantity_provided
//----------------------------Event related  functions ----------------------------//
function Item(name, suggestion, quantity){
  this.id =
  this.name = name;
  this.suggestion = suggestion;
  this.quantity_needed = quantity;
}



function Event(eventName, place, date, description){
  this.eventName = eventName;
  this.desc = description;
  this.date = date;
  this.place = place;
  this.items = []
}

Event.prototype.add = function(item){
  this.items.push(item);
};
//----------------------------Rendering functions ----------------------------//
function createEvent(){
  $('.add_event').on('click', function(){
    var eventName = $('.event_name').val();
    var place = $('.place').val();
    var date = $('.date').val();
    var description = $('.description').val();
    myEvent = new Event(eventName, place, date, description);
    // console.log(myEvent);
    renderEvent(myEvent);
    $('.items_form').css('display', '');
  });
};

function createItem(createdEvent){
  $('.add_item').on('click', function(){
    var name = $('.item_name').val();
    var sug = $('.suggestion').val();
    var quantity = $('.quantity_needed').val();
    var item = new Item(name, sug, quantity);
    console.log(item);
    createdEvent.add(item);
    createdEvent.renderEventsItems();
  });
}

function renderEvent(myEvent){
  eventTemplate = '<div class="event_form"><div class="name" placeholder="Title">'+ myEvent.eventName +'</div><div class ="place" placeholder="Location">'+ myEvent.place +'</div><div type="datetime" class="date" placeholder="Date">'+ myEvent.date +'</div><div class="description" placeholder="Description">'+ myEvent.desc +'</div></div>';
  $('.event_form').hide();
  $('.event_details').append(eventTemplate);
};

Event.prototype.renderEventsItems = function(){
  console.log("RENDER MY EVENT ITEMS DAMNIT");
  console.log(this.items)
  this.items.forEach(renderItem);
}


function renderItem(element){
  console.log(element)
  var itemTemplate = '<div class="assigned_item"><div class="name">'+ element.name +'</div><div class="suggestion">'+ element.suggestion +'</div><div class="quantity">' + element.quantity_needed + '</div><div>';
  $('.added_items').append(itemTemplate);
}

var renderCreateEventForm = {
  init: function(){
    createEvent();
  }
}


$(function(){
  // var myEvent = new Event;
  renderCreateEventForm.init();
});

// var Item = {
//   init: function(){
//     $("#new_item").on("submit", function(e){
//       e.preventDefault();
//     $('#new_item').on('ajax:success', function(e, data){
//       // console.log(this);
//       // this.reset(data);
//       // myData = data;
//       $('.added_items').append(data);
//       $.removeData();
//     });
//   });
//   },
//   // appendItem: function(event, data){
//   //   console.log(event);
//   //   console.log(data);
//   //   debugger
//   //   $('.added_items').append(data);
//   // }
// }

// var attributes = { event:
//   {
//     name: 'name',
//     description: 'description',
//     type: 'type',
//     date: 'date',
//     location: 'location',
//     items: [
//     {
//       name: 'name',
//       suggestion: 'suggestion'
//     },
//     {
//       name: 'name',
//       suggestion: 'suggestion'
//     }]
//   }
// };



// $(function(){
//   Item.init();
// });

// // :event_items
// // t.integer :event_id
// // t.integer :item_id

// // t.string  :guest_name
// // t.string  :guest_email
// // t.integer :quantity_provided
// //----------------------------Event related  functions ----------------------------//
// function createEvent(){
//   $('.add_event').on('click', function(){
//     var eventName = $('.event_name').val();
//     var place = $('.place').val();
//     var date = $('.date').val();
//     var description = $('.description').val();
//     myEvent = new Event(eventName, place, date, description);
//     // console.log(myEvent);
//     renderEvent(myEvent);
//     $('.items_form').css('display', '');
//   });
// }

// function createItem(createdEvent){
//   $('.add_item').on('click', function(){
//     var name = $('.item_name').val();
//     var sug = $('.suggestion').val();
//     var quantity = $('.quantity_needed').val();
//     var item = new Item(name, sug, quantity);
//     console.log(item);
//     createdEvent.add(item);
//     createdEvent.renderEventsItems();
//   });
// }

// function renderEvent(myEvent){
//   eventTemplate = '<div class="event_form"><div class="name" placeholder="Title">'+ myEvent.eventName +'</div><div class ="place" placeholder="Location">'+ myEvent.place +'</div><div type="datetime" class="date" placeholder="Date">'+ myEvent.date +'</div><div class="description" placeholder="Description">'+ myEvent.desc +'</div></div>';
//   $('.event_form').hide();
//   $('.event_details').append(eventTemplate);
// }

// Event.prototype.renderEventsItems = function(){
//   console.log("RENDER MY EVENT ITEMS DAMNIT");
//   console.log(this.items);
//   this.items.forEach(renderItem);
// };


// function renderItem(element){
//   console.log(element);
//   var itemTemplate = '<div class="assigned_item"><div class="name">'+ element.name +'</div><div class="suggestion">'+ element.suggestion +'</div><div class="quantity">' + element.quantity_needed + '</div><div>';
//   $('.added_items').append(itemTemplate);
// }

// var renderCreateEventForm = {
//   init: function(){
//     createEvent();
//   }
// };

// var EventRenderer = {
//   createEvent: function(){
//       var eventName = $('.event_name').val();
//       var place = $('.place').val();
//       var date = $('.date').val();
//       var description = $('.description').val();
//       myEvent = new Event(eventName, place, date, description);
//       // console.log(myEvent);
//       renderEvent(myEvent);
//       $('.items_form').css('display', '');
//   },
//   renderEvent: function(){
//     $('.event_form').hide();
//     $('.event_details').append(eventTemplate);
//   },
//   createItem:  function(){
//     $('.add_item').on('click', function(){
//       var name = $('.item_name').val();
//       var sug = $('.suggestion').val();
//       var quantity = $('.quantity_needed').val();
//       var item = new Item(name, sug, quantity);
//       console.log(item);
//       createdEvent.add(item);
//       createdEvent.renderEventsItems();
//     });
//   },
//   renderItem:  function(){}

// };

// // function EventRenderer(){
// //   $('.add_event').on('click', function(){}
// // }




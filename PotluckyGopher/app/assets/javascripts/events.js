var Item = {
  init: function(){
    $("#new_item").on("submit", function(e){
      e.preventDefault();
    $('#new_item').on('ajax:success', function(e, data){
      // console.log(this);
      // this.reset(data);
      // myData = data;
      $('.added_items').append(data);
      $.removeData();
    });
  });
  },
  // appendItem: function(event, data){
  //   console.log(event);
  //   console.log(data);
  //   debugger
  //   $('.added_items').append(data);
  // }
}

$(function(){
  Item.init();
});

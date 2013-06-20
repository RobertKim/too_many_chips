$(document).ready(function(){
  $('.gnup_form').on('click', '.event_button', function(){
    $(this).hide();
    $('.new_event').removeClass('hidden-event');
  });
});




$(document).ready(function (e) {
    function showNewBorders(e) {     
  };
    
    $('.dropdown-menu').on('click', 'a', function(e) {
        e.preventDefault();
        showNewBorders($(this).closest('li'));
        var link = $(this).attr('href');
        $('.guest-items').children().addClass("hidden");
        $(link).removeClass("hidden");
        $(link).addClass("active");
    });

    
});

(function(win) {
  var imageBorder = $(win).height()
  imageBorder -= 150
  $(document).ready(function() {
    $('.event-form-container').height(imageBorder)
  })
})(window)

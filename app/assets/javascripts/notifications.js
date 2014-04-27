$(document).ready(function() {
  $('#toggle_notifications').popover({
    placement: 'auto',
    html: 'true',
    content: function() {
      var div_id =  "div-id-" + $.now();
      return fetch_notifications($(this).attr('data-ajaxload'), div_id)
    }
  });

  function fetch_notifications(link, div_id) {
    $.ajax({
      url: link,
      success: function(response){
          $('#'+div_id).html(response)}});
    return '<div id="'+ div_id +'">Loading...</div>';
  }
});


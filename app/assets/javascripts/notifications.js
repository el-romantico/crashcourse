$( document ).ready(function() {
    $('#toggle_notifications').click(function(){
      if ( $('#notification_panel').css('visibility') == 'hidden' )
        $('#notification_panel').css('visibility','visible');
      else
        $('#notification_panel').css('visibility','hidden');
    });
});


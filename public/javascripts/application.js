jQuery(function ($) {
    $('a[data-remote]').live('ajax:success', function(xhr, data, status) {
        var update = $(this).attr('update');
        if(update){
          $('#' + update).html(data);
          $('#' + update + ' :text:first').focus();
        }
    });
});

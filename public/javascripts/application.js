/* Use by /api to generate channel list for api. Use so that user can import daily data into database. */
var generate_channel_list = function() {
  var options = {
    url: '/api/channels',
    dataType: 'json'
  }

  var list;
  $.ajax(options).done(function(data){
    list = data;
    $.each(data, function (key, value) {
      if(value.channel_url !== null) {

        $button = $('<button>').attr('data-channel-id', value.id).text('Get Today\'s Feeds');

        $a = $('<a>').attr({
          'name': value.id,
          'href': '/api/channel/'+value.id,
          'target': '_blank'
        }).text(value.channel_name);

        $li = $('<li>').append($a).append($button);

        $('.channels').append($li);
      }

    });
  });
}



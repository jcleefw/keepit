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
        if(value.imported == true) {
          $rawButton = $('<button>').attr({'data-channel-id': value.id, 'disabled': 'disabled'}).addClass('btnProcess').text('Done');
        } else {
          $rawButton = $('<button>').attr('data-channel-id', value.id).addClass('raw').text('Get Today\'s Feeds');
        }


        $a = $('<a>').attr({
          'name': value.id,
          'href': '/api/channel/'+value.id,
          'target': '_blank'
        }).text(value.channel_name);
        $aReadable = $('<a>').attr({
          'name': value.id,
          'href': '/api/channel/'+value.id+'/readable',
          'target': '_blank'
        }).text('Readable');

        $li = $('<li>').append($a, $aReadable, $rawButton);

        $('.channels').append($li);
      }

    });
  });
}



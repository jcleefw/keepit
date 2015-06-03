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
        }).html('<h4 class="channel_title">Channel Name: '+value.channel_name+'</h4>');
        $aReadable = $('<a>').attr({
          'name': value.id,
          'href': '/api/channel/'+value.id+'/readable',
          'target': '_blank',
          'class': 'channelOption'
        }).text('Readable');
        $aVariable = $('<a>').attr({
          'name': value.id,
          'href': '/api/channel/'+value.id+'/variable',
          'target': '_blank',
          'class': 'channelOption'
        }).text('Select Variable');

        $li = $('<li>').append($a, $aReadable, $aVariable, $rawButton);

        $('.channels').append($li);
      }

    });
  });
}



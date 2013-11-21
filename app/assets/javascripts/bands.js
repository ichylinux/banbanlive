var band = {};

band.add_band_member = function(trigger) {
  var url = $(trigger).attr('href');
  var table = $(trigger).closest('table');

  var params = {
    index: table.find('tr').length,
    format: 'html'
  };

  $.get(url, params, function(html) {
    table.find('tr').last().before(html);
  });
};

band.select_member = function(trigger) {
  var url = $(trigger).attr('href');
  var params = {
    format: 'js'
  };

  $.get(url, params, function() {
    band.trigger = trigger;
  });
};

band.member_selected = function(member) {
  var tr = $(band.trigger).closest('tr');

  if (member) {
    tr.find('input[name*="member_id"]').val(member.id);
    tr.find('a.member_name').text(member.full_name);
  } else {
    tr.find('input[name*="member_id"]').val('');
    tr.find('a').text('未選択');
  }
};

band.delete_member = function(trigger) {
  var tr = $(trigger).closest('tr');
  tr.find('input[name*="deleted"]').val(true);
  tr.addClass('hidden');
};

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
  var options = {title: 'メンバーを選択', parent: trigger};

  band.dialog = new Dialog('search_members_dialog', options);
  band.dialog.open(url);
};

band.member_selected = function(trigger) {
  if (trigger) {
    var tr = $(trigger).closest('tr');
    var member_id = tr.attr('member_id');
    var member_name = tr.attr('member_name');

    var parent_tr = $(band.dialog.parent).closest('tr');
    parent_tr.find('input[name*="member_id"]').val(member_id);
    parent_tr.find('a.member_name').text(member_name);
  }

  band.dialog.close();
};

band.delete_member = function(trigger) {
  var tr = $(trigger).closest('tr');
  tr.find('input[name*="deleted"]').val(true);
  tr.addClass('hidden');
};

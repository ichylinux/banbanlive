var live = {};

live.add_entry = function(trigger) {
  var url = $(trigger).attr('href');
  var table = $(trigger).closest('table');

  var params = {
    index: table.find('tr').length,
    format: 'html'
  };

  $.get(url, params, function(html) {
    table.find('tr').last().before(html);
    live.update_entry_numbers();
  });
};

live.select_band = function(trigger) {
  var url = $(trigger).attr('href');
  var options = {title: 'バンドを選択', parent: trigger};

  live.dialog = new Dialog('search_bands_dialog', options);
  live.dialog.open(url);
};

live.band_selected = function(trigger) {
  if (trigger) {
    var tr = $(trigger).closest('tr');
    var band_id = tr.attr('band_id');
    var band_name = tr.attr('band_name');

    var parent_tr = $(live.dialog.parent).closest('tr');
    parent_tr.find('input[name*="band_id"]').val(band_id);
    parent_tr.find('a.band_name').text(band_name);
  }

  live.dialog.close();
};

live.delete_entry = function(trigger) {
  var tr = $(trigger).closest('tr');
  tr.find('input[name*="deleted"]').val(true);
  tr.addClass('hidden');
};

live.update_entry_numbers = function() {
  var no = 1;

  $('#entries .entry').each(function() {
    var entry_no = $(this).find('input[name*="entry_no"]');
    entry_no.val(no);
    entry_no.siblings('span').text(no);
    no ++;
  });
};

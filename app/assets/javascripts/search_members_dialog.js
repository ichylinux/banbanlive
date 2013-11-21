var SearchMembersDialog = function(id, html, options) {
  this.selector = '#' + id;
  $(this.selector).remove();
  $('body').append(html);
};

SearchMembersDialog.prototype.open = function(html) {
  $(this.selector).dialog({
    modal: true,
    title: 'メンバーを選択',
    width: '280px',
    buttons: {'閉じる': close }
  });
};

SearchMembersDialog.prototype.close = function() {
  $(this.selector).dialog('close');
};

SearchMembersDialog.prototype.select = function(trigger) {
  var member = {id: '', full_name: ''};

  if (trigger) {
    var tr = $(trigger).closest('tr');
    member.id = tr.attr('member_id');
    member.full_name = tr.attr('member_name');
  }
  
  if (this.callback) {
    this.callback(member);
  }
  this.close();
};

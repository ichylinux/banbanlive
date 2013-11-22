var Dialog = function(id, options) {
  this.id = id;
  this.selector = '#' + id;
  this.title = options.title;
  this.parent = options.parent;
  this.callback = options.callback;
};

Dialog.prototype.open = function(url, params) {
  if (params != null) {
    params.dialog_id = this.id;
  } else {
    params = {dialog_id: this.id};
  }

  var that = this;
  $.get(url, params, function(html) {
    $(that.selector).remove();
    $('body').append(html);
  
    $(that.selector).dialog({
      modal: true,
      title: that.title,
      buttons: {'閉じる': close }
    });
  });
};

Dialog.prototype.close = function() {
  $(this.selector).dialog('close');
};

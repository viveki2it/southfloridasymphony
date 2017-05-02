// Popover

$(function() {

  var $popoverBase = $('[data-toggle="popover"]');
  var $popoverGroup = $('[data-toggle="popover-group"]');

  $.fn.popover.Constructor.DEFAULTS = $.extend({}, $.fn.popover.Constructor.DEFAULTS, {
    html: true,
    trigger: 'hover',
    content: function() {
      var $this = $(this);
      if($this.data('target')) {
        return $($this.data('target')).html();
      } else {
        return $this.data('content');
      }
    }
  });

  $popoverBase.popover();

  $popoverGroup.popover({
    trigger: 'manual',
    animation: false
  }).on("mouseenter", function (e) {
    var _this = this;
    $(this).popover("show");
    $(".popover").css('left', e.pageX).on("mouseleave", function () {
      $(_this).popover('hide');
    });
  }).on("mouseleave", function () {
    var _this = this;
    if (!$(".popover:hover").length) {
      $(_this).popover("hide");
    }
    // setTimeout(function () {
    //   if (!$(".popover:hover").length) {
    //     $(_this).popover("hide");
    //   }
    // }, 100);
  });

  $(document).on('show.bs.popover', function(event) {
    // if ( $(event.target).is('[data-toggle="popover-group"]') ) {
    // }
  });
});
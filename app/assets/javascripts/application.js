// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

var Reactions = Reactions || {};

Reactions.init = function() {
  $(window).on('load', Reactions.checkWidth);
  $(window).on('resize', Reactions.checkWidth);
  Reactions.clickListeners();
};

Reactions.clickListeners = function() {
  $('#toggle-navigation').on('click', Reactions.toggleNav);
};

Reactions.toggleNav = function(e) {
  if ($('#sidebar > ul').is(":visible") === true) {
    $('#main-content').css({
      'margin-left': '0px'
    });
    $('#sidebar').css({ 'margin-left': '-210px' });
    $('#sidebar > ul').hide();
    $("#container").addClass("sidebar-closed");
  } else {
    $('#main-content').css({
      'margin-left': '210px'
    });
    $('#sidebar > ul').show();
    $('#sidebar').css({
      'margin-left': '0'
    });
    $("#container").removeClass("sidebar-closed");
  }
};

Reactions.checkWidth = function() {
  var wSize = $(window).width();
  if (wSize <= 768) {
    $('#container').addClass('sidebar-close');
    $('#sidebar > ul').hide();
  }

  if (wSize > 768) {
    $('#container').removeClass('sidebar-close');
    $('#sidebar > ul').show();
  }
};

$(document).ready(Reactions.init);

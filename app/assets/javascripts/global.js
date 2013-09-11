$(function () {
  if ((window.location.hash !== '') && ($('.nav-tabs > li').length > 0)) {
    activeTabPane =  window.location.hash;
    activeTab = '.' + activeTabPane.replace('#', '') + '-tab';

    console.log(activeTabPane);
    console.log(activeTab);

    $('.nav-tabs > li').removeClass('active');
    $(activeTab).addClass('active');

    $('.tab-pane').removeClass('active in');
    $(activeTabPane).addClass('active in');
  }

  $('a.fancybox').fancybox({
    autoSize    : true,
    closeClick  : true,
    fitToView   : true,
    openEffect  : true,
    closeEffect : true,
    type : 'iframe'
  });
});

function init(){
  $("input[name='birth']").datepicker({
  	
    showButtonPanel: true,
    changeYear: true,
    closeText: "Close",
    yearRange: 'c-100:c+10',
    dateFormat: "yy-mm-dd"
  });
  $( "select" ).selectmenu({
    width: 240,
  });
  $( "input[type='radio']").checkboxradio().buttonset().parent().css({'fontSize': 25.4,'fontFamily': 'nanumpen'})
  $(".btn").button();
  $(".btn").button().css('fontFamily', 'nanumpen');
  $(document).tooltip();
}

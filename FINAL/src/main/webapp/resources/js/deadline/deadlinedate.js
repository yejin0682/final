function init(){
  $("input[name='deadlinedate']").datepicker({
    showButtonPanel: true,
    changeYear: true,
    closeText: "Close",
    yearRange: 'c-100:c+20',
    minDate: "+1w",
    dateFormat: "yy-mm-dd",
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
  });
}



$(function(){ 
  $('.sp-sub-plus').click(function(){ 
    var n = $('.bt_up').index(this);
    var num = $(".num:eq("+n+")").val();
    num = $(".num:eq("+n+")").val(num*1+10000); 
  });
  $('.sp-sub-minus').click(function(){ 
    var n = $('.bt_down').index(this);
    var num = $(".num:eq("+n+")").val();
    num = $(".num:eq("+n+")").val(num-10000); 
   if($(".num:eq("+n+")").val() <= 0) {
   	 	$(".num:eq("+n+")").val(0);
   	 
   }
  });
})

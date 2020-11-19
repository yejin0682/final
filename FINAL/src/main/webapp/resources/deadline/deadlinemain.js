$(document).ready(function(){
  init();
  $('form').submit(function(e){
    //e.preventDefault();
    return checkAll();
  })
})
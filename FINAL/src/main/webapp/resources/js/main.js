$(document).ready(function(){
  init();
  searchPostcode();
  $('form').submit(function(e){
    //e.preventDefault();
    return checkAll();
  })
})
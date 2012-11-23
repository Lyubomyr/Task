$(document).ready(function($){
  var h = $("#picture_order_human_count option:selected").text();
  var s = $("#picture_order_size option:selected").text();
  var f = $("#picture_order_frame option:selected").text();
  var gel_price = 80;
  price(h, s, f);

  $('#picture_order_human_count').change(function() {
	h = $("#picture_order_human_count option:selected").text();
  	price(h, s, f);
   });

  $('#picture_order_size').change(function() {
	s = $("#picture_order_size option:selected").text();
  	price(h, s, f);
   });

  $('#picture_order_frame').change(function() {
	f = $("#picture_order_frame option:selected").text();
  	price(h, s, f);
   });

  $('#picture_order_gel_true').change(function() {
	$('#price').text(parseInt($('#price').text())+gel_price);
   });

  $('#picture_order_gel_false').change(function() {
	$('#price').text(parseInt($('#price').text())-gel_price);
   });

   function price(human_count, size, frame){
  	var h_int = parseInt(human_count.match(/\d{2,}/));
	var s_int = parseInt(size.match(/\d{3,}/));
	var f_int = parseInt(frame.match(/\d{2,}/));

	var s1 = parseInt(size.match(/^\d*/));
	var s2 = parseInt(size.substr(3,2));
	var long = ((s1+s2)*2*0.01)+(s1+s2)*2*0.001;
	var pr = h_int+s_int+Math.round(f_int*long);
	$('#price').text(pr);
   }


   var photo_pic = $('#photo_pictures option:selected').text();
   var pic = $('#picture_order_picture_id option:selected').text();
   picture(photo_pic, pic);

  $('#photo_pictures').change(function() {
	photo_pic = $('#photo_pictures option:selected').text();
  	picture(photo_pic, pic);
   });

  $('#picture_order_picture_id').change(function() {
	pic = $('#picture_order_picture_id option:selected').text();
  	picture(photo_pic, pic);
   });

   function picture(category, photo){
	path = '/pictures/' + category +'/mini/' + photo + '-mini.jpg'
	$('img#picture').attr("src", path)
   }
});

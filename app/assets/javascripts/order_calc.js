$(document).ready(function($){
  $('#photos').find('div').first('.photo').find('a.remove_fields').hide();

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

   var pictures = gon.pictures;
   var pic = $('#picture_order_picture_id option:selected').val();
   picture(pic);

  $('#photo_pictures').change(function() {
	pic = $('#picture_order_picture_id option:selected').val();
  	picture(pic);
   });

  $('#picture_order_picture_id').change(function() {
	pic = $('#picture_order_picture_id option:selected').val();
  	picture(pic);
   });

   function picture(photo){
	path = jQuery.grep(pictures, function (a) { return a[1] == photo; });
	$('img#picture').attr("src", path[0][2]);
   }

   //work with checkbox ------------------------
   var redirect = $('#change_picture').attr("value");
	if(redirect == 'on'){
		$('#change_picture').hide();
		$('#change_pic').hide();
	}
	else{
		$('#change_picture').show();
		$('#change_pic').show();
		picture_editing();
	}

   $('#change_picture').change(function() {
	picture_editing();
   });

   function picture_editing(){
	//alert('asdf');
	if ($('#change_picture').attr('checked') == 'checked') {
		//$('#photo_pictures').attr('disabled', 'disabled');
		//$('#picture_order_picture_id').attr('disabled', 'disabled');
		$('#picture_block').hide();
	}
	else {
		$('#picture_block').show();
			//$('#photo_pictures').removeAttr('disabled');
		//$('#picture_order_picture_id').removeAttr('disabled');
	}


   }

});

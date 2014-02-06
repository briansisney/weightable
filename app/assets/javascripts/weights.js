// $(document).on("ajax:success", function (e, data) {
// //   console.log("Ajax Response data:", data);
// });
// $('.new_weight').click(function (e) {
//   $(".new-weight-form").append("<%= j render('form' %>".html());
// });

$('.weight_button').click( function (e) {
  e.preventDefault();
  $(this).closest('.form').children('.form_div').toggleClass('show_form');
  // $(this).toggleClass('hide')
});

// $("form").submit(function(e){
//   e.preventDefault();
//   $('input[type=submit]').attr('disabled', 'disabled');
// });

// $('.form').on('click', ".weight_button", function (e) {
//   e.preventDefault();
//   $('.form_div').toggleClass('show_form');
//   // $(this).toggleClass('hide')
// });

// $('button').click( function (e) {
//   e.preventDefault();
//   $('.form_div').toggleClass('show_form');
//   // $(this).toggleClass('hide')
// });
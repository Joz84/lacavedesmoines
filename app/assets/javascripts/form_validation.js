$('form input, form textaera, new_order').on('keyup change', function(event) {
  var input = $(this);
  var value = input.val();
  var id    = input.attr('id');
  var isValid = false;

  isValid = (value !== '');

  if (id === 'user_email') {
    var email_regexp = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    isValid = email_regexp.test(value);
  } else if (id === 'order_postal_code') {
    var zipcode_regexp = /^\d{5}$/i;
    isValid = zipcode_regexp.test(value);
  } else if (id === 'order_telephone') {
    var phone_regexp = /^(\+33|0033|0)\d{9}$/i;
    isValid = phone_regexp.test(value);
  } else if (id === 'order_complement') {
    isValid = true;
  }

  if (isValid) {
    input.parent().removeClass('has-error').addClass('my-success');
  } else {
    input.parent().removeClass('has-success').addClass('has-error');
  }

});



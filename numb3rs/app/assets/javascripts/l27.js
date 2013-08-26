$(document).ready(function () {
  $('#l27').keyup(function () {
    var text = $(this).val();
    text = text.toLowerCase();

    // Convert to L27
    text = text.replace(/[^a-z-]/g, '-');

    var chars = text.split('').reverse();
    var decimal = 0;

    for (var i = 0; i < chars.length; i++) {
      var c = chars[i];

      if (c === '-') return; // - counts for 0.

      var value = c.charCodeAt() - 96; // Char code for the character before 'a'
      decimal = decimal + value * Math.pow(27, i);
    }

    $('#decimal').val(decimal);
  });

  $('#decimal').keypress(function () {
    // HOMEWORK LOLZ
  });
});
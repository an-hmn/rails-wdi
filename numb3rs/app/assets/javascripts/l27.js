$(document).ready(function () {

  // Calculate decimal version of L27 text and update the decimal <textarea>.
  $('#l27').keyup(function () {
    var text = $(this).val();
    text = text.toLowerCase();

    // Convert to L27
    text = text.replace(/[^a-z-]/g, '-');

    var chars = text.split('').reverse();
    var decimal = 0;

    for (var i = 0; i < chars.length; i++) {
      var c = chars[i];

      if (c === '-') continue; // - counts for 0.

      var value = c.charCodeAt() - 96; // Char code for the character before 'a'
      decimal = decimal + value * Math.pow(27, i);
    }

    $('#decimal').val(decimal);
  });

  // Calculate the L27 text for the decimal entered and update the L27 <textarea>.
  $('#decimal').keyup(function () {
    var decimal = $(this).val();
    n = parseInt(decimal);

    // He's the man, who's name you'd love to touuuch...
    var max_power = Math.ceil(Math.log(n) / Math.log(27)); // Or some other big number.
    var digits = [];

    for (var i = max_power; i >= 0; i--) {
      var quotient = Math.floor(n / Math.pow(27, i));
      if (quotient > 0) {
        digits.push(String.fromCharCode(96 + quotient));
        n = n - (quotient * Math.pow(27, i));
      } else {
        digits.length && digits.push('-')
      }
    }

    $('#l27').val(digits.join(''));
  });
});
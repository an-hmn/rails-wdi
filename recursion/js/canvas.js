$(document).ready(function () {
  var canvas = $('#limuel')[0];
  var context = canvas.getContext('2d');

  var MAX_DEPTH = 6;

  var draw_square = function (top, left, length) {
    // top
    draw_line(top, left, top, left + length);
    // right
    draw_line(top, left + length, top + length, left + length);
    // bottom
    draw_line(top + length, left, top + length, left + length);
    // left
    draw_line(top, left, top + length, left);
  };

  var draw_line = function (x1, y1, x2, y2) {
    context.moveTo(x1, y1);
    context.lineTo(x2, y2);
    context.stroke();
  };

  var draw_squares_recursive = function (top, left, length, depth) {

    draw_square(top, left, length);

    if (depth < MAX_DEPTH) {
      length = length / 2;
      draw_squares_recursive(top, left, length, depth + 1)
      draw_squares_recursive(top + length, left + length, length, depth + 1)
    }
  };

  draw_squares_recursive(0, 0, 512, 0);
});

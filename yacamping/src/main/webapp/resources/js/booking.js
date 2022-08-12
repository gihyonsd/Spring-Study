/*어른인원 업다운*/
$(function () {
  $('#down').click(function (e) {
    e.preventDefault();
    var stat = $('#number').val();
    var num = parseInt(stat, 10);
    num--;
    if (num <= 0) {
      alert('최소 1명 이상 예약하셔야 합니다.');
      num = 1;
    }
    $('#number').val(num);
  });
  $('#up').click(function (e) {
    e.preventDefault();
    var stat = $('#number').val();
    var num = parseInt(stat, 10);
    num++;

    if (num > 4) {
      alert('정원초과입니다.');
      num = 4;
    }
    $('#number').val(num);
  });
});

/*아동인원 업다운*/
$(function () {
  $('#down1').click(function (e) {
    e.preventDefault();
    var stat = $('#number1').val();
    var num = parseInt(stat, 10);
    num--;
    if (num <= 0) {
      alert('최소 1명 이상 예약하셔야 합니다.');
      num = 1;
    }
    $('#number1').val(num);
  });
  $('#up1').click(function (e) {
    e.preventDefault();
    var stat = $('#number1').val();
    var num = parseInt(stat, 10);
    num++;

    if (num > 4) {
      alert('정원초과입니다.');
      num = 4;
    }
    $('#number1').val(num);
  });
});


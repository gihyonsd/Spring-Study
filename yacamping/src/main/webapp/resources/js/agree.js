/* 전체동의 체크박스 */
$(document).ready(function() {
  $("#cbx_chkAll").click(function() {
    if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
    else $("input[name=chk]").prop("checked", false);
  });
  $("input[name=chk]").click(function() {
    var total = $("input[name=chk]").length;
    var checked = $("input[name=chk]:checked").length;
   
    if(total != checked) $("#cbx_chkAll").prop("checked", false);
    else $("#cbx_chkAll").prop("checked", true);
  });
});


/*약관동의 필수 미선택시 경고창 */
function CheckForm(Join) {

  var chk1 = document.frmJoin.ck1.checked;
  var chk2 = document.frmJoin.ck2.checked;

  if (!chk1) {
      alert('이용약관 동의는 필수입니다.');
      return false;
  }
  if (!chk2) {
      alert('개인정보 수집 및 이용에 대한 동의는 필수입니다.');
      return false;
  }
}
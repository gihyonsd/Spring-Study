/* 3초 후 자동으로 메인으로 이동 */
window.onload = function () { 
  setTimeout("startPage()", 3000
  ); 
}
function startPage() { 
  document.location.href = "/"; 
}

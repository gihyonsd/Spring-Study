//이메일 도메인 선택 혹은 직접 입력
function selectEmail(ele){
    var $ele = $(ele);
    var $email1 = $('input[name=email1]');
    var $email2 = $('input[name=email2]');
    var $email = $('input[name=email]');

   // var $email = $email1+$email2;
    // '1'인 경우 직접입력
    if($ele.val() == "1"){
        $email2.attr('readonly', false);
        $email2.val('');
    } else {
        $email2.attr('readonly', true);
        $email2.val($ele.val());
        $email.val($email1.val() + '@' + $email2.val());
    }
}

// 유효성 검사
function do_submit() {
	 let id = document.getElementById("id");
	 let password = document.getElementById("password");
	 let name = document.getElementById("name");
	 let nickname = document.getElementById("nickname");
	 let birth = document.getElementById("birth");
	 let r1 = document.getElementById("r1");
	 let r2 = document.getElementById("r2");
	 let r3 = document.getElementById("r3");
	 let phone = document.getElementById("phone");
	 let email1 = document.getElementById("email1");
	 let email2 = document.getElementById("email2");
	 if(id.value.length == 0) {
		 alert('아이디를 입력하세요');
		 return false;
	 }
	 if(password.value.length == 0) {
		 alert('비밀번호를 입력하세요');
		 return false;
	 }
	 if(name.value.length == 0) {
		 alert('이름을 입력하세요');
		 return false;
	 }
	 if(nickname.value.length == 0) {
		 alert('닉네임을 입력하세요');
		 return false;
	 }
	 if(birth.value.length == 0) {
		 alert('생년월일을 선택하세요');
		 return false;
	 }
	 if(!r1.checked && !r2.checked && !r3.checked) {
		 alert('성별을 선택하세요');
		 return false;
	 }
	 if(phone.value.length == 0) {
		 alert('전화번호를 입력하세요');
		 return false;
	 }
	 if(email1.value.length == 0) {
		 alert('이메일을 입력하세요');
		 return false;
	 }
	 if(email2.value.length == 0) {
		 alert('도메인을 입력하거나 선택하세요');
		 return false;
	 }
}

//주소찾기 및 입력
function sample6_execDaumPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
           if(data.userSelectedType === 'R'){
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraAddr !== ''){
                   extraAddr = ' (' + extraAddr + ')';
               }
               // 조합된 참고항목을 해당 필드에 넣는다.
               document.getElementById("sample6_extraAddress").value = extraAddr;

           } else {
               document.getElementById("sample6_extraAddress").value = '';
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('sample6_postcode').value = data.zonecode;
           document.getElementById("sample6_address").value = addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById("sample6_detailAddress").focus();
       }
   }).open();
}

//비밀번호 조건 불일치 시 alert창
function check_pw() {
    var pw = document.getElementById('password').value;
    var SC = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
    var check_SC = 0;

    if (pw.length < 6 || pw.length > 16) {
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('password').value = '';
    }
    for (var i = 0; i < SC.length; i++) {
        if (pw.indexOf(SC[i]) != -1) {
            check_SC = 1;
        }
    }
    if (check_SC == 0) {
        window.alert('숫자를 포함하여 비밀번호를 작성하여 주세요.')
        document.getElementById('password').value = '';
    }
}

//비밀번호 재확인 시 일치, 불일치 확인 문구
function check_pw2() {
    if (document.getElementById('password').value != '' && document.getElementById('password2').value != '') {
        if (document.getElementById('password').value == document.getElementById('password2').value) {
            document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
            document.getElementById('check').style.color = 'blue';
        }
        else {
            document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color = 'red';
        }
    }
}
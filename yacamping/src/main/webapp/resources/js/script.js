let turn = 0;
Slide();

function Slide() {
	let slide = document.querySelectorAll(".slideimg > a > img");
	for (let i = 0; i < slide.length; i++) {
		slide[i].style.display = "none";
	}
	turn++;
	if (turn > slide.length)
		turn = 1;
	slide[turn - 1].style.display = "block";
	setTimeout(Slide, 3000);
}


/*지역선택 클릭시 모달창*/
document.getElementById("result").onclick = function() {
	document.getElementById("modal").style.display="block";
}

document.getElementById("modal_close_btn").onclick = function() {
	document.getElementById("modal").style.display="none";
}    

document.getElementById("modal_layer").onclick = function() {
	document.getElementById("modal").style.display="none";
} 



/*지역선택값출력 */
function getregion(event) {
	document.getElementById('result').value =
			event.target.value;
}




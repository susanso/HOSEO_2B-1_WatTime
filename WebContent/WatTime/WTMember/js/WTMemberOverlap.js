
//아이디 사용
function useMemIdBtn(){
	var memId = document.getElementById("useMemIdHD").value
	opener.document.getElementById("memId").value = memId;
	opener.document.getElementById("idHidden").value = "yes";
	opener.document.getElementById("idCheckText").textContent=""
	window.close();
	call(passCheck());
}
//중복확인 팝업 안에서 실행 
function idReOverlap(){
	var memId = document.getElementById("memId").value;
	var check = /^[A-za-z0-9]/g;
	var space = " ";
	if(memId == null || memId == ""){
		alert("아이디를 입력해주세요.");
	}else if(memId.indexOf(" ") != -1){
		alert("아이디에 공백이 있습니다.");
	}else if(memId.length < 6 || memId.length > 15){
		alert("아이디는 최소 6자 최대 15자 입니다.");
	}else if(check.test(memId) == false){
		alert("아이디는 영문과 숫자만 사용 가능합니다.");
	}else{
		url = "../WTMember/WTMemberIdOverlapCheck.jsp?id="+document.getElementById("memId").value
		var ret = window.open(url,"_self","width=1, height=1, scrollbars=no, resizable=no, toolbars=no, menubar=no",false)
		w = window.outerWidth - window.innerWidth;
		h = window.outerHeight - window.innerHeight;
		ret.resizeTo(w,h)
	}	
}
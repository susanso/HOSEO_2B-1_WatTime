//우편번호찾기 버튼
function addressSearch(){
	if(document.getElementById("memAddress").value=""){
		alert("검색할 주소를 넣어주세요.");
	}else{
		document.addressSearchForm.submit();
	}
	
}
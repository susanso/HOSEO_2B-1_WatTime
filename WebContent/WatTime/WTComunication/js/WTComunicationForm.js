//리스트로 돌아가기
function listBack(pageNum,listCount){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationList.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//글 수정
function comunicationModifyForm(boradNum,formPageNum,listPageNum,listCount){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationModifyForm.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "boradNum");
	hiddenField.setAttribute("value", boradNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", formPageNum);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);

	document.body.appendChild(form);
	
	form.submit();
}
//글 삭제
function comunicationDelete(boradNum,formPageNum,listPageNum,listCount){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationDeletePro.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "boradNum");
	hiddenField.setAttribute("value", boradNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", formPageNum);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);

	document.body.appendChild(form);
	
	form.submit();
}
//추천 
function recommend(log, boardNum, formPageNum, listPageNum, listCount){
	if(log=="no"){
		alert("로그인을 해주세요");
	}else{
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationRecommendPro.jsp");
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "boardNum");
		hiddenField.setAttribute("value", boardNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "formPageNum");
		hiddenField.setAttribute("value", formPageNum);
		form.appendChild(hiddenField);
	
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listPageNum");
		hiddenField.setAttribute("value", listPageNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listCount");
		hiddenField.setAttribute("value", listCount);
		form.appendChild(hiddenField);
		
		
		
		document.body.appendChild(form);
		
		form.submit();
	}
}
//비추천
function unrecommend(log, boardNum, formPageNum, listPageNum, listCount){
	if(log=="no"){
		alert("로그인을 해주세요");
	}else{
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationUnrecommendPro.jsp");
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "boardNum");
		hiddenField.setAttribute("value", boardNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "formPageNum");
		hiddenField.setAttribute("value", formPageNum);
		form.appendChild(hiddenField);
	
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listPageNum");
		hiddenField.setAttribute("value", listPageNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listCount");
		hiddenField.setAttribute("value", listCount);
		form.appendChild(hiddenField);
		
		
		
		document.body.appendChild(form);
		
		form.submit();
	}
}

//답글
function replyPage(num,ref, re_step, re_level){
	
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationWriteForm.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "ref");
	hiddenField.setAttribute("value", ref);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_step");
	hiddenField.setAttribute("value", re_step);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_level");
	hiddenField.setAttribute("value", re_level);
	form.appendChild(hiddenField);
	
	
	
	document.body.appendChild(form);
	
	form.submit();
	
}
//댓글달기
function commentSubmit(boardNum,comment,memId,memName,log,ref,re_step,re_level,commentNum,listPageNum,listCount){
	if(log=="no"){
		alert("로그인을 해주세요.");
	}else{
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationCommentPro.jsp");

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "boardNum");
		hiddenField.setAttribute("value", boardNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "comment");
		hiddenField.setAttribute("value", comment);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "memId");
		hiddenField.setAttribute("value", memId);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "memName");
		hiddenField.setAttribute("value", memName);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "ref");
		hiddenField.setAttribute("value", ref);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "re_step");
		hiddenField.setAttribute("value", re_step);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "re_level");
		hiddenField.setAttribute("value", re_level);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "re_level");
		hiddenField.setAttribute("value", re_level);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "commentNum");
		hiddenField.setAttribute("value", commentNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listPageNum");
		hiddenField.setAttribute("value", listPageNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listCount");
		hiddenField.setAttribute("value", listCount);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	}

}
//댓글 답글 달기
function replyComment(commentNum, ref, re_step, re_level, num, pageNum, listPageNum, listCount){
	
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationForm.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "ref");
	hiddenField.setAttribute("value", ref);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_step");
	hiddenField.setAttribute("value", re_step);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_level");
	hiddenField.setAttribute("value", re_level);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "commentNum");
	hiddenField.setAttribute("value", commentNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	
	document.body.appendChild(form);
	
	form.submit();
}
//댓글 수정 폼

function commentModifyForm(commentNum, ref, re_step, re_level, num, pageNum, listPageNum, listCount){
	
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationForm.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "ref");
	hiddenField.setAttribute("value", ref);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_step");
	hiddenField.setAttribute("value", re_step);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_level");
	hiddenField.setAttribute("value", re_level);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "commentNum");
	hiddenField.setAttribute("value", commentNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", commentNum);
	form.appendChild(hiddenField);
	
	
	document.body.appendChild(form);
	
	form.submit();
}
//댓글 수정 
function commentModify(commentNum, num, pageNum, listPageNum, listCount){
	var comment = document.getElementById("commentModify").value;
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationCommentModifyPro.jsp");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "comment");
	hiddenField.setAttribute("value", comment);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "commentNum");
	hiddenField.setAttribute("value", commentNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//수정 취소
function commentModifyCencle(num, pageNum, listPageNum, listCount){

	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationForm.jsp?pageNum="+pageNum);

	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "ref");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_step");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_level");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "commentNum");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//댓글 삭제
function commentDelete(commentNum,boardNum,pageNum, listCount,listPageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationCommentDeletePro.jsp");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "boardNum");
	hiddenField.setAttribute("value", boardNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "commentNum");
	hiddenField.setAttribute("value", commentNum);
	form.appendChild(hiddenField);
	
	
	document.body.appendChild(form);
	
	form.submit();
}
//페이지
function pageNum(pageNum, listCount, boardNum, listPageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationForm.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", boardNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "ref");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_step");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_level");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "commentNum");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//다음
function next(pageNum, listCount, boardNum, listPageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationForm.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", boardNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "formPageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listPageNum");
	hiddenField.setAttribute("value", listPageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "ref");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_step");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "re_level");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "commentNum");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
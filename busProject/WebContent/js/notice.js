function noticeDeleteJS(no) {
	var result = confirm("정말 삭제하시겠습니까?");
	if(result==true){
		location.href = "noticeDelete.do?no="+no;
	}
}//noticeDeleteJS END

function noticeUpdateJS() {
	var result = confirm("이대로 수정하시겠습니까?");
	if(result==true){
		nullCheck();
	}
}//noticeDeleteJS END

function FaQDeleteJS(no) {
	var result = confirm("정말 삭제하시겠습니까?");
	if(result==true){
		location.href = "FaQDelete.do?no="+no;
	}
}//FaQDeleteJS END

function FaQUpdateJS() {
	var result = confirm("이대로 수정하시겠습니까?");
	if(result==true){
		nullCheck();
	}
}//FaQDeleteJS END

function nullCheck(){
	var title = document.noticeForm.title.value;
	var content = document.noticeForm.content.value;
	
	if(title==null||title==""){
		alert("제목이 비어있습니다.");
	}else if(content==null||content==""){
		alert("내용이 비어있습니다.");
	}else{
		document.noticeForm.submit();
	}
}//nullCheck END
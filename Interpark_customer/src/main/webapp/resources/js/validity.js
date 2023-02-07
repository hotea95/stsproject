$(function() {
	$.validator.setDefaults({
		onkeyup : false,
		onclick : false,
		onfocusout : false,
		showErrors : function(errorMap, errorList) {
			if (this.numberOfInvalids()) { // 에러가 있으면
				alert(errorList[0].message); // 경고창으로 띄움
			}
		}
	});
	$.validator.addMethod("regex", function(value, element, regexpr) {
		return regexpr.test(value);
	});
	// JSON 형식으로 유효성 검사의 규칙을 지정한다.
	// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
	// /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	// 핸드폰 정규식 /^\d{2,3}-\d{3,4}-\d{4}$/
	$("#validity")
			.validate(
					{
						// 유효성 검사에서 제외한다.
						ignore : [],
						// 검사할 필드와 검사 항목을 나열한다.
						rules : {
							mname : {
								required : true,
								regex : /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/
							},
							id : {
								required : true,
								// 길이를 지정한다.
								minlength : 4,
								regex : /^[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/
							},
							password : {
								required : true,
								minlength : 4,
								// 최대길이를 지정한다.
								maxlength : 8
							},
							passChk : {
								required : true,
								equalTo : "#password"
							},
							email : {
								required : true,
								email : true,
								regex : /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
							},
							phone : {
								required : true,
								regex : /^[0-9]{10,11}$/
							},
							idCheck : {
								required : true
							}
						},
						// 검사를 충족하지 못하면 표시될 메시지를 나열한다.
						messages : {
							mname : {
								required : "이름을 입력하세요",
								regex : "이름은 한글만 입력가능합니다."
							},
							id : {
								required : "아이디를 입력하세요.",
								minlength : "아이디는 최소 {0} 글자입니다.",
								regex : "공백또는 특수문자를 제거하세요."
							},
							password : {
								required : "비밀번호를 입력하세요.",
								minlength : "비밀번호는 최소 {0} 글자입니다.",
								maxlength : "비밀번호는 최대 {0} 글자입니다."
							},
							passChk : {
								required : "비밀번호를 확인하세요.",
								equalTo : "비밀번호가 틀립니다."
							},
							email : {
								required : "이메일을 입력하세요.",
								email : "이메일 형식을 확인하세요.",
								regex : "이메일 형식을 확인하세요."
							},
							phone : {
								required : "휴대폰번호를 입력하세요.",
								regex : "휴대폰번호는 -를 제외한 10~11자리로 써주세요."
							},
							idCheck : {
								required : "아이디 중복을 확인하세요."
							}
						}
					});
});
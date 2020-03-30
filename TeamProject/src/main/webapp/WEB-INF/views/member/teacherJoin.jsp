<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/fixed-topbar.jsp"%>

	<div class="container-lg joinDiv">
		<div class="page-header col-xl-8 offset-xl-2 text-center">
			<h2>전문가등록</h2>
		</div>
		<div
			class="col-sm-12 col-md-12 col-lg-8 col-xl-8 offset-xl-2 offset-lg-2 joinForm"
			style="padding-left: 10px; padding-right: 10px;">
			<form method="post" id="join_form" name="join_form"
				action="${path}/member/insertMember.do" class="form-horizontal">
				<div class="form-group">
					<label for="username">성명</label> &nbsp; <span id="usernameM"></span>
					<input type="text" class="form-control" id="username"
						name="username" placeholder="이름을 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="userid">아이디</label>&nbsp; <span id="CheckM"></span> <span
						id="useridM"></span> <input class="form-control" id="userid"
						name="userid" oninput="checkId()" placeholder="아이디를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="passwd">비밀번호</label>&nbsp; <span id="bpasswdM"></span>
					<input type="password" class="form-control" id="bpasswd"
						name="bpasswd" placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="passwdCheck">비밀번호 확인</label>&nbsp; <span
						id="passwdCheckM"></span> <input type="password"
						class="form-control" id="passwdCheck" name="passwdCheck"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
				</div>
				<div class="form-group">
					<label for="email">이메일 주소</label> &nbsp; <span id="useremailM"></span>
					<input class="form-control" id="useremail" name="useremail"
						placeholder="이메일 주소를 입력해주세요">
				</div>
				<div class="labelname">
					<label for="phonename">핸드폰</label> &nbsp; <span id="phoneM"></span><br>
					<input type="hidden" class="form-control" name="postname">
				</div>

				<div class="form-group" style="display: flex;">
					<div class="col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<select class="form-control p-0" id="phone1" name="phone1">
							<option value="02" selected>-선택-</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
							<option value="017">017</option>
						</select>
					</div>
					<div class="col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<input type="text" class="form-control p-0" id="phone2"
							name="phone2" placeholder="1234" maxlength="4">
					</div>
					<div class="col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0"
						id="phone_text3">
						<input type="text" class="form-control p-0" id="phone3"
							name="phone3" placeholder="5678" maxlength="4">
					</div>
				</div>
				<div class="labelname">
					<label for="phonename">생년월일</label> &nbsp; <span id="birthdayM"></span>
					<br> <input type="hidden" class="form-control">
				</div>
				<div style="display: flex;">
					<div class="form-group col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<input type="text" class="form-control" id="birthday1"
							name="birthday1" placeholder="2000" maxlength="4">
					</div>
					<div class="form-group col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<select class="form-control" id="birthday2" name="birthday2">
							<option value="00" selected>-선택-</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</div>
					<div class="form-group col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0"
						id="birthday_text3">
						<input type="text" class="form-control" id="birthday3"
							name="birthday3" placeholder="20" maxlength="2">
					</div>
				</div>
				<div class="labelname">
					<label for="postname">우편번호</label> &nbsp; <span id="postcodeM"></span>
					<br> <input type="hidden" class="form-control" name="postname">
				</div>
				<div style="display: flex;">
					<div class="form-group col-6 p-0">
						<input type="text" id="postcode" name="postcode"
							placeholder="우편번호" class="form-control">
					</div>
					<div class="form-group d-none d-lg-block d-xl-block  col-6 p-0">
						<input type="button" onclick='execDaumPostcode()' value="우편번호 찾기"
							class="btn btn-primary">
					</div>
					<div class="form-group d-xl-none d-lg-none col-6 p-0">
						<input type="button" onclick="openDaumZipAddress()"
							value="우편번호 찾기" class="btn btn-primary">
					</div>
				</div>
				<div id="wrap" class="form-group col-sm-5 col-md-5"
					style="display: none; width: 100%;"></div>
				<div class="form-group">
					<label for="address">주소</label> &nbsp; <span id="addressM"></span>
					<input type="text" id="address" placeholder="주소" name="address"
						class="form-control">
				</div>
				<div class="form-group">
					<label for="address2">상세주소</label>&nbsp; <span id="address2M"></span>
					<input type="text" id="address2" placeholder="상세주소" name="address2"
						class="form-control">
				</div>

			</form>
		</div>
	</div>




</body>
</html>
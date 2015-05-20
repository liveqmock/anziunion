<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="activites" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
.reginster_note {position: absolute;right: 50px;top: 120px;padding-bottom: 30px;width: 270px;background: url(/images/register_note_bkg.png) no-repeat center bottom;}
.reginster_note h2{line-height: 38px;text-align: center;font-size: 16px;border: 1px solid #d9dbdb;background: #c4c5c5;color: #fff;border-bottom: 1px solid #fff;}
.reginster_note dl{border: 1px solid #d9dbdb;background: #fff;padding: 20px 20px 80px;font-size: 12px;line-height: 18px;color: #949696;background: url(/images/register_note_pic.jpg) no-repeat right bottom#fff;}
.reginster_note dt {color: #997b5e;line-height: 26px;}
.reginster_note dd {margin: 5px 0 10px 20px;}
.promote span {font-style: normal;font-size: 20px;}
.promote input[type="text"] {position: relative;text-align: top;width: 300px;height: 18px;line-height: 18px;padding: 10px 5px;border: none;border-bottom: 1px solid #d9dbdb;outline: none;border-radius: 2px;}
.promote input[type="submit"] {position: relative;width: 160px;font-size: 14px;height: 40px;background-color: red;border: none;color: #fff;background: #ee2323;cursor: pointer;text-align: center;border-radius: 2px;left: 100px;top: 20px;}
</style>

	<div class="main cs">
		
	
		<div class="aside">
			<dl>
				<dt>推广链接</dt>
				
				<dd ><a href="vipCardList.shtml">会员卡列表</a></dd>
				<dd><a href="vipCard.shtml">发布会员卡</a></dd>
				<dd><a href="vipCardOrder.shtml">会员卡订单数据</a></dd>
				<dd class="active"><a href="promote.shtml">推广链接</a></dd>
				<dd><a href="getUserVipList.shtml">我的会员</a></dd>
				<dd><a href="gethiveaction.shtml">蜂巢系统</a></dd>
			</dl>
		</div>


		<div class="usr_title">
		<i class="usr_title_img" style="background:none;"><img src="/images/promote.png" height="60px;"/></i>
			<h3>我的推广</h3>
			<p>用户通过您的推广链接注册，可或得消费提成</p>
		</div>
		
		<div style="margin-top: 80px;">
			<form action="promoteAdd.shtml" class="promote" method="post">
			<cite>
				<span><em></em>推广链接：</span>
				<input type="text" name="url" value="${url}"  readonly="readonly"/>
			</cite>
			<br>
			<br>
			<c:if test="${empty url}">
				<cite><input type="submit" value="生成链接"></cite>
			</c:if>
			
			</form>
		</div>

	
			<div class="reginster_note">
				<h2>推广说明</h2>
				<dl>
					<dt class="active">1、一次推广终生享受会员消费提成</dt>
					<dt>2、还等什么，赶快去推广吧!</dt>
					<dt>3、每个商户的推广链接是唯一的！</dt>
					<br>
				</dl>
			</div>


	

	</div>



	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	request.setAttribute("css","global,index");
	request.setAttribute("js","global,form,index");

%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+path;
%>
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,index" /></jsp:include>

	<div class="banner">
		<ul>
			<li><a><img src="/images/banner_2.jpg"></a></li>
			<li><a><img src="/images/banner_1.jpg"></a></li>
			<li><a><img src="/images/banner_3.jpg"></a></li>
			<li><a><img src="/images/banner_4.jpg"></a></li>
			<li><a><img src="/images/banner_5.jpg"></a></li>
			<li><a><img src="/images/banner_6.jpg"></a></li>
		</ul>
	</div>

	<div class="login">
		<form class="fukrm fukrm-ajax" action="longin.shtml" method="post" >
			<h2>异业联盟登录</h2>

			<c:if test="${islog eq 'failure' || pass eq 'failure' || code eq 'failure'}"><span style="display:inline-block;margin:5px 10px;color:#ee2323;">${status}</span></c:if>

		 	<cite><img src="/images/icon_form_login_img1.png" />
                <input type="text" id="username" style="width: 198px;" name="mobile" value="${mobile}" check="required,phone" placeholder="请输入账户手机号" />
            </cite>

            <cite><img src="/images/icon_form_login_img2.png" />
                <input type="password" id="password" style="width: 198px;" name="password"  placeholder="请输入登录密码" check="required"/>
            </cite>

            <cite><img src="/images/icon_form_login_img3.png" />
                <input type="text" name="code" style="width: 105px;" placeholder="请输入右边验证码" check="required"/>
                <b class="checkcode"><img src="<%=basePath%>:8085/authImg?type=loginCode&id=1" onclick="this.src=this.src.replace(/\d*$/,(new Date).getTime())"/></b>
            </cite>
			
			<cite class="form_remember" style="text-align: right;font-weight: bold;">
				<a href="/apply.shtml" style="color:#fff;float:left;">免费注册></a>
				<a href="/password_name.shtml" style="color:red;font-weight:normal;margin-right: 40px;">忘记密码?</a>
				
			</cite>

			<cite><input type="submit" value="登 &nbsp; 录" /></cite>



		</form>	
	</div>
	<div class="index_join">
	
		<strong>&nbsp;&nbsp;&nbsp;&nbsp;已有 &nbsp;<b>(<span>${list2[0].numbers}</span>)</b><br>家商户加入异业联盟</strong>
		<div class="index_join_cnt">
			<ul>
			<c:forEach items="${list}"  var="list" begin="0" end="9">
				<li><a href="http://www.anzimall.com/get_merchants_details.shtml?mid=${list.id}" target="_blank"><img src="${list.logo}" ></a></li>
			</c:forEach>
			</ul>
		</div>
		
	</div>

	<div class="what">
		<h2>加入异业联盟，你将获得</h2>
		<ul>
			<li><img src="/images/login_what_1.png"><strong>安子集团</strong><span>强大的上市集团公司，强大的整合力，调动国内外资源&nbsp;!</span></li>
			<li><img src="/images/login_what_2.png"><strong>安子便民支付</strong><span>安子便民支付集团公司2004年组建，发展合作伙伴上万家&nbsp;!</span></li>
			<li><img src="/images/login_what_3.png"><strong>安淘惠平台</strong><span>实现POS机刷卡返积分让利消费者的平台，联合线上线下打造良性生活消费环境&nbsp;!</span></li>
			
			<li><img src="/images/login_what_5.png"><strong>您的客户卡消费提成</strong><span>只要导入您的会员，该会员终身消费提成就是你的&nbsp;！</span></li>
			<li><img src="/images/login_what_6.png"><strong>商品互荐抱团经营</strong><span>会员使用积分消费，消费欲望强大，异业商品互荐（抱团经营）流量无穷&nbsp;！</span></li>
			<li><img src="/images/login_what_7.png"><strong>抵扣POS费率</strong><span>您的用户只要消费，您就可以获得利润分成远远大于POS机费率&nbsp;！</span></li>
			<li><img src="/images/login_what_8.png"><strong>行业大融合</strong><span>KTV、加油站、市场超市，房租水电煤，楼下麻辣烫，都为您推荐您的产品&nbsp;！</span></li>
			<li><img src="/images/login_what_9.png"><strong>t+n到账</strong><span>权威金融合作伙伴保障资金安全，T+0快速回款，稳定及时，高效率的使用资金&nbsp;!</span></li>
			<li><img src="/images/login_what_10.png"><strong>申请加盟，仅需一步</strong><span>只要您拥有一部安子pos机，就可以拥有安淘惠的使用权利，海量客户即可归您所有&nbsp;!</span></li>
		</ul>
	</div>

	
	<div class="tc"><img src="/images/index_pic1.jpg" width="990"></div>
	<div class="tc"><img src="/images/index_pic2.jpg" width="990"></div>

	<div class="index_service">
		<h2>12小时/7天/365日竭诚服务，让您无后顾之忧</h2>
		<ul>
			<li><h3>客服服务</h3><p>电话：4008-119-789 <br>传真：0755-3301 6826</p></li>
			<li><h3>客服QQ</h3><p>265-914-7448<br><a href="tencent://Message/?Uin=2659147448&amp;websiteName=sc.chinaz.com=&amp;Menu=yes">QQ交谈</a></p></li>
			<li><h3>上门服务</h3><p>可申请上门开通<br><a href="/apply.shtml">合作加盟</a></p></li>
			<li><h3>帮助手册</h3><p>自动在线服务<br><a href="article.shtml">立即查看</a></p></li>
		</ul>
	</div>






	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,index" /></jsp:include>
	
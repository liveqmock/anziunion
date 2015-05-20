<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="pioneer" />
</jsp:include>



<div class="main cs">

	<div class="aside">
		<dl>
			<dt><i class="icon icon-shanghu01"></i>电商创业系统</dt>
			<c:if test="${pionner_flag eq 1}"><dd><i class="icon icon-shuju"></i><a href="/pioneerDetail.shtml">创业中心</a></dd></c:if>
			<c:if test="${pionner_flag eq 0}"><dd><i class="icon icon-fabu"></i><a href="/pioneerIndex.shtml">创业说明</a></dd></c:if>
			<c:if test="${pionner_flag eq 1}"><dd><i class="icon icon-icon"></i><a href="/pioneer_withdraw_deposit_detail.shtml">提现操作</a></dd></c:if>
			<dd class="active"><i class="icon icon-tubiaozitihua01"></i><a href="/getNotice.shtml">公告</a></dd>
		</dl>
	</div>

	<div class="announce_list">
		<ul>
			<c:forEach items="${pageSupport.result}" var="list" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			<li>
				<a href="/toGetNoticeAnnouncement.shtml?nid=${list.id }"><img src="${list.thumbnai }" alt=""></a>
				<h3><a href="/toGetNoticeAnnouncement.shtml?nid=${list.id }" title="${list.title }">${list.title }</a></h3>
				<h6><a href="/toGetNoticeAnnouncement.shtml?nid=${list.id }"><fmt:formatDate value="${list.date }" pattern="yyyy-MM-dd"/></a></h6>
				<p><a href="/toGetNoticeAnnouncement.shtml?nid=${list.id }">${list.summary}...</a></p>
			</li>
			</c:forEach>
			<!--  <li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="银行转战移动支付市场 抢食8000亿元蛋糕">银行转战移动支付市场 抢食8000亿元蛋糕</a></h3>
				<h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">支付宝近日与银泰集团达成战略合作。消费者在银泰可以无现金消费，拿出支付宝钱...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="移动支付战场蔓延至线下，一场用户和业务的争夺！">移动支付战场蔓延至线下，一场用户...</a></h3>
				<h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">距离电商购物节“双十二”正式上演只有1天的时间了，因为刚刚为“双十一”做了剁手...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="支付宝发布2014年度对账单：90后晋升理财主力 全国移动支付比例超50%">支付宝发布2014年度对账单...</a></h3><h3>
				</h3><h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">12月8号，支付宝发布十年对账单，同时也公布了各省市2014年（截至2014年10月31日...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="支付宝发布2014年度对账单：90后晋升理财主力 全国移动支付比例超50%">支付宝发布2014年度对账单...</a></h3><h3>
				</h3><h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">12月8号，支付宝发布十年对账单，同时也公布了各省市2014年（截至2014年10月31日...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="支付宝发布2014年度对账单：90后晋升理财主力 全国移动支付比例超50%">支付宝发布2014年度对账单...</a></h3><h3>
				</h3><h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">12月8号，支付宝发布十年对账单，同时也公布了各省市2014年（截至2014年10月31日...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="支付宝发布2014年度对账单：90后晋升理财主力 全国移动支付比例超50%">支付宝发布2014年度对账单...</a></h3><h3>
				</h3><h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">12月8号，支付宝发布十年对账单，同时也公布了各省市2014年（截至2014年10月31日...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="支付宝发布2014年度对账单：90后晋升理财主力 全国移动支付比例超50%">支付宝发布2014年度对账单...</a></h3><h3>
				</h3><h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">12月8号，支付宝发布十年对账单，同时也公布了各省市2014年（截至2014年10月31日...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="支付宝发布2014年度对账单：90后晋升理财主力 全国移动支付比例超50%">支付宝发布2014年度对账单...</a></h3><h3>
				</h3><h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">12月8号，支付宝发布十年对账单，同时也公布了各省市2014年（截至2014年10月31日...</a></p>
			</li>
			<li>
				<a href="/cglib/announce/article.jsp"><img src="http://www.anzipay.com/website/images/news_hot.jpg" alt=""></a>
				<h3><a href="/cglib/announce/article.jsp" title="支付宝发布2014年度对账单：90后晋升理财主力 全国移动支付比例超50%">支付宝发布2014年度对账单...</a></h3><h3>
				</h3><h6><a href="/cglib/announce/article.jsp">2015-01-30</a></h6>
				<p><a href="/cglib/announce/article.jsp">12月8号，支付宝发布十年对账单，同时也公布了各省市2014年（截至2014年10月31日...</a></p>
			</li>-->
		</ul>
	</div>

	<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false"></div>

	
	<br>

</div>




<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,laydate/laydate,fukrm,echarts-all,backstage" /></jsp:include>

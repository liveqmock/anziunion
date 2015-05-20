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
	<div class="announce_article">
		<h2>资讯详情</h2>
		<img src="${list.detailsimg }" alt="" style="width: 100%;">
		<h1>${list.title }</h1>
		<h6>发布时间：<fmt:formatDate value="${list.date }" pattern="yyyy-MM-dd HH:mm"/> 浏览次数：${list.count }</h6>

		<p>${list.content }</p>
		<!--  <p>天猫[微博]11.11购物狂欢节一天就完成了350亿的销售额，支付宝[微博]一天完成的交易笔数超过1.88亿笔，网购网付的爆炸性增长已备受关注。11月20日，在中国清算协会主办的“网络支付安全论坛”上，国务院发展研究中心金融研究所副所长巴曙松[微博]在其《中国网络支付安全白皮书》研究报告中指出，网络支付与银行卡交易规模相比，还有很大的发展空间，市场预计3-5年内网络支付交易规模至少还有增长6倍，达到20万亿元以上。</p>

		<p>“其中，移动支付呈现爆发式的增长，市场预计2013年全年移动支付市场规模会超过8000亿，是去年规模5倍以上。”巴曙松说，随着3G移动网络的发展普及，基于移动网络的电子商务活动不断发展，与之配套移动支付将进入快速发展阶段。</p>

		<p>事实上，移动支付市场的爆发态势已在一些第三方支付机构业务发展比重中反映出来。据统计机构Gartner的数据预计，2013年全球移动支付用户数将达到2.45亿，同比增长22%，交易量将达到2354亿美元，同比增长44%。而支付宝手机支付用户超过1亿，其移动平台支付钱包的用户数也接近1亿规模，预计年支付量将达到1000亿美元（约6000亿元人民币）左右，也就是说支付宝今年的手机支付量预计将占到全球市场的40%以上。</p>

		<p>巴曙松表示，决定未来中国支付实力的核心是安全与效率，两者要平衡发展。过去数年国内支付企业在安全领域的投入相应较多，因此风险控制技术比较领先。据悉，目前在国内网络支付市场风险水平约为0.01%，包括支付宝在内主流支付机构风险水平更是明显低于该水平，而这一风险水平在国际网络支付市场普遍为1-2%。</p>

		<p>针对即将来临的移动支付时代，巴曙松指出，移动支付的快速崛起将给中国支付产业带来新一轮的机遇和挑战。</p>

		<p>巴曙松建议，通过技术创新，而非传统金融增加交易成本牺牲效率的方式解决支付安全问题。事实上，在电子商务等新经济产业模型中，用户交易成本和风险损失并不是单纯的负相关关系，通过安全技术创新是可以实现效率与安全双重提升。</p>
		-->

	
	</div>

	
	<br>

</div>




<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,laydate/laydate,fukrm,echarts-all,backstage" /></jsp:include>

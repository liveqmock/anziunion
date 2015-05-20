<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>

	
	<div class="register_banner">
		<ul>
			<li><a><img src="/images/register_banner.jpg" alt=""></a></li>
		</ul>
	</div>


	<div class="center reginster">



		<h2 class="register_title">
			<strong>帐户注册</strong>
			<span>已注册，马上<a href="index.shtml">登录</a></span>
		</h2>

		<div class="steps"><img src="/images/steps_register3.png" alt=""></div>

		<br><br>
		<form action="merchantsbank.shtml" class="fukrm fukrm-ajax" method="post">
			<input type="hidden" name="type" value="1">
			<input type="hidden" name="cy_type" >


			<cite>
				<span><em>*</em>银行卡号：</span>
				<input type="text" name="card" check="required,bank" placeholder="请输入您的银行卡号" class="fukrm_save">
			</cite>

			<cite>
				<span><em>*</em>开户行：</span>
				<select name="bankno" style="width: 312px;" class="bankno">
					<option value="102100099996">中国工商银行</option>
					<option value="103100000026">中国农业银行</option>
					<option value="104100000004">中国银行</option>
					<option value="105100000017">中国建设银行</option>
					<option value="303100000006">中国光大银行</option>
					<option value="305100000013">中国民生银行</option>
					<option value="403100000004">中国邮政储蓄银行</option>
					<option value="301290000007">交通银行</option>
					<option value="302100011000">中信银行</option>
					<option value="304100040000">华夏银行</option>
					<option value="307584007998">平安银行</option>
					<option value="308584000013">招商银行</option>
					<option value="309391000011">兴业银行</option>
					<option value="310290000013">上海浦东发展银行</option>
					<option value="313100000013">北京银行</option>
					<option value="313110000017">天津银行</option>
					<option value="313121006888">河北银行</option>
					<option value="313131000016">邢台银行</option>
					<option value="313141052422">承德银行</option>
					<option value="313143005157">沧州银行</option>
					<option value="313161000017">晋商银行</option>
					<option value="313191000011">内蒙古银行</option>
					<option value="313192000013">包商银行</option>
					<option value="313205057830">鄂尔多斯银行</option>
					<option value="313222080002">大连银行</option>
					<option value="313227000012">锦州银行</option>
					<option value="313227600018">葫芦岛银行</option>
					<option value="313228000276">营口银行</option>
					<option value="313229000008">阜新银行</option>
					<option value="313241066661">吉林银行</option>
					<option value="313261000018">哈尔滨银行</option>
					<option value="313261099913">龙江银行</option>
					<option value="313290000017">上海银行</option>
					<option value="313301008887">南京银行</option>
					<option value="313301099999">江苏银行</option>
					<option value="313305066661">苏州银行</option>
					<option value="313331000014">杭州银行</option>
					<option value="313332082914">宁波银行</option>
					<option value="313333007331">温州银行</option>
					<option value="313336071575">湖州银行</option>
					<option value="313337009004">绍兴银行</option>
					<option value="313345001665">台州银行</option>
					<option value="313391080007">福建海峡银行</option>
					<option value="313393080005">厦门银行</option>
					<option value="313421087506">南昌银行</option>
					<option value="313428076517">赣州银行</option>
					<option value="313433076801">上饶银行</option>
					<option value="313452060150">青岛银行</option>
					<option value="313453001017">齐商银行</option>
					<option value="313456000108">烟台银行</option>
					<option value="313458000013">潍坊银行</option>
					<option value="313461000012">济宁银行</option>
					<option value="313463400019">莱商银行</option>
					<option value="313468000015">德州银行</option>
					<option value="313473070018">临商银行</option>
					<option value="313473200011">日照银行</option>
					<option value="313491000232">郑州银行</option>
					<option value="313493080539">洛阳银行</option>
					<option value="313521000011">汉口银行</option>
					<option value="313551088886">长沙银行</option>
					<option value="313581003284">广州银行</option>
					<option value="313602088017">东莞银行</option>
					<option value="313611001018">广西北部湾银行</option>
					<option value="313614000012">柳州银行</option>
					<option value="313653000013">重庆银行</option>
					<option value="313658000014">德阳银行</option>
					<option value="313731010015">富滇银行</option>
					<option value="313821001016">兰州银行</option>
					<option value="313851000018">青海银行</option>
					<option value="313871000007">宁夏银行</option>
					<option value="313882000012">昆仑银行</option>
					<option value="315456000105">恒丰银行</option>
					<option value="316331000018">浙商银行</option>
					<option value="318110000014">渤海银行</option>
					<option value="319361000013">徽商银行</option>
					<option value="595100000007">新韩银行</option>
					<option value="596110000013">企业银行</option>
					<option value="597100000014">韩亚银行</option>
					<option value="402332010004">宁波鄞州农村合作银行</option>
					<option value="402391000068">福建省农村信用社</option>
					<option value="402521000032">湖北省农村信用社</option>
					<option value="402641000014">海南省农村信用社</option>
					<option value="313338707013">张家口市商业银行</option>
					<option value="313345010019">浙江泰隆商业银行</option>
					<option value="313345400010">浙江民泰商业银行</option>
					<option value="313463000993">泰安市商业银行</option>
					<option value="313465000010">威海市商业银行</option>
					<option value="313492070005">开封市商业银行</option>
					<option value="313513080408">南阳市商业银行</option>
					<option value="313656000019">攀枝花市商业银行</option>
					<option value="313659000016">绵阳市商业银行</option>
					<option value="313881000002">乌鲁木齐市商业银行</option>
					<option value="314305400015">吴江农村商业银行</option>
					<option value="314305506621">江苏常熟农村商业银行</option>
					<option value="314581000011">广州农村商业银行</option>
					<option value="314653000011">重庆农村商业银行</option>
					<option value="402100000018">北京农村商业银行</option>
					<option value="402584009991">深圳农村商业银行</option>
					<option value="402602000018">东莞农村商业银行</option>
					<option value="402871099996">宁夏黄河农村商业银行</option>
				</select>
			</cite>
			<input type="hidden" name="bank" class="bank" value=""/>


<%--
			<cite>
				<span><em>*</em>开户行地区：</span>
				<div class="js-bankcity" >
					<select class="prov" name="province" style="width: 90px;"></select>
					<select class="city" name="city" style="width:120px;"></select>
					<input type="text" style="width: 120px;" placeholder="请输入关键字">
				</div>
				
			</cite>

			<cite class="js-banknum">
				<span><em>*</em>开户行地址：</span>
				<div class="banknum_cnt">
					<table>
						<thead><tr><th>选择</th><th>开户行名称</th></tr></thead>
						<tbody></tbody>
					</table>
				</div>
				<input type="hidden" class="banknum_addr" name="address" >
				<input type="hidden" class="banknum_num" name="bankno" >
			</cite>

--%>		
			
			<cite>
				<span><em>*</em>持卡人姓名：</span>
				<input type="text" name="realname">
			</cite>
			
			<cite>
				<span><em>*</em>持卡人证件号：</span>
				<input type="text" name="identity">
			</cite>
			
			
			<cite>
				<span><em>*</em>提现密码</span>
				<input type="password" name="password" placeholder="请输入异业联盟提现密码" check="required,password"  class="checkstrong fukrm_save">
				<p style="width:400px;padding-top:5px;">
					密码强度: <span class="checkstrong_res">
					<b>弱</b><b>中</b><b>强</b></span><br>
					<img src="/images/icon_warm.png" style="vertical-align: -2px;">为保证您帐号的安全，建议密码由6-16位字符（字母、数字、符号）<br>组合而成，不能只使用一种字符，不区分大小写！
				</p>
			</cite>

			
			<cite>
				<span><em>*</em>确认提现密码：</span>
				<input type="password" name=""  placeholder="请重新输入账户密码" check="required,repassword"  class="fukrm_save">
				<p>再次输入您的账户密码以确认您记住了您的密码</p>
			</cite>
			
			
			

			<cite><input type="submit" value="提交"></cite>
			<br><br>

		</form>

		<div class="reginster_note">
			<h2>常见FAQ</h2>
			<dl>
				<dt class="active"><a >1、加入异业联盟能给您带来什么？</a></dt>
				<dd>周边行业免费为您所用，广告宣传直接入店为您节省大量营销成本！所有消费都将会成为您的免费推销员，朋友之间口口相传的口碑，胜过您千言万语！</dd>
				<dt><a href="/article.shtml" target="_blank">2、注册有哪些步骤？</a></dt>
				<dt><a href="/article.shtml" target="_blank">3、申请加盟？</a></dt>
			</dl>
		</div>



	</div>


	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,register" /></jsp:include>
	<script>
	var bank = $('.bank')
	$('form').on('change','select.bankno',function(){
		bank.val(this.options[this.selectedIndex].text);
	});
	</script>

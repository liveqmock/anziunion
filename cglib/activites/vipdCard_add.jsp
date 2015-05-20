<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="activites" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />


	<style>
		.fukrm cite{margin-left: 120px;}
	</style>

	<div class="main cs">
		
		
	
		<div class="aside">
			<dl>
				<dt><i class="icon icon-icon12"></i>优惠管理</dt>
				<dd><i class="icon icon-chanpinleimu"></i><a href="vipCardList.shtml">会员卡列表</a></dd>
				<dd class="active"><i class="icon icon-fabu"></i><a href="vipCard.shtml">发布会员卡</a></dd>
				<dd><i class="icon icon-dongtai"></i><a href="vipCardOrder.shtml">会员卡订单数据</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="getUserVipList.shtml">推广返利</a></dd>
				<dd><i class="icon icon-huiyuan"></i><a href="gethiveaction.shtml">蜂巢系统</a></dd>
			</dl>
		</div>


	

		<h2 class="tle"><i class="icon icon-fabu"></i>发布会员卡<small>发布会员卡，让客户在您的店里长期消费！</small></h2>
		<form action="saveVipCard.shtml" class="fukrm fukrm-ajax">
			<cite>
				<span><em>*</em>会员卡名称：</span>
				<input type="text" name="name" check="required" placeholder="会员卡名称"  />
				
			</cite>
		
			<cite>
				<span><em>*</em>会员卡描述：</span>
				<textarea name="note" cols="66" rows="3" check="textlength" placeholder="请输入会员卡描述"></textarea>
				<p style="width:485px;line-height:24px;text-align:right;margin-top:-5px;">字数不超过50字</p>
			</cite>
			
			<cite>
				<span><em>*</em>会员卡元素：</span>
				<label><input type="checkbox" name="element1" checked="checked" value="0">左上角logo</label>
				<label><input type="checkbox" name="element2" checked="checked" value="0">会员卡名称</label>
				<label><input type="checkbox" name="element3" checked="checked" value="0">优惠折扣</label>
				<label><input type="checkbox" name="element4" checked="checked" value="0">序列号(自增)</label>
			</cite>

			

			<cite class="table vipcard_grade">
				<span><em>*</em>会员卡规则：</span> 
				<table border="0" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th>会员等级</th>
							<th>消费额(元)</th>
							<th>折扣率</th>
							<th>操作</th>
							<th><b>会员卡等级规则:</b></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" name="rulename1" value="体验卡" maxlength="6"></td>
							<td><input type="text" name="discount1" value="0" readonly="readonly"></td>
							<td><input type="text" name="upgrade1" value="${originaldiscount}" readonly="readonly"></td>
							<td><font color="#bbb">默认</font></td>
							<td rowspan="5" style="text-align: left;">
								<p>合同最低折扣率为 <font color="#ee2323;">${originaldiscount}</font>，请设置折扣率为${originaldiscount}以下</p>
								<div class="vipcard_rule">
									<p>体验卡：0≤累计消费＜1000元，享<b>全单 0.8</b></p>
									<p>普通卡：1000≤累计消费＜2000元，享<b>全单 0.7</b></p>
									<p>贵宾卡：2000≤累计消费＜10000元，享<b>全单 0.6</b></p>
									<p>白银卡：10000≤累计消费＜20000元，享<b>全单 0.5</b></p>
									<p>铂金卡：20000≤累计消费，享<b>全单 0.4</b></p>
								</div>
								<p>可以修改左边规则，使得会员卡更符合您的店铺。</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="rulename2" value="普通卡" maxlength="6"></td>
							<td><input type="text" name="discount2" value="1000" maxlength="9" crdchk="num"></td>
							<td><input type="text" name="upgrade2" value="0.7" maxlength="9" crdchk="num"></td>
							<td><i class="vipcard_disable">禁用</i></td>
						</tr>
						<tr>
							<td><input type="text" name="rulename3" value="贵宾卡" maxlength="6"></td>
							<td><input type="text" name="discount3" value="2000" maxlength="9" crdchk="num"></td>
							<td><input type="text" name="upgrade3" value="0.6" maxlength="9" crdchk="num"></td>
							<td><i class="vipcard_disable">禁用</i></td>
						</tr>
						<tr>
							<td><input type="text" name="rulename4" value="白银卡" maxlength="6"></td>
							<td><input type="text" name="discount4" value="10000" maxlength="9" crdchk="num"></td>
							<td><input type="text" name="upgrade4" value="0.5" maxlength="9" crdchk="num"></td>
							<td><i class="vipcard_disable">禁用</i></td>
						</tr>
						<tr>
							<td><input type="text" name="rulename5" value="铂金卡" maxlength="6"></td>
							<td><input type="text" name="discount5" value="20000" maxlength="9" crdchk="num"></td>
							<td><input type="text" name="upgrade5" value="0.4" maxlength="9" crdchk="num"></td>
							<td><i class="vipcard_disable">禁用</i></td>
						</tr>
					</tbody>
				</table>
			</cite>

			<cite class="vipcard_tmp">
				<span><em>*</em>选择模板：</span>
				<c:forEach  items="${list}"  var="list" varStatus="idx">
					<label>
						<img src="${basePath}${list.templatepath}" width="224px">
						<input type="radio" name="vipphoto" value="${list.templatepath}" <c:if test="${idx.count eq 1}">checked="checked"</c:if> >
					</label>
				</c:forEach>
			</cite>

			<cite class="vipcard_tmp_custom">
				<span>上传自定义模板：</span>
				<label><input type="text" name="vipphoto" class="js-cutpic"  cutsize="224,142"/></label>
				
			</cite>
			
			

			<br>
			<cite><input type="submit" value="提交审核"></cite>
			<br><br>
		</form>

	</div>


	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>

	<script>

	var grade = $('.vipcard_grade');
		var resut = $('.vipcard_rule');
		var changeres = function(){

			var val = [];
			grade.find('tbody').find('tr').not('[disabled]').each(function(){
				var input = $(this).find('input');
				val.push({name:input.eq(0).val(),spend:input.eq(1).val(),rabate:input.eq(2).val()});
			});

			resut.html(function(){
				var res = [],tospend;
				for(var i=0,l=val.length;i<l;i++){
					tospend = val[i+1] ? '<'+val[i+1].spend+'元' : '';
					res.push('<p>'+val[i].name+'：'+val[i].spend+'≤累计消费'+tospend+'，享<b>全单 '+val[i].rabate+'</b></p>');
				}
				return res.join('\n');
			});


		}

		grade.on('keyup','input',function(){

			// 离开判断输入是否符合要求
			if(this.getAttribute('crdchk') == 'num'){
				this.value = (this.value.match(/[\d\.]+/gi) || []).join('') ;
			}

			// 判断是否更新
			if(this.oldvalue == this.value){return false;}
			this.oldvalue = this.value;

			// 更新结果
			changeres();


		}).on('focus','input',function(){

			this.style.border = '1px solid #949696';

		// 离开判断输入是否符合要求
		}).on('blur','input',function(){
			var $this = $(this);

			if(this.getAttribute('crdchk') == 'num'){
				var idx = $this.closest('tr').find('input').index($this);
				var val = $this.closest('tr').prevAll().not('[disabled]').first().find('input').eq(idx).val();

				// 折扣率
				if(idx == 2 && parseFloat(this.value) > parseFloat(val)){
					this.value = val;
					this.style.border = '1px solid #ee2323';
				}
				// 消费额
				if(idx == 1 && parseFloat(this.value) < parseFloat(val)){
					this.value = val;
					this.style.border = '1px solid #ee2323';
				}

			}

		}).on('click','i.vipcard_disable',function(){

			var tr = $(this).closest('tr');

			if(tr.attr('disabled')){
				tr.removeAttr('disabled');
				tr.find('input').removeAttr('disabled');
				this.style.color = '#ee2323';
				this.innerHTML = '禁用';

			}else{
				tr.attr('disabled','true');
				tr.find('input').attr('disabled','disabled');
				this.style.color = '#22ac38';
				this.innerHTML = '启用';
			}

			changeres();
		});

		

		// 上传文件
		var tmp_custom = $('.vipcard_tmp_custom')
		var tmps = $('.vipcard_tmp').find('input').on('click',function(){

			tmp_custom.find('input').val('');
			tmp_custom.find('.fukrm_file_box').css('filter',null).find('img').attr('src','/images/no.gif');
		

		});
		tmp_custom.on('change','input',function(){
			if(this.value){
				tmps.prop('checked',false);
			}else{
				tmps.first().prop('checked',true);
			}
		});




	</script>

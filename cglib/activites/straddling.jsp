<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/header.jsp" >

	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="union" />
</jsp:include>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.ajaxpage{text-align: center;}
	.ajaxpage .total{display: none;}
</style>
	<div class="main cs">
		
		<div class="aside">
			<dl>
				<dt><i class="icon icon-shanghu01"></i>跨界联盟</dt>
				<dd><i class="icon icon-pingtaizhongxin"></i><a href="union.shtml">商品广场</a></dd>
				<dd class="active"><i class="icon icon-76wodeyibanyewu"></i><a href="good_manager.shtml">接单管理</a></dd>
				<dd><i class="icon icon-76wodeyibanyewu"></i><a href="goods_publish.shtml">发布管理</a></dd>
			</dl>
		</div>

		<h2 class="tle">
			<i class="icon icon-76wodeyibanyewu"></i>商品管理
			<small>管理您发布的联盟商品与您接收的推广商品</small>
			<!-- <div class="straddling_add"><a href="#">发布商品</a></div> -->
		</h2>


		<div class="table straddling">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>序号</th>
						<th width="200px">商品名称</th>
						<th>价格</th>
						<th><!--<a href="#"></a?--> 类型<!--<a href="#">类型▼</a>--></th>
						<th width="90px">店铺</th>
						<th>提成比例</th>
						<th>操作</th>
					</tr>
				</thead>
			
				<tbody>
				<c:if test="${empty pageSupport.result}"><tr><td colspan="7"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
				<c:forEach var="order_union_list" items="${pageSupport.result}" varStatus="status" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
					 <tr <c:if test="${status.index%2 != '1'}">style="background-color:#fafafa"</c:if>>
						<td height="90px">${status.index+1}</td>
						<td  height="90px" width="200px">${order_union_list.name}</td>
						<td height="90px">${order_union_list.pice}</td>
						<td height="90px">
							<span class="btn btn_blue">接单</span>
						</td >
						<td height="90px" width="90px">
							${order_union_list.storename}
						</td>
						<td height="90px">
							${order_union_list.profit}%
						</td>
						<td height="90px">
							<a class="btn btn_red js-shelves" href="down.shtml?order_id= ${order_union_list.oid}">取消接单</a>
							<%--<a class="btn btn_greed js-data" href="data.shtml?gid= ${order_union_list.gid}">数据</a> --%>
						</td>
					</tr>
             </c:forEach>
				</tbody>
			</table>
			<div class="ajaxpage" total="${pageSupport.totalRecordCount}" each="${pageSupport.pageSize}" page="${pageSupport.currentPageNo}" ajax="false" ></div>  
		</div>
	</div>
	<div class="dialog_straddling_add dialog">
		<form action="pub_method.shtml" class="dialog_straddling fukrm">

			<cite>
				<span><em>*</em>商品名称：</span>
				<input type="text" name="username" class="dialog_straddling_search"  placeholder="请输入商品关键字">
				<b class="btn_search">搜索</b>
			</cite>

			<div class="straddling_add_cnt">
				<table border="0" cellspacing="0" cellpadding="0">
					<c:if test="${empty pub_list}"><tr><td colspan="6"><div style="text-align: center;"><img src='/images/no_bg4.png'></div></td></tr></c:if>
					<c:forEach var="good" items="${pub_list}" varStatus="status" >
					<tr>
						<td><input type="radio" name="good_id" value="${good.id}"></td>
						<td>${good.name} </td>
						<td>${good.pice}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="line"></div>
			<cite>
				<span>提成比例：</span>
				<input type="text" name="profit" check="numbers"> %
				<p>提成比例说明：每当销售一件商品，将以售价乘以提成比例分成给代销售商家。</p>
			</cite>
			
			<div style="text-align: center;">
				<input type="submit" value="确定发布">
				<b class="cancel">取消</b>
			</div>
		</form>

	</div>
	
	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,backstage" /></jsp:include>

	<script><!--
		$(function(){

			dialog.on('click','.cancel',function(){dialog.dialog('close');});

			dialog.on('submit','.dialog_straddling',function(){

				var form = $(this);
				var check = [];
				form.find('input,textarea,select').filter('[check]').filter(':visible').each(function(){
					var the = $(this);
					if(!the.siblings('i').is('.form-note-success') && !the.formCheck() ){
						check.push(the);
					}
				});
				if(check.length>0){
					check[0].focus();
					return false;
				}
				if(this.submited){
					return false;
				}else{
					this.submited = true;
				}
			});


			dialog.on('keyup','.dialog_straddling_search',function(){

				var val = $(this).closest('cite').find('input').val();

				// 去英文
				var newkey = val.match(/[\u4E00-\u9FA5\uF900-\uFA2D]/gi) || [];

				var oldkey = newkey.join('');


				// 多方向匹配
				var reg = new RegExp('[\\w\\W]*'+newkey.join('[\\w\\W]*')+'[\\w\\W]*');


			
				// 检查是否与上一个相同（如果相同，则返回，如果不同，则保存新的值）
				if(oldkey == this.oldkey){
					return false;
				}else{
					this.oldkey = oldkey;
				}

				var banknum_cnt = $(this).closest('form').find('.straddling_add_cnt');

				
				// 非空判断
				if(this.oldkey == ''){banknum_cnt.find('tr').show(); return false;}

				
				// 模糊匹配每个元素
				banknum_cnt.find('tr').each(function(){
					if(reg.test(this.innerHTML)){
						this.style.display = null;
					}else{
						this.style.display = 'none';
					}
				});
			
			}).on('click','.straddling_add_cnt tr',function(){


				$(this).find('input').prop('checked',true);
				// return false;
			});

		

			// 发布商品
			$('.straddling_add').on('click',function(){
				dialog.html($('.dialog_straddling_add').html()).dialog("option","title", "发布商品").dialog('open');
				return false;
			});

			// 下架商品
			dialog.on('click','.dialog_straddling_shelves',function(){
				$.ajax({
					type: "POST",
					dataType:'text',
					url: this.getAttribute('href'),
					success: function(data) { 
						 dialog.html('<div class="dialog_straddling" style="width:300px;"><h2>下架成功！</h2><br><div style="text-align: center;"><b class="cancel">关闭</b></div></div>').dialog("option","title", "下架商品").dialog('open');

						dialog.on("dialogclose", function(e,ui){location.reload();});
					}
				});
				return false;
			})


			// 商品数据
			$(document.body).on('click','a.js-data',function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: this.getAttribute('href'),
					success: function(data) { 
						if(!data.order_list) return ;
						data = data.order_list[0];
						//alert(data.total_money/data.pice==data.ordernum);
						var html = '<div class="dialog_straddling" style="width:300px;"><h2>商品数据</h2>接单时间：'+data.pubdate;
						if(data.pub_user==data.uid){
					
						       html=html+'<br>销售商家：'+data.user_num+'&nbsp&nbsp&nbsp&nbsp&nbsp已售件数：'+data.total_money/data.pice+'<br>营业额：'+data.pice*data.ordernum+'<br>提成比列：'+data.profit+'%<br>提成分润：'+data.pice*data.ordernum*data.profit/100+'<br><br><div style="text-align: center;"><b class="cancel">关闭</b></div></div>';
						dialog.html(html).dialog('open');
						}
						else{
						html=html+'<br>已售件数：'+data.ordernum+'<br>营业额：'+data.pice*data.ordernum+'<br>提成比列：'+data.profit+'%<br>提成利润：'+data.pice*data.ordernum*data.profit/100+'<br><br><div style="text-align: center;"><b class="cancel">关闭</b></div></div>';
						dialog.html(html).dialog('open');
						}

					}
				});
				return false;

			// 确认下架
			}).on('click','.js-shelves',function(){

				var html = '<div class="dialog_straddling" style="width:300px;"><h2>是否下架？</h2><br><div style="text-align: center;"><a class="dialog_straddling_shelves btn_submit" href="'+this.getAttribute('href')+'">确定下架</a><b class="cancel">关闭</b></div></div>';
					dialog.html(html).dialog("option","title", "下架商品").dialog('open');

				return false;
			});

			







		})

	--></script>
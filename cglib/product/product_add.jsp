<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<jsp:include page="/cglib/header.jsp" >
	<jsp:param name="css" value="global,backstage" />
	<jsp:param name="header_active" value="product" />
</jsp:include>





<div class="main cs">

	<div class="aside">
		<dl>
			<dt><i class="icon icon-shangpinguanli"></i>商品管理</dt>
			<dd><a href="product_count_request.shtml"><i class="icon icon-xiaoshoutongji"></i>销售统计</a></dd>
			<dd><i class="icon icon-shangpinliebiaopress"></i><a href="product_lis_request.shtml">在线商品</a></dd>
				
			<dd><a href="product_Pendingauditlist_request.shtml"><i class="icon icon-shangpinshenhe"></i>待审核商品</a></dd>
			<dd><a href="product_Notthroughlist_request.shtml"><i class="icon icon-shenhebutongguo"></i>未通过商品</a></dd>
			<dd><a href="product_downlist_request.shtml"><i class="icon icon-xiajiaguanli"></i>已下架商品</a></dd>
			<dd  class="active"><a href="commodity_add.shtml"><i class="icon icon-tianjia"></i>添加商品</a></dd>
		</dl>
	</div>



	

	<h2 class="tle"><i class="icon icon-tianjia"></i>添加商品<small>添加您的商品，让你的客户看到您！</small></h2>


	<form action="commodity_add_request.shtml" class="fukrm fukrm-ajax " method="post"  enctype="multipart/form-data"  style="margin-left: -40px;">
		
		<cite>
			<span><em>*</em>商品名称：</span>
			<input type="text" name="name" check="required,textlength" placeholder="请输入商品名称">
		</cite>
		
		<cite>
			<span><em>*</em>首页展示：</span>
			<select  name="flag">
				<option value="0">是</option>
				<option value="1">否</option>
			</select>
		</cite>

		<cite>
			<span><em>*</em>所属品牌：</span>
			<input type="text" name="brand" check="required,textlength" placeholder="请输入商品品牌">
		</cite>

		<cite>
			<span><em>*</em>单价：</span>
			<input type="text" name="pice" check="required,textlength,numbers" placeholder="请输入商品价格">
		</cite>
		
		<cite>
			<span><em>*</em>最低支付价格：</span>
			<input type="text" name="pay_maney" check="required,textlength,numbers" placeholder="请输入商品价格">
		</cite>
		
		<cite>
			<span><em>*</em>交易方式：</span>
			<select  name="type">
				<option value="0">快递邮寄</option>
				<option value="1">线下兑换</option>
			</select>
		</cite>

		<cite>
			<span><em>*</em>运费：</span>
			<input type="text" name="freight" check="required,textlength,numbers" placeholder="请输入商品运费">
		</cite>
	
		<cite>
			<span><em>*</em>商品分类：</span>
			<input type="text" name="tid_value" check="required" readonly="readonly" value="" style="width:90px;"  placeholder="选择商品分类" class="produ_type">
			<input type="hidden" name="tid" class="produ_type_value">
			<p>为了让你的客户更快更方便的找到您，请精准的选择您的行业</p>
		</cite>


		<cite>
			<span><em>*</em>首页活动商品：</span>
			<select  name="advertising"  class="show_home">
				<option value="0">无</option>
				<option value="1">限时兑换</option>
				<option value="2">热门商品</option>
				<option value="3">特价商品</option>
				<option value="4">活动商品</option>
				<option value="5">猜你喜欢</option>
			</select>
		</cite>


		<cite class="show_home_cnt" style="display:none;">
			<span><em>*</em>首页广告展示图：</span>
			<label><input type="text" name="advertisingimg" class="js-cutpic" check="required" cutsize="500,300" /></label>
			<p>最佳显示宽x高：<font color="#ee2323">500px*300px</font>;如果不是首页活动商品<br>
				您可以不用上传此张图片
			</p>
		</cite>

		
		<cite>
			<span><em>*</em>商品描述：</span>
			<textarea name="account" cols="66" rows="5" check="required,textlength" placeholder="请输入套餐描述"></textarea>
			<p style="width:485px;line-height:24px;text-align:right;margin-top:-5px;">字数不超过70字</p>
		</cite>


		
		
		<cite>
			<span><em>*</em>搜索展示图片：</span>
			<label><input type="text" name="scopeimg" class="js-cutpic" check="required" cutsize="248,200" /></label>
			<p>最佳显示宽x高：<font color="#ee2323">248px*200px</font>;其他像素图片将会造成图片拉伸。<br>
				您的客户在积分商城搜索时，将会展示这张图片，请选择最佳的图片以获得最佳印象
			</p>
		</cite>


	
		<cite class="form-uploadpic" >
			<span><em>*</em>细节图片：</span>
			<label><input type="text" name="picpath" check="required" class="js-cutpic" cutsize="490,330" /></label>
			<label><input type="text" name="picpath2" check="required" class="js-cutpic" cutsize="490,330"/></label>
			<label><input type="text" name="picpath3" check="required" class="js-cutpic" cutsize="490,330"/></label>
			<label><input type="text" name="picpath4" check="required" class="js-cutpic" cutsize="490,330"/></label>
			<p>最佳显示比例宽x高：<font color="#ee2323">490*330</font>像素最低不低于490px*330px;其他像素图片将会造成图片拉伸。<br>
				放置高清商品细节图片，方便用户查看细节，
			</p>
		</cite>


		<div style="position: relative; margin-left: 170px;">
			<span style="position: absolute;width: 150px;text-align: right;top: 0;left: -155px;font-size: 14px;">商品详情：</span>
			<script id="editor2" type="text/plain" style="width:630px;height:500px;"></script>
		</div>
		<br><br>
		<cite><input type="submit" value="提交"> </cite>
		<br><br>
	</form>
</div>





	<!-- 页脚 -->
<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm,ueditor.config,ueditor.all.min,lang/zh-cn/zh-cn,backstage" /></jsp:include>

<script>

	UE.getEditor('editor2');
	$(function(){
		var show_cnt = $('.show_home_cnt');
		$('.show_home').on('change',function(){

			if($(this).val()== 0){
				show_cnt.hide();
			}else{
				show_cnt.show();
			}


		})
	});
</script>

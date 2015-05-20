<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/cglib/validation.jsp"  />
<style>
	.dialog_order{width:650px;}
</style>
<form action="updateorder.shtml" class="dialog_order fukrm fukrm-ajax">
			<input type="hidden" name="id"  value="${list[0].id}">
		<br><br>
		<cite>
			<span><em>*</em>用户账号:</span>
			${list[0].phone}
		</cite>
		
		<cite>
			<span><em>*</em>商品名称:</span>
			${list[0].cname}
		</cite>
		<cite>
			<span><em>*</em>收人人姓名:</span>
			${list[0].name}
		</cite>
		<cite>
			<span><em>*</em>收货地址:</span>
			${list[0].province}${list[0].city}${list[0].county}${list[0].address}
		</cite>
		
	
		<cite>
			<span><em>*</em>快递名称:</span>
			<input type="text"  name="expresname" check="required,textlength"   placeholder="请输入快递名称">
		</cite>
		<cite>
			<span><em>*</em>快递单号:</span>
			<input type="text"  name="expressno"  check="required,textlength"  placeholder="请输入快递单号">
		</cite>
		
		<cite><input type="submit" value="提交"></cite>
</form>
<script>

	dialog.dialog("option","title", "发货");
	$('.dialog_order').fukrm();

	
	// 异步提交文件
	$('.fukrm-ajax').ajaxForm({
		type:'POST',
		dataType:'json',
		beforeSubmit:function(data,form){
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
			loading.show();
		},
		success: function(data) {
			loading.hide();
			if(data.status && data.status === '200'){
				
				
				if(data.message){
					Alert(data.message,function(){
					
						if(data.url){
							window.location.href = data.url;
						}else{
							location.reload();
						}
					});
					return false;
				}
				
				if(data.url){
					
					window.location.href = data.url;
				}else{
					location.reload();
				}
			}else{
				Alert(data.message);
				
			}

		}

	});


</script>

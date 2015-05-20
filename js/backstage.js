$(function() {


	// 事件代理
	$(document).on('click','a',function(){

		var $this = $(this);

		// 下拉内容
		if($this.parent().is('.dropdown')){
			$this.siblings('cite').show();
			$(document.body).one('click',function(){$this.siblings('cite').hide();$this= null;});
			return false;
		}


		// 删除
		if($this.is('.js-dialog-confirm')){
			
			if (window.confirm($this.attr('confirm'))) {
				// $.ajax({
				// 	url: $(this).attr('href'),
				// 	dataType: "json",
				// 	type: "post",
				// 	success: function(data) {
				// 		alert(data.message)
				// 		location.reload();
				// 	}
				// });
			}else{
				return false;
			}
			return false;
		}





		// 异步对话框
		if($this.is('.js-dialog-ajax')){
			$.ajax({
				url: $this.attr('href'),
				dataType: "text",
				type: "post",
				success: function(data) {
					dialog.html(data);
					dialog.dialog('open');

				}
			});
			return false;
		}
	});


	// 编辑器
	if($('#editor').length>0){
		UE.getEditor('editor');
	}

	// 商品类型
	// $('.produ_type').on('click',function(){

	// 	$.ajax({
	// 		type: "POST",
	// 		url: '/typeList.shtml',
	// 		dataType: "json",
	// 		success: function(json){
	// 			if(!json.list) return;


	// 			var trees = (function(tree,pid){

	// 				var res = [];
	// 				var nch = true;
	// 				for (var i in tree) {
	// 					if (tree[i].pid == pid) {
	// 						res.push('<label><input type="radio" name="scope" value="'+tree[i].name+'"/>'+tree[i].name+'</label>')
	// 						res.push(arguments.callee(tree, tree[i].id));
	// 						nch = false;
	// 					}
	// 				}
	// 				return (pid === 0 || nch) ? res.join('') : '<cite><i>+</i>' + res.join('\n') + '</cite>';
	// 			})(json.list,0);


	// 			dialog.html('<form class="stors_type_tree">'+trees+'<input type="submit" value="确定"></form>')
	// 			dialog.dialog("option","title", "选择商户类型").dialog('open');
				

	// 			/* 文档树选择  */
	// 			dialog.find('.stors_type_tree').on('click','i',function(){
	// 				var $this = $(this);

	// 				if($this.html() === '+'){
	// 					$this.html('-').parent('cite').children().not('i').css('display','block');

	// 				}else{
	// 					$this.html('+').parent('cite').children().not('i').css('display','none');
	// 				}
	// 			}).on('submit',function(){

	// 				$('.produ_type').val($(this).find('input[name="scope"]:checked').val());
	// 				dialog.dialog('close')
	// 				return false;
	// 			});

	// 			$this = null;
	// 		}
	// 	});
	// });

/*
	// 自定义参数
	$('cite.product_param b').on('click',function(){

		var $this = $(this);
		if($this.parent().find('input.product_param_key').length>4) return ;

		$(this).before('<label><input type="text" style="width:60px;padding:3px 5px;" class="product_param_key" placeholder="参数名："><em style="display: none;">参数名：</em></label> <label><input type="text" style="width:60px;padding:3px 5px;" class="product_param_val" placeholder="参数值"><em style="display: none;">参数值</em></label><br>');
	})


	// 自定义细节图片
	$('cite.form-uploadpic').on('change','input',function(){

		$(this).parent().find('i').show();

	}).on('click','b',function(){

		var $this = $(this);
		if($this.parent().find('input').length>10) {
			$this.hide();
		}

		if($this.parent().find('input').filter(function(){ return this.value.length >0 ? false:true}).length>0) return false;

		$(this).before('<label><em class="form_upload_mark">不超过200KB,支持jpg，jpeg，gif，<br>bmp，png</em><div style=""><img src="images/no.gif" width="120px"></div><p>上传并预览</p><input type="file" name="file['+$this.parent().find('input').length+']"><i class="close"></i></label> ');

		$this.parent().find('input').last().uploadPreview();

	}).on('click','i',function(){


		$(this).parent().remove();
		return false;
	});

*/


	// 表单提交
	var form = $('.product_ajax').on('submit',function(){
/*			
	
			// 拼接字符串
			var product_prede = $('.product_prede');
			var product_prede_res = [];
			product_prede.find('input[type=text]').each(function(){
				var $this = $(this);
				if(!$this.val()){ return;}
				product_prede_res.push($this.prev('span').text() + $this.val());
			});


			var product_custom = $('.product_custom');
			var product_custom_res = [];
			product_custom.find('input.product_param_key').each(function(){
				var $this = $(this);
				if(!$this.parent().next('label').children('input').val()){return;}
				product_custom_res.push($this.val() + ':'+ $this.parent().next('label').children('input').val());
			});

			product_prede.find('input[type=hidden]').val(product_prede_res.join(';'));
			product_custom.find('input[type=hidden]').val(product_custom_res.join(';'));
	
	
	
*/			
	
			var check = [];

			form.find('input,textarea,select').filter('[check]').filter(':visible').each(function() {
				var the = $(this);
				if (!the.closest('cite').children('i').is('.form-note-success') && !the.formCheck()) {
					check.push(the);
				}
			});

			
			if (check.length > 0) {
				check[0].focus();
				return false;
			}
	

	
	})





});
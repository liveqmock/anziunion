<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/js/imgareaselect-default.css">
<style>

.imgareaselect-border1{background:url(/images/mayi.gif) repeat-y left top;}
.imgareaselect-border2{background:url(/images/mayi.gif) repeat-x left top;}
.imgareaselect-border3{background:url(/images/mayi.gif) repeat-y right top;}
.imgareaselect-border4{background:url(/images/mayi.gif) repeat-x left bottom;}
.imgareaselect-border1,.imgareaselect-border2,.imgareaselect-border3,.imgareaselect-border4{filter:alpha(opacity=50);opacity:.5}
.imgareaselect-handle{background-color:#fff;border:solid 1px #000;filter:alpha(opacity=50);opacity:.5}
.imgareaselect-outer{background-color:#000;filter:alpha(opacity=50);opacity:.5}


.cutpic{position: relative;padding: 10px;overflow: hidden;}
.cutpic_box{display: inline-block;white-space: normal;vertical-align: top; margin-right: 10px;}
.cutpic_view{display: inline-block;white-space: normal;vertical-align: top; background-color:white;}
.cutpic_from{position: relative;border:1px solid #ccc;}
.cutpic_to{position: relative;overflow: hidden;border:2px #ccc solid;}
.cutpic_param{float: left;margin-top: 10px;line-height: 24px;}
.cutpic_param b{margin-left: 5px;}
.cutpic_opt{clear: both;text-align: center;}
.cutpic_opt a{display:inline-block;margin:20px 20px 10px;width: 120px;line-height: 40px;background: #ddd;color: #fff;font-size: 14px;border-radius: 2px;}
.cutpic_form{display: none;}


</style>
<div class="cutpic">
	<form class="cutpic_form" action="/Upload.shtml" >
		<input type="hidden" name="x1"/>
		<input type="hidden" name="y1"/>
		<input type="hidden" name="w1"/>
		<input type="hidden" name="h1"/>
		<input type="hidden" name="x2"/>
		<input type="hidden" name="y2"/>
		<input type="hidden" name="w2"/>
		<input type="hidden" name="h2"/>
	</form>
	<div class="cutpic_box">原始图片：<div class="cutpic_from" ></div></div>
	<div class="cutpic_view">裁剪大小：<div class="cutpic_to"></div></div>
	<!-- <div class="cutpic_param">裁剪大小:<b></b><br>选区大小:<b></b><br>起点(X:Y):<b></b><br>终点(X:Y):<b></b><br></div> -->

	<div class="cutpic_opt">
		<a href="#" class="yes" style="background:#ee2323;">确认</a>
		<a href="#" class="no">取消</a>
	</div>
</div>

<script src="/js/jquery.imgareaselect.pack.js"></script>
<script>

	
	(function(conf){

		var form = $('.cutpic_form');
		var orig = $(conf.img);
		var res = {w1:orig.width(),h1:orig.height(),w2:conf.width,h2:conf.height,x1:0,y1:0,x2:0,y2:0};

		var para = $('.cutpic_param').find('b'); 				//实时裁剪参数
		orig.css({width:res.w1,height:res.h1,position:'relative',visibility:'visible'}).appendTo('.cutpic_from');	// 原图
		var pimg = orig.clone().appendTo('.cutpic_to');			// 裁剪效果图
		pimg.parent().css({width:res.w2,height:res.h2});

		var chan = function (img,c){
			if(parseInt(c.w) <=0){return};
			var rx = res.w2 / c.width;
			var ry = res.h2 / c.height;
			pimg.css({
				width: Math.round(rx * res.w1) + 'px',
				height: Math.round(ry * res.h1) + 'px',
				marginLeft: '-' + Math.round(rx * c.x1) + 'px',
				marginTop: '-' + Math.round(ry * c.y1) + 'px'
			});
			res.x1 = c.x1;
			res.x2 = c.x2;
			res.y1 = c.y1;
			res.y2 = c.y2;

			// para.eq(0).html(res.w2+'px:'+res.h2+'px');
			// para.eq(1).html(c.width+'px:'+c.height+'px');
			// para.eq(2).html(res.x1+'px:'+res.y1+'px');
			// para.eq(3).html(res.x2+'px:'+res.y2+'px');
		}
		
		
		$('.cutpic_opt').on('click','a',function(){
			var the = $(this);
			if(the.is('.yes')){

				form.find('input[name=x1]').val(res.x1);
				form.find('input[name=y1]').val(res.y1);
				form.find('input[name=w1]').val(res.w1);
				form.find('input[name=h1]').val(res.h1);
				form.find('input[name=x2]').val(res.x2);
				form.find('input[name=y2]').val(res.y2);
				form.find('input[name=w2]').val(res.w2);
				form.find('input[name=h2]').val(res.h2);


				// 复制一个input:file并添加到原控件的后面
				var newfile = GLOBAL.cutpic.file.clone().appendTo(GLOBAL.cutpic.file.parent());

				// 将内容复制到表单中
				form.append(GLOBAL.cutpic.file.attr('name','fileImgs'));

				// 提交表单
				form.ajaxSubmit({type:'POST',dataType:'json',success:function(json) {
					if(json && json.status == '200'){
						newfile.parent().find('img').attr('src',json.message).siblings('input[type=text]').val(json.message);
					}
				}});

				// 异步上传文件
			}else if(the.is('.no')){ GLOBAL.cutpic.file.val('');}

			dialog.dialog('close');
			return false;
		});
		

		// 截图动作
		var ias = orig.imgAreaSelect({instance: true ,aspectRatio:conf.width+':'+conf.height,handles: true, onSelectChange:chan});


		// 初始化
		res.x2 = res.w1*res.h2 > res.w2*res.h1 ? res.h1*res.w2/res.h2 : res.w1;
		res.y2 = res.w1*res.h2 > res.w2*res.h1 ? res.h1 : res.h2*res.w1/res.w2;


		dialog.dialog("option","title", "图片裁剪").dialog('open');
		dialog.on("dialogclose",function(){ias.cancelSelection(); GLOBAL.cutpic.file.val('');});
		dialog.on("dialogdragstart",function(){ias.cancelSelection();});


		ias.setOptions({show:true,x1:res.x1,y1:res.y1,x2:res.x2,y2:res.y2});
		ias.update();
		chan(null,ias.getSelection());

		

	})({width:GLOBAL.cutpic.width||250,height:GLOBAL.cutpic.height|| 180,img:GLOBAL.cutpic.img});




</script>



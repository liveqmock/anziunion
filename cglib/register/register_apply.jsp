<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<jsp:include page="/cglib/header.jsp" ><jsp:param name="css" value="global,register" /></jsp:include>

	<style type="text/css">
		body{background: #fff;}
		.register_ban{position: relative; height: 500px;overflow: hidden;}
		.register_ban li{position: absolute;top: 0;left: 50%;width: 1920px;height: 500px; margin-left: -960px; vertical-align: top;text-align: center;}
		.register_pioneer{position: relative;background: #fff;height: 100px;line-height: 100px;text-align: center;}
		/*.register_pioneer:before{content: '';position: absolute; width: 50%;left: 0;top: 0;height: 100%;}*/
		.register_pioneer a{display: inline-block;width: 174px;height: 40px;border:2px solid #e82e2e; line-height: 40px;margin: 0 50px; font-size: 18px;font-weight: bold;color: #e82e2e;font-weight: normal;border-radius: 10px;}
		.register_pioneer i{display: inline-block;width: 24px;height: 24px;vertical-align: -5px;margin-right: 5px;background: url(/images/apply_btn.png) no-repeat;}
		.register_pioneer a.register_pioneer_1 i{background-position: left bottom;}
		.register_pioneer a.register_pioneer_2 i{background-position: right bottom;}
		.register_pioneer a:hover{background: #e82e2e;color: #fff;background-position: right top;}
		.register_pioneer a.register_pioneer_1:hover i{background-position: left top;}
		.register_pioneer a.register_pioneer_2:hover i{background-position: right top;}
	</style>

	
	<div style="text-align: center;background: #e6e6e6;padding:10px 0 15px;"><img src="/images/register_apply_pic2.png" alt=""></div>
	

	
	<div class="register_pioneer">
		<a class="register_pioneer_1" href="/toRegisteredEntrepreneurship.shtml"><i></i>我要创业</a>
		<a class="register_pioneer_2" href="/register_basic.shtml"><i></i>我要开店</a>
	</div>



	<div class="register_ban">
		<ul>
			<li><a><img src="/images/register_banner_2.jpg"></a></li>
			<li><a><img src="/images/register_banner_3.jpg"></a></li>
			<li><a><img src="/images/register_banner_1.jpg"></a></li>
		</ul>
	</div>

	<div style="text-align: center;"><img src="/images/register_apply_pic1.png" alt=""></div>


	
		


	




	<!-- 页脚 -->
	<jsp:include page="/cglib/footer.jsp" ><jsp:param name="js" value="global,fukrm" /></jsp:include>

<script>
	
	$('.head_nav_list').find('li').removeClass('active').eq(1).addClass('active')

// 幻灯片插件
$.fn.extend({
	slides: function(opts) {

		opts = jQuery.extend({name:'slides',speed:300,start:0,auto:true,interval:5000}, opts || {});//默认参数
		
		return this.each(function(){

			var $this = $(this);
			var item = $this.find('li').not(':first-child').hide().end();
			var idx = opts.start;
			var size = item.length;
			var interval = false;
			
			var crl = $('<div/>').addClass(opts.name+'_crl').html('123456789'.substr(0,size).replace(/(\d)/g,"<b>$1</b>")).appendTo($this).children('b').eq(opts.start).addClass('on').end();
			

			var anim = function(form,to){

				item.stop(true,true);

				item.eq(form).fadeOut(opts.speed);
				item.eq(to).fadeIn(opts.speed);

				crl.eq(form).removeClass('on').end().eq(to).addClass('on');

				idx = to;
			}


			//动画	
			var next = function(){	
				anim(idx,++idx >= size ? 0 : idx);
			}

			var prev = function(){
				anim(idx,--idx <=0  ? 0 : idx);
			}


			if(opts.auto){
				interval = setInterval(next,opts.interval);
			}


			$this.on({mouseenter:function(){
				// 暂停
				interval = interval && clearInterval(interval) && false;
			},mouseleave:function(){
				// 启动
				interval = interval || setInterval(next,opts.interval);
			}});



			crl.on('click',function(){

				// 重置
				interval && clearInterval(interval);
				interval =  setInterval(next,opts.interval);
				anim(idx,crl.index($(this)));

				return false;
			})

		});
	}
});

$('.register_ban').slides({name:'slide',interval:5000,speed:1000});

</script>
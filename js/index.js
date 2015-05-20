// 轮播插件

$.fn.marquee=function(a){var b=$.extend({},$.fn.marquee.defaults,a);return this.each(function(){var K=$(this);var r=K.get(0);var A=K.width();var g=K.height();var v=K.children();var G=v.children();var h=0;var F=(b.direction=="left"||b.direction=="right")?1:0;var w,f,y,l;var s,L,J,I,H;var k,M;var z,N;var B=[];var n=0;var u=0;var o=0;v.css(F?"width":"height",10000);var E="<ul>";if(b.isEqual){k=G[F?"outerWidth":"outerHeight"]();M=G.length;h=k*M;for(var D=0;D<M;D++){B.push(D*k);E+="<li>"+(D+1)+"</li>"}}else{G.each(function(c){B.push(h);h+=$(this)[F?"outerWidth":"outerHeight"]();E+="<li>"+(c+1)+"</li>"})}E+="</ul>";if(h<(F?A:g)){return}v.append(G.clone()).css(F?"width":"height",h*2);if(b.navId){z=$(b.navId).append(E).hover(x,m);N=$("li",z);N.each(function(c){$(this).bind(b.eventNav,function(){if(y){return}if(n==c){return}j(B[c]);N.eq(n).removeClass("navOn");n=c;$(this).addClass("navOn")})});N.eq(n).addClass("navOn")}if(b.direction=="right"||b.direction=="down"){r[F?"scrollLeft":"scrollTop"]=h}else{r[F?"scrollLeft":"scrollTop"]=0}if(b.isMarquee){l=setTimeout(C,b.scrollDelay);K.hover(function(){clearInterval(l)},function(){clearInterval(l);l=setTimeout(C,b.scrollDelay)});if(b.controlBtn){$.each(b.controlBtn,function(c,d){$(d).bind(b.eventA,function(){b.direction=c;b.oldAmount=b.scrollAmount;b.scrollAmount=b.newAmount}).bind(b.eventB,function(){b.scrollAmount=b.oldAmount})})}}else{if(b.isAuto){m();K.hover(x,m)}if(b.btnGo){$.each(b.btnGo,function(c,d){$(d).bind(b.eventGo,function(){if(y==true){return}b.direction=c;j();if(b.isAuto){x();m()}})})}}function C(){var d=(b.direction=="left"||b.direction=="right")?"scrollLeft":"scrollTop";if(b.isMarquee){if(b.loop>0){o+=b.scrollAmount;if(o>h*b.loop){r[d]=0;return clearInterval(l)}}var c=r[d]+(b.direction=="left"||b.direction=="up"?1:-1)*b.scrollAmount}else{if(b.duration){if(s++<I){y=true;var c=Math.ceil(q(s,L,J,I));if(s==I){c=H}}else{c=H;clearInterval(w);y=false;return}}else{var c=H;clearInterval(w)}}if(b.direction=="left"||b.direction=="up"){if(c>=h){c-=h}}else{if(c<=0){c+=h}}r[d]=c;if(b.isMarquee){l=setTimeout(C,b.scrollDelay)}else{if(s<I){if(w){clearTimeout(w)}w=setTimeout(C,b.scrollDelay)}else{y=false}}}function j(e){y=true;var i=(b.direction=="left"||b.direction=="right")?"scrollLeft":"scrollTop";var d=b.direction=="left"||b.direction=="up"?1:-1;u=u+d;if(e==undefined&&b.navId){N.eq(n).removeClass("navOn");n+=d;if(n>=M){n=0}else{if(n<0){n=M-1}}N.eq(n).addClass("navOn");u=n}var c=u<0?h:0;s=0;L=r[i];H=(e!=undefined)?e:c+(b.distance*u)%h;if(d==1){if(H>L){J=H-L}else{J=H+h-L}}else{if(H>L){J=H-h-L}else{J=H-L}}I=b.duration;if(w){clearTimeout(w)}w=setTimeout(C,b.scrollDelay)}function m(){f=setInterval(function(){j()},b.time*1000)}function x(){clearInterval(f)}function q(i,e,P,O){return -P*(i/=O)*(i-2)+e}function p(i,e,P,O){return P*((i=i/O-1)*i*i*i*i+1)+e}})};
$.fn.marquee.setDefaults=function(a){$.extend($.fn.marquee.defaults,a)};
$.fn.marquee.defaults = {
	isMarquee: false, //是否为Marquee
	isEqual: true, //所有滚动的元素长宽是否相等,true,false
	loop: 0, //循环滚动次数，0时无限
	newAmount: 3, //加速滚动的步长
	eventA: 'mousedown', //鼠标事件，加速
	eventB: 'mouseup', //鼠标事件，原速
	isAuto: true, //是否自动轮换
	time: 5, //停顿时间，单位为秒
	duration: 50, //缓动效果，单次移动时间，越小速度越快，为0时无缓动效果
	eventGo: 'click', //鼠标事件，向前向后走
	direction: 'left', //滚动方向，'left','right','up','down'
	scrollAmount: 1, //步长
	scrollDelay: 10, //时长
	eventNav: 'click' //导航事件
};


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



jQuery.extend( jQuery.easing, {  
    easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	}
});  


$(function(){


	$('.banner').slides({name:'slide',interval:5000,speed:1000});


	// checkcode
<<<<<<< .mine
	$('.checkcode').on('click',function(){
		$(this).children('img').attr('src','http://union.anzimall.com:8085/authImg?type=loginCode&id='+ (new Date).getTime() );
	});
=======
//	$('.checkcode').on('click',function(){
//		$(this).children('img').attr('src','/authImg?type=loginCode&id='+ (new Date).getTime() );
//	});
>>>>>>> .r1129



	$('.js-form-login').submit(function(){
		var check = [];
		$(this).find('input,textarea,select').filter('[check]').filter(':visible').each(function(){
			var the = $(this);
			if(!the.closest('cite').children('i').is('.form-note-success') && !the.formCheck() ){
				check.push(the);
			}
		});
		if(check.length>0){
			check[0].focus();
			return false;
		}
	});




	// 最新加盟
	var stors = $('.index_join').find('strong span');
	var stors_list = $('.index_join_cnt').find('ul');
	var num = parseInt(stors.text()) || 0;
	var stors_anin = function(num,li){

		stors_list.css('right',-150);
		stors_list.animate({right:0},1000,'easeOutElastic');
		stors_list.prepend('<li>'+li+'</li>');
		stors_list.find('li').last().remove();
		// stors.html(num); //更新数字
	}

	var demo_li = stors_list.find('li');
	var pointer = demo_li.length;
	

	setInterval(function(){
		pointer--;
		pointer = pointer <0 ? (demo_li.length-1): pointer;
		stors_anin(0,demo_li.eq(pointer).html());
	},4000);


	// 描述
	// var des = $('.description');
	// var li = des.find('li');
	// var top = des.offset().top +50;
	// var show = false;
	// des.on('click','cite a',function(){

	// 	if(show){
	// 		li.animate({'margin-top':-420},1000,function(){
	// 			des.children('cite').eq(0).removeClass('on').end()[1].style.display = 'none';
	// 		});
	// 		show = false;

	// 	}else{

	// 		$('html, body').animate({scrollTop: top},500);
	// 		li.animate({'margin-top':0},1000,function(){
	// 			des.children('cite').eq(0).addClass('on').end()[1].style.display = 'block';
	// 		});
			
	// 		show = true;
	// 	}

	// 	return false;
	// });



	// 底部资源轮播
	$('.friendlink_scroll').marquee({
		time:5,
		distance:1100,
		btnGo:{left:'.friendlink_left',right:'.friendlink_right'},
		direction:'left'
	});



});

	

(function($){

	$.fn.extend({
		page:function (ops) {

			ops = jQuery.extend({
				total:null,
				each:null,
				page:null,
				ajaxurl:null,
				buildfun:function(){},
				updateto:$({}),

			}, ops || {});



			// 分页元素
			var resetItems = function($this){

				var count = 10;
				var res = [];
				count = count>$this.pageall ? $this.pageall : count; 
				var pagenum = $this.pagenum;
				var begin = pagenum - Math.ceil(count/2);

				

				begin = begin<1? 1: begin;
				begin = begin>($this.pageall-count) ? ($this.pageall-count) : begin;


				for(var over = begin+count; begin<over;){
					begin++;
					if(begin== pagenum){
						res.push('<a href="'+$this.url+'?&each='+$this.eachnum+'&page='+begin+'" class="current">'+begin+'</a>');
					}else{
						res.push('<a href="'+$this.url+'?&each='+$this.eachnum+'&page='+begin+'" class="items">'+begin+'</a>');
					}
				}

				$this.find('div.item').html(res.join(''))
			}

			var build = function($this) {

				if( $this.totlnum == 0 || $this.totlnum <$this.eachnum) return false;

				var next = $this.pagenum+1>$this.pageall?$this.pageall:$this.pagenum+1;
				var prev = $this.pagenum-1<1?1:$this.pagenum-1;

				$this.append("<div class='total'>共" + $this.pageall + "页&nbsp;" +$this.totlnum + "条记录</div>");
				$this.append('<a href="'+$this.url+'?&each='+$this.eachnum+'&page=1" title="首页" class="first">首页</a>');
				$this.append('<a href="'+$this.url+'?&each='+$this.eachnum+'&page='+prev+'" title="上一页" class="prev">上一页</a>');
				$this.append('<div class="item"></div>');
				$this.append('<a href="'+$this.url+'?&each='+$this.eachnum+'&page='+next+'" title="下一页" class="next">下一页</a>')
				$this.append('<a href="'+$this.url+'?&each='+$this.eachnum+'&page='+$this.pageall+'" title="尾页" class="last">尾页</a>');
				
				resetItems($this);
				return true;
			}

			


			var ajaxPage = function($this){
				$.ajax({
					type: "get",
					dataType:'json',
					url: $this.url,
					data:{page:$this.pagenum},
					success: function(jsons) {
						var res = [];
						for(var i=0,l=jsons.length;i<l;i++){
							res.push($this.buildfun(jsons[i]));
						}
						$this.goal.html(res.join(''))
					},
					error: function() {}
				});
				resetItems($this);
			}

			this.each(function(){

				var $this = $(this);
				
				$this.totlnum = ops.total || parseInt($this.attr('total') || 0 );	//总条数
				$this.eachnum = ops.each  || parseInt($this.attr('each') || 20 );	//每页条数
				$this.pagenum = ops.page  || parseInt($this.attr('page') || 1 );	//默认当前页数 
				$this.url	  = ops.url   || $this.attr('url') || location.origin+location.pathname;				//异步调用地址
				$this.buildfun= ops.buildfun || window[$this.attr('buildfun')] || function(){};	//构建内容函数
				$this.goal 	  = ops.updateto || $($this.attr('updateto'));			//更新到目标
				$this.ajax 	  = !ops.ajax ||  !($this.attr('ajax') === 'false');

				$this.pageall = Math.ceil($this.totlnum/$this.eachnum);	//总页数
			
				
				// 创建元素
				build($this)

				if($this.ajax) return;

				// 绑定事件//////////////////
				// 页数点击
				$this.on('click','a.items',function(){

					$this.pagenum = $(this).html();
					ajaxPage($this);		//异步取数据

					return false;
				// 首页
				}).on('click','a.first',function(){

					if($this.pagenum ===1) return false;
					$this.pagenum =1;
					ajaxPage($this);

					return false;
				// 尾页
				}).on('click','a.last',function(){

					if($this.pagenum === $this.pageall) return false;
					$this.pagenum = $this.pageall;
					ajaxPage($this);

					return false;
				// 上一页
				}).on('click','a.prev',function(){

					if($this.pagenum-1<0) return false;
					$this.pagenum--;
					ajaxPage($this);

					return false;

				// 下一页
				}).on('click','a.next',function(){

					if($this.pagenum+1>$this.pageall) return false;
					$this.pagenum++;
					ajaxPage($this);
					return false;
					
				// 当前页
				}).on('click','a.current',function(){

					return false;
				});;

			
			});
		}
	});
})($);

$(function(){$('.ajaxpage').page();});
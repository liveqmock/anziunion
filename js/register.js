

	// 银行校验
	var banknum = $('.js-banknum');
	var banknum_cnt = banknum.find('.banknum_cnt');
	var banknum_add = banknum.find('.banknum_addr');
	var banknum_num = banknum.find('.banknum_num');

	var getdata = function(key){
		$.ajax({
			type: "POST",
			url: "/to_query_bankno.shtml",
			data:key,
			dataType: "json",
			success: function(json){
				var res = [];
				for(var i=0,l=json.length;i<l;i++){
					 res.push('<tr><td><input type="radio" name="xbankno" value="'+json[i].card+'"/></td><td>'+json[i].name+'</td></tr>');
				}
				banknum_cnt.find('tbody').html(res.join('\n')).find('tr').first().trigger("click");
			}
		});
	}

	// 取省市区
	function bankCity(citys) {

		var selects = $('.js-bankcity').find('select');
		
		selects.eq(1).on('change',function(){
			var bank = $(this).closest('form').find('select[name=bank]');
				bank = bank.find('option').eq(bank.get(0).selectedIndex).attr('data');
			getdata({card:bank+this.value});
		});

		selects.closest('form').find('select[name=bank]').on('change',function(){
			var bank = $(this).closest('form').find('select[name=bank]');
				bank = bank.find('option').eq(bank.get(0).selectedIndex).attr('data');
			getdata({card:bank+selects.eq(1).val()})
		});

		selects.eq(0).on('change',function(){
			var arr = citys[this.value];
			var res = [];
			for(var i=0,l=arr.length;i<l;i++){
				res.push('<option value="'+arr[i].cord+'">'+arr[i].city+'</option>');
			}
			selects.eq(1).html(res.join('')).trigger("change");
		}).html(function(){
			var res = [];
			for(var key in citys){
				res.push('<option value="'+key+'">'+key+'</option>');
			}
			return res.join('');
		}).trigger("change");


		// 筛选
		selects.closest('.js-bankcity').find('input').on('keyup',function(){
			var val = this.value;

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

		
		});
	}



	banknum_cnt.on('click','tr',function(){
		var $this = $(this);

		// 选择选中的条目
		$this.find('input').prop('checked',true);


		// 给结果赋值
		banknum_add.val($this.find('td').eq(1).text());
		banknum_num.val($this.find('input').val());


	}).on('mousewheel',function(e){
		if (e && e.stopPropagation) {
			e.stopPropagation();
		} else {
			window.event.cancelBubble = true;
		}
	});


	var script = document.createElement("script");
	script.type = "text/javascript";
	script.src = "/js/bankcity.json";
	document.body.appendChild(script);



	// 异步检查银行卡
	$('.checkbankcard').on('click',function(){
		var $this = $(this);
		var strongsave = $this.closest('.fukrm_strongsave');
		var check = [];
		strongsave.find('input,textarea,select').filter('[check]').filter(':visible').each(function(){
			var the = $(this);
			if(!the.siblings('i').is('.form-note-success') && !the.formCheck() ){
				check.push(the);
			}
		});

		if(check.length>0){
			check[0].focus();
			return false;
		}

		$.ajax({
			type: "POST",
			url: "checkBankcard.shtml",
			data:strongsave.closest('form').serialize(),
			dataType: "json",
			success: function(json){
				if(json.status == 200){
					$this.addClass('success').next('span').html('<font color="#0f0">通过校验</font>');
				}else{
					$this.removeClass('success').next('span').html(json.message);
				}
			}
		});

		return false;

	});




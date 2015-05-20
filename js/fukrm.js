// jquery.form
/*!
 * jQuery Form Plugin
 * version: 3.50.0-2014.02.05
 * Requires jQuery v1.5 or later
 * Copyright (c) 2013 M. Alsup
 * Examples and documentation at: http://malsup.com/jquery/form/*/
!function(a){"use strict";"function"==typeof define&&define.amd?define(["jquery"],a):a("undefined"!=typeof jQuery?jQuery:window.Zepto)}(function(a){"use strict";function d(b){var c=b.data;b.isDefaultPrevented()||(b.preventDefault(),a(b.target).ajaxSubmit(c))}function e(b){var e,f,g,c=b.target,d=a(c);if(!d.is("[type=submit],[type=image]")){if(e=d.closest("[type=submit]"),0===e.length)return;c=e[0]}f=this,f.clk=c,"image"==c.type&&(void 0!==b.offsetX?(f.clk_x=b.offsetX,f.clk_y=b.offsetY):"function"==typeof a.fn.offset?(g=d.offset(),f.clk_x=b.pageX-g.left,f.clk_y=b.pageY-g.top):(f.clk_x=b.pageX-c.offsetLeft,f.clk_y=b.pageY-c.offsetTop)),setTimeout(function(){f.clk=f.clk_x=f.clk_y=null},100)}function f(){if(a.fn.ajaxSubmit.debug){var b="[jquery.form] "+Array.prototype.join.call(arguments,"");window.console&&window.console.log?window.console.log(b):window.opera&&window.opera.postError&&window.opera.postError(b)}}var c,b={};b.fileapi=void 0!==a("<input type='file'/>").get(0).files,b.formdata=void 0!==window.FormData,c=!!a.fn.prop,a.fn.attr2=function(){if(!c)return this.attr.apply(this,arguments);var a=this.prop.apply(this,arguments);return a&&a.jquery||"string"==typeof a?a:this.attr.apply(this,arguments)},a.fn.ajaxSubmit=function(d){function B(b){var g,h,c=a.param(b,d.traditional).split("&"),e=c.length,f=[];for(g=0;e>g;g++)c[g]=c[g].replace(/\+/g," "),h=c[g].split("="),f.push([decodeURIComponent(h[0]),decodeURIComponent(h[1])]);return f}function C(b){var f,g,h,i,c=new FormData;for(f=0;f<b.length;f++)c.append(b[f].name,b[f].value);if(d.extraData)for(g=B(d.extraData),f=0;f<g.length;f++)g[f]&&c.append(g[f][0],g[f][1]);return d.data=null,h=a.extend(!0,{},a.ajaxSettings,d,{contentType:!1,processData:!1,cache:!1,type:e||"POST"}),d.uploadProgress&&(h.xhr=function(){var b=a.ajaxSettings.xhr();return b.upload&&b.upload.addEventListener("progress",function(a){var b=0,c=a.loaded||a.position,e=a.total;a.lengthComputable&&(b=Math.ceil(100*(c/e))),d.uploadProgress(a,c,e,b)},!1),b}),h.data=null,i=h.beforeSend,h.beforeSend=function(a,b){b.data=d.formData?d.formData:c,i&&i.call(this,a,b)},a.ajax(h)}function D(b){function y(a){var b=null;try{a.contentWindow&&(b=a.contentWindow.document)}catch(c){f("cannot get iframe.contentWindow document: "+c)}if(b)return b;try{b=a.contentDocument?a.contentDocument:a.document}catch(c){f("cannot get iframe.contentDocument: "+c),b=a.document}return b}function B(){function j(){try{var a=y(p).readyState;f("state = "+a),a&&"uninitialized"==a.toLowerCase()&&setTimeout(j,50)}catch(b){f("Server abort: ",b," (",b.name,")"),G(x),u&&clearTimeout(u),u=void 0}}var l,m,r,b=i.attr2("target"),c=i.attr2("action"),d="multipart/form-data",h=i.attr("enctype")||i.attr("encoding")||d;g.setAttribute("target",n),(!e||/post/i.test(e))&&g.setAttribute("method","POST"),c!=k.url&&g.setAttribute("action",k.url),k.skipEncodingOverride||e&&!/post/i.test(e)||i.attr({encoding:"multipart/form-data",enctype:"multipart/form-data"}),k.timeout&&(u=setTimeout(function(){t=!0,G(w)},k.timeout)),l=[];try{if(k.extraData)for(m in k.extraData)k.extraData.hasOwnProperty(m)&&(a.isPlainObject(k.extraData[m])&&k.extraData[m].hasOwnProperty("name")&&k.extraData[m].hasOwnProperty("value")?l.push(a('<input type="hidden" name="'+k.extraData[m].name+'">').val(k.extraData[m].value).appendTo(g)[0]):l.push(a('<input type="hidden" name="'+m+'">').val(k.extraData[m]).appendTo(g)[0]));k.iframeTarget||o.appendTo("body"),p.attachEvent?p.attachEvent("onload",G):p.addEventListener("load",G,!1),setTimeout(j,15);try{g.submit()}catch(q){r=document.createElement("form").submit,r.apply(g)}}finally{g.setAttribute("action",c),g.setAttribute("enctype",h),b?g.setAttribute("target",b):i.removeAttr("target"),a(l).remove()}}function G(b){var d,c,e,g,h,i,j,l,n;if(!q.aborted&&!F){if(D=y(p),D||(f("cannot access response document"),b=x),b===w&&q)return q.abort("timeout"),v.reject(q,"timeout"),void 0;if(b==x&&q)return q.abort("server abort"),v.reject(q,"error","server abort"),void 0;if(D&&D.location.href!=k.iframeSrc||t){p.detachEvent?p.detachEvent("onload",G):p.removeEventListener("load",G,!1),c="success";try{if(t)throw"timeout";if(e="xml"==k.dataType||D.XMLDocument||a.isXMLDoc(D),f("isXml="+e),!e&&window.opera&&(null===D.body||!D.body.innerHTML)&&--E)return f("requeing onLoad callback, DOM not available"),setTimeout(G,250),void 0;g=D.body?D.body:D.documentElement,q.responseText=g?g.innerHTML:null,q.responseXML=D.XMLDocument?D.XMLDocument:D,e&&(k.dataType="xml"),q.getResponseHeader=function(a){var b={"content-type":k.dataType};return b[a.toLowerCase()]},g&&(q.status=Number(g.getAttribute("status"))||q.status,q.statusText=g.getAttribute("statusText")||q.statusText),h=(k.dataType||"").toLowerCase(),i=/(json|script|text)/.test(h),i||k.textarea?(j=D.getElementsByTagName("textarea")[0],j?(q.responseText=j.value,q.status=Number(j.getAttribute("status"))||q.status,q.statusText=j.getAttribute("statusText")||q.statusText):i&&(l=D.getElementsByTagName("pre")[0],n=D.getElementsByTagName("body")[0],l?q.responseText=l.textContent?l.textContent:l.innerText:n&&(q.responseText=n.textContent?n.textContent:n.innerText))):"xml"==h&&!q.responseXML&&q.responseText&&(q.responseXML=H(q.responseText));try{C=J(q,h,k)}catch(r){c="parsererror",q.error=d=r||c}}catch(r){f("error caught: ",r),c="error",q.error=d=r||c}q.aborted&&(f("upload aborted"),c=null),q.status&&(c=q.status>=200&&q.status<300||304===q.status?"success":"error"),"success"===c?(k.success&&k.success.call(k.context,C,"success",q),v.resolve(q.responseText,"success",q),m&&a.event.trigger("ajaxSuccess",[q,k])):c&&(void 0===d&&(d=q.statusText),k.error&&k.error.call(k.context,q,c,d),v.reject(q,"error",d),m&&a.event.trigger("ajaxError",[q,k,d])),m&&a.event.trigger("ajaxComplete",[q,k]),m&&!--a.active&&a.event.trigger("ajaxStop"),k.complete&&k.complete.call(k.context,q,c),F=!0,k.timeout&&clearTimeout(u),setTimeout(function(){k.iframeTarget?o.attr("src",k.iframeSrc):o.remove(),q.responseXML=null},100)}}}var h,j,k,m,n,o,p,q,r,s,t,u,w,x,z,A,C,D,F,E,H,I,J,g=i[0],v=a.Deferred();if(v.abort=function(a){q.abort(a)},b)for(j=0;j<l.length;j++)h=a(l[j]),c?h.prop("disabled",!1):h.removeAttr("disabled");return k=a.extend(!0,{},a.ajaxSettings,d),k.context=k.context||k,n="jqFormIO"+(new Date).getTime(),k.iframeTarget?(o=a(k.iframeTarget),s=o.attr2("name"),s?n=s:o.attr2("name",n)):(o=a('<iframe name="'+n+'" src="'+k.iframeSrc+'" />'),o.css({position:"absolute",top:"-1000px",left:"-1000px"})),p=o[0],q={aborted:0,responseText:null,responseXML:null,status:0,statusText:"n/a",getAllResponseHeaders:function(){},getResponseHeader:function(){},setRequestHeader:function(){},abort:function(b){var c="timeout"===b?"timeout":"aborted";f("aborting upload... "+c),this.aborted=1;try{p.contentWindow.document.execCommand&&p.contentWindow.document.execCommand("Stop")}catch(d){}o.attr("src",k.iframeSrc),q.error=c,k.error&&k.error.call(k.context,q,c,b),m&&a.event.trigger("ajaxError",[q,k,c]),k.complete&&k.complete.call(k.context,q,c)}},m=k.global,m&&0===a.active++&&a.event.trigger("ajaxStart"),m&&a.event.trigger("ajaxSend",[q,k]),k.beforeSend&&k.beforeSend.call(k.context,q,k)===!1?(k.global&&a.active--,v.reject(),v):q.aborted?(v.reject(),v):(r=g.clk,r&&(s=r.name,s&&!r.disabled&&(k.extraData=k.extraData||{},k.extraData[s]=r.value,"image"==r.type&&(k.extraData[s+".x"]=g.clk_x,k.extraData[s+".y"]=g.clk_y))),w=1,x=2,z=a("meta[name=csrf-token]").attr("content"),A=a("meta[name=csrf-param]").attr("content"),A&&z&&(k.extraData=k.extraData||{},k.extraData[A]=z),k.forceSync?B():setTimeout(B,10),E=50,H=a.parseXML||function(a,b){return window.ActiveXObject?(b=new ActiveXObject("Microsoft.XMLDOM"),b.async="false",b.loadXML(a)):b=(new DOMParser).parseFromString(a,"text/xml"),b&&b.documentElement&&"parsererror"!=b.documentElement.nodeName?b:null},I=a.parseJSON||function(a){return window["eval"]("("+a+")")},J=function(b,c,d){var e=b.getResponseHeader("content-type")||"",f="xml"===c||!c&&e.indexOf("xml")>=0,g=f?b.responseXML:b.responseText;return f&&"parsererror"===g.documentElement.nodeName&&a.error&&a.error("parsererror"),d&&d.dataFilter&&(g=d.dataFilter(g,c)),"string"==typeof g&&("json"===c||!c&&e.indexOf("json")>=0?g=I(g):("script"===c||!c&&e.indexOf("javascript")>=0)&&a.globalEval(g)),g},v)}var e,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A;if(!this.length)return f("ajaxSubmit: skipping submit process - no element selected"),this;if(i=this,"function"==typeof d?d={success:d}:void 0===d&&(d={}),e=d.type||this.attr2("method"),g=d.url||this.attr2("action"),h="string"==typeof g?a.trim(g):"",h=h||window.location.href||"",h&&(h=(h.match(/^([^#]+)/)||[])[1]),d=a.extend(!0,{url:h,success:a.ajaxSettings.success,type:e||a.ajaxSettings.type,iframeSrc:/^https/i.test(window.location.href||"")?"javascript:false":"about:blank"},d),j={},this.trigger("form-pre-serialize",[this,d,j]),j.veto)return f("ajaxSubmit: submit vetoed via form-pre-serialize trigger"),this;if(d.beforeSerialize&&d.beforeSerialize(this,d)===!1)return f("ajaxSubmit: submit aborted via beforeSerialize callback"),this;if(k=d.traditional,void 0===k&&(k=a.ajaxSettings.traditional),l=[],n=this.formToArray(d.semantic,l),d.data&&(d.extraData=d.data,m=a.param(d.data,k)),d.beforeSubmit&&d.beforeSubmit(n,this,d)===!1)return f("ajaxSubmit: submit aborted via beforeSubmit callback"),this;if(this.trigger("form-submit-validate",[n,this,d,j]),j.veto)return f("ajaxSubmit: submit vetoed via form-submit-validate trigger"),this;for(o=a.param(n,k),m&&(o=o?o+"&"+m:m),"GET"==d.type.toUpperCase()?(d.url+=(d.url.indexOf("?")>=0?"&":"?")+o,d.data=null):d.data=o,p=[],d.resetForm&&p.push(function(){i.resetForm()}),d.clearForm&&p.push(function(){i.clearForm(d.includeHidden)}),!d.dataType&&d.target?(q=d.success||function(){},p.push(function(b){var c=d.replaceTarget?"replaceWith":"html";a(d.target)[c](b).each(q,arguments)})):d.success&&p.push(d.success),d.success=function(a,b,c){var f,g,e=d.context||this;for(f=0,g=p.length;g>f;f++)p[f].apply(e,[a,b,c||i,i])},d.error&&(r=d.error,d.error=function(a,b,c){var e=d.context||this;r.apply(e,[a,b,c,i])}),d.complete&&(s=d.complete,d.complete=function(a,b){var c=d.context||this;s.apply(c,[a,b,i])}),t=a("input[type=file]:enabled",this).filter(function(){return""!==a(this).val()}),u=t.length>0,v="multipart/form-data",w=i.attr("enctype")==v||i.attr("encoding")==v,x=b.fileapi&&b.formdata,f("fileAPI :"+x),y=(u||w)&&!x,d.iframe!==!1&&(d.iframe||y)?d.closeKeepAlive?a.get(d.closeKeepAlive,function(){z=D(n)}):z=D(n):z=(u||w)&&x?C(n):a.ajax(d),i.removeData("jqxhr").data("jqxhr",z),A=0;A<l.length;A++)l[A]=null;return this.trigger("form-submit-notify",[this,d]),this},a.fn.ajaxForm=function(b){if(b=b||{},b.delegation=b.delegation&&a.isFunction(a.fn.on),!b.delegation&&0===this.length){var c={s:this.selector,c:this.context};return!a.isReady&&c.s?(f("DOM not ready, queuing ajaxForm"),a(function(){a(c.s,c.c).ajaxForm(b)}),this):(f("terminating; zero elements found by selector"+(a.isReady?"":" (DOM not ready)")),this)}return b.delegation?(a(document).off("submit.form-plugin",this.selector,d).off("click.form-plugin",this.selector,e).on("submit.form-plugin",this.selector,b,d).on("click.form-plugin",this.selector,b,e),this):this.ajaxFormUnbind().bind("submit.form-plugin",b,d).bind("click.form-plugin",b,e)},a.fn.ajaxFormUnbind=function(){return this.unbind("submit.form-plugin click.form-plugin")},a.fn.formToArray=function(c,d){var f,g,h,i,j,k,l,m,n,o,p,q,r,s,e=[];if(0===this.length)return e;if(f=this[0],g=this.attr("id"),h=c?f.getElementsByTagName("*"):f.elements,h&&!/MSIE [678]/.test(navigator.userAgent)&&(h=a(h).get()),g&&(i=a(":input[form="+g+"]").get(),i.length&&(h=(h||[]).concat(i))),!h||!h.length)return e;for(j=0,o=h.length;o>j;j++)if(n=h[j],l=n.name,l&&!n.disabled)if(c&&f.clk&&"image"==n.type)f.clk==n&&(e.push({name:l,value:a(n).val(),type:n.type}),e.push({name:l+".x",value:f.clk_x},{name:l+".y",value:f.clk_y}));else if(m=a.fieldValue(n,!0),m&&m.constructor==Array)for(d&&d.push(n),k=0,p=m.length;p>k;k++)e.push({name:l,value:m[k]});else if(b.fileapi&&"file"==n.type)if(d&&d.push(n),q=n.files,q.length)for(k=0;k<q.length;k++)e.push({name:l,value:q[k],type:n.type});else e.push({name:l,value:"",type:n.type});else null!==m&&"undefined"!=typeof m&&(d&&d.push(n),e.push({name:l,value:m,type:n.type,required:n.required}));return!c&&f.clk&&(r=a(f.clk),s=r[0],l=s.name,l&&!s.disabled&&"image"==s.type&&(e.push({name:l,value:r.val()}),e.push({name:l+".x",value:f.clk_x},{name:l+".y",value:f.clk_y}))),e},a.fn.formSerialize=function(b){return a.param(this.formToArray(b))},a.fn.fieldSerialize=function(b){var c=[];return this.each(function(){var e,f,g,d=this.name;if(d)if(e=a.fieldValue(this,b),e&&e.constructor==Array)for(f=0,g=e.length;g>f;f++)c.push({name:d,value:e[f]});else null!==e&&"undefined"!=typeof e&&c.push({name:this.name,value:e})}),a.param(c)},a.fn.fieldValue=function(b){var c,d,e,f,g;for(c=[],d=0,e=this.length;e>d;d++)f=this[d],g=a.fieldValue(f,b),null===g||"undefined"==typeof g||g.constructor==Array&&!g.length||(g.constructor==Array?a.merge(c,g):c.push(g));return c},a.fieldValue=function(b,c){var g,h,i,j,k,l,m,n,d=b.name,e=b.type,f=b.tagName.toLowerCase();if(void 0===c&&(c=!0),c&&(!d||b.disabled||"reset"==e||"button"==e||("checkbox"==e||"radio"==e)&&!b.checked||("submit"==e||"image"==e)&&b.form&&b.form.clk!=b||"select"==f&&-1==b.selectedIndex))return null;if("select"==f){if(g=b.selectedIndex,0>g)return null;for(h=[],i=b.options,j="select-one"==e,k=j?g+1:i.length,l=j?g:0;k>l;l++)if(m=i[l],m.selected){if(n=m.value,n||(n=m.attributes&&m.attributes.value&&!m.attributes.value.specified?m.text:m.value),j)return n;h.push(n)}return h}return a(b).val()},a.fn.clearForm=function(b){return this.each(function(){a("input,select,textarea",this).clearFields(b)})},a.fn.clearFields=a.fn.clearInputs=function(b){var c=/^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i;return this.each(function(){var d=this.type,e=this.tagName.toLowerCase();c.test(d)||"textarea"==e?this.value="":"checkbox"==d||"radio"==d?this.checked=!1:"select"==e?this.selectedIndex=-1:"file"==d?/MSIE/.test(navigator.userAgent)?a(this).replaceWith(a(this).clone(!0)):a(this).val(""):b&&(b===!0&&/hidden/.test(d)||"string"==typeof b&&a(this).is(b))&&(this.value="")})},a.fn.resetForm=function(){return this.each(function(){("function"==typeof this.reset||"object"==typeof this.reset&&!this.reset.nodeType)&&this.reset()})},a.fn.enable=function(a){return void 0===a&&(a=!0),this.each(function(){this.disabled=!a})},a.fn.selected=function(b){return void 0===b&&(b=!0),this.each(function(){var d,c=this.type;"checkbox"==c||"radio"==c?this.checked=b:"option"==this.tagName.toLowerCase()&&(d=a(this).parent("select"),b&&d[0]&&"select-one"==d[0].type&&d.find("option").selected(!1),this.selected=b)})},a.fn.ajaxSubmit.debug=!1});



$.fn.extend({

	formCheck:function(opts){
			

		opts = jQuery.extend({
			success:function(the){},
			failure:function(the){}
		}, opts || {});

		var the,msg,

		// 提示
		tips = {
			// 提示
			warn:function(dom,value){
				dom.siblings('i').attr('class','form-note-warn').html(value);
				opts.failure(the);
			},
			// 错误
			error:function(dom,value){
				dom.siblings('i').attr('class','form-note-error').html(value);
				opts.failure(the);
			},
			// 成功
			success:function(dom,value){
				dom.siblings('i').attr('class','form-note-success').html(value);
				opts.success(the);
			},
			// 等待
			wait:function(dom,value){
				dom.siblings('i').attr('class','form-note-wait').html(value);
			},
			// 取消提示
			notips:function(dom,value){
				dom.siblings('i').attr('class','').html(value);
			}
			
		}

		var rule = {
			// 长度验证
			context:function(){
					return the.val().length<90 ? false: ['长度过长','warn'];
			},
			
			textsize:function(){
				return the.val().length<50 ? false: ['商户描述最多50字','warn'];
			},
			
			textlength:function(){
				return the.val().length<50 ? false: ['长度最多20字','warn'];
			},

			// 检测不为空
			required:function(){
				return the.val().length>0 ? false: ['不能为空','warn'];
			},
			// 检测为数字
			number:function(){
				return /^\d+$/.test(the.val()) ? false : '必须为数字';
			},
			
			
			// 检测为数字或者小数
			numbers:function(){
				return /^[.0-9]+$/.test(the.val()) ? false : '必须为数字或者小数';
			},
			// 折扣率
			discount:function(){
				var val = the.val();
				if(!val) {
					return false;
				}

				if(!/^[.0-9]+$/.test(val)){
					return '请正确输入折扣率，默认请留空';
				}
				if(parseFloat(val) <= the.attr('discount')){

					return false;
				}else{
					return '请输入的折率小于等于'+the.attr('discount');
				}
	
			},
			
			// 提现金额检测
			discountbill:function(){
				var val = parseFloat(the.val());
				if(!val) {
					return false;
				}
				
				if(val<500){
					return '提现金额必须大于或等于500';
				}else if(val>the.attr('discount')){
					return '您的金额不足'+val+'元';
				}
			},
			
			// 检测邮箱账号
			email:function(){
				return /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+\.){1,63}[a-z0-9]+$/.test(the.val()) ? false : '邮箱格式错误';
			},
			// 检测密码
			password:function(){
				return /^[\d|\D]{6,18}$/.test(the.val()) ? false : '密码必须是6-18位字符';
			},
			// 检测重复密码
			repassword:function(){
				return the.val() === the.closest('form').find('input[type="password"]').not(the).last().val() ? false : '密码不一致';
			},
			// 检测手机号码
			phone:function(){
				the.val(the.val().replace(/\s*/gi,''));
				return /(^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$)|(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/.test(the.val()) ? false : '手机号码格式错误';
			},
			// 检测选中状态
			checked:function(){
				return the.prop('checked') ? false : '未选中';
			},
			// 检测中文
			name:function(){
				var val = the.val();
				return  /\./.test(val) || /^[\u4E00-\u9FA5]+$/.test(val)? false : '请输入中文';
			},
			// 检测银行卡
			bank:function(){
				var val = the.val() ? the.val().replace(/\D/gi,'') : '';
				return /^\d{16,19}$|^\d{6}[- ]\d{10,13}$|^\d{4}[- ]\d{4}[- ]\d{4}[- ]\d{4,7}$/.test(val) ? false : '银行卡格式错误';
			},
			cvn:function(){
				return /^\d{3}$/ ?false : 'cvn2错误'

			},
			// 之间
			between:function(){
				var max = parseFloat(the.attr('max'));
				var min = parseFloat(the.attr('min'));
				var val = parseFloat(the.val());
				return val<=max && val>=min ? false : '请输入大于'+min+'并且小于'+max+'的值';
			},
			// 检测身份证号
			IDcard:function(){

				var val = the.val();
				var iSum=0 ;
				var info="" ;
				var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
				
				if(val.length !== 18){
					return '身份证号长度有误';
				}

				if (!/^\d{17}(\d|x)$/i.test(val)) {
					return '身份证格式错误';
				}
				
				val = val.replace(/x$/i, "a");
				if (aCity[parseInt(val.substr(0, 2))] == null) {
					return '地址编码错误';
				}


				sBirthday = val.substr(6, 4) + "-" + Number(val.substr(10, 2)) + "-" + Number(val.substr(12, 2));
				var d = new Date(sBirthday.replace(/-/g, "/"));
				if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) {
					return '出生日期有误';
				}


				for (var i = 17; i >= 0; i--) iSum += (Math.pow(2, i) % 11) * parseInt(val.charAt(17 - i), 11);
				if (iSum % 11 != 1) {
					return '身份证不存在';
				}	
			},

			// 信用卡
			xiyongcard:function(){

				$.getJSON('/getBankcardTypeByCardno.shtml?cardno='+the.val(),function(json){
					if(json.status != 200) return;
					if(json.type == 2){
						$('.pay_type').val(2);
						the.closest('cite').siblings('.pay_xinyong').show().animate({height:(json.type == 2 ?104:0)},300);
					}else{
						$('.pay_type').val(1);
						var fuck = the.closest('cite').siblings('.pay_xinyong').animate({height:(json.type == 2 ?104:0)},300,'linear',function(){fuck.hide();});
					}

					json.bankTrueName = json.bankTrueName ? json.bankTrueName : '';
					json.cardTypeNmae = json.cardTypeNmae ? json.cardTypeNmae : '';
					tips.success(the,json.bankTrueName+' '+json.cardTypeNmae);


					
					
				});

			},

			// 注册——检查手机号码
			ajax_register_phone:function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: "pre-registration.shtml",
					data: "mobile=" + the.val(), //传值，这里直接传了字符串
					success: function(data) { 

						if(data.status && data.status === '200'){
							tips.success(the,'');
							//the.closest('form').find('input[name=username]').val(data.name || '');
						}else{
							var value = data.message || '';
							tips.error(the,value);
						}
						the = null;
					},
					error:function(){
						// results('服务器繁忙，请稍后再试');
					}
				});
			},
			//找回密码检测手机号是否有效
			ajax_password_phone:function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: "retrieve_password.shtml",
					data: "mobile=" + the.val(), //传值，这里直接传了字符串
					success: function(data) { 

						if(data.status && data.status === '200'){
							tips.success(the,'');
							//$("#getcode").disabled("true");
						}else{
							var value = data.message || '';
							tips.error(the,value);
							//$("#getcode").disabled("false");
						}
						the = null;
					},
					error:function(){
						// results('服务器繁忙，请稍后再试');
					}
				});
			},


			pioneer_code:function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: "togetContract.shtml",
					data: "sigen=" + the.val(), //传值，这里直接传了字符串
					success: function(data) { 
						if(data.status && data.status === '200'){
							$('.pioneer_name').html('推荐人：'+data.name);
							tips.success(the,'');
						}else{
							var value = data.message || '';
							tips.error(the,value);
							$('.pioneer_name').html('请联系您的推荐人，以获取邀请码，如需帮助，请致电官服电话4008-119-789');
						}
						the = null;
					},
					error:function(){
						// results('服务器繁忙，请稍后再试');
					}
				});

			},
			
			//立即提现检测手机号是否当前登录账户的手机号
			ajax_bill_phone:function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: "checkPhoneBill.shtml",
					data: "mobile=" + the.val(), //传值，这里直接传了字符串
					success: function(data) { 

						if(data.status && data.status === '200'){
							tips.success(the,'');
							
						}else{
							var value = data.message || '';
							tips.error(the,value);
						}
						the = null;
					},
					error:function(){
						// results('服务器繁忙，请稍后再试');
					}
				});
			},

			
			// 立即提现时——检查短信验证码
			ajax_bill_checkcode:function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: "checkbillredtwo.shtml",
					data: "code="+ the.val() + '&mobile='+the.closest('form').find('input[name="mobile"]').val(), //传值，这里直接传了字符串
					success: function(data) { 
						if(data.status && data.status === '200'){
							tips.success(the,'');
						}else{
							tips.error(the,data.message || '');
						}
					},
					error:function(){
						results('服务器繁忙，请稍后再试');
					}
				});
			},
	
			// 注册——检查短信验证码
			ajax_register_checkcode:function(){
				$.ajax({
					type: "POST",
					dataType:'json',
					url: "verificationcode.shtml",
					data: "code="+ the.val() + '&mobile='+the.closest('form').find('input[name="mobile"]').val(), //传值，这里直接传了字符串
					success: function(data) { 
						if(data.status && data.status === '200'){
							tips.success(the,'');
						}else{
							tips.error(the,data.message || '');
						}
					},
					error:function(){
						results('服务器繁忙，请稍后再试');
					}
				});
			}
		}

		
		var check = function(item){

			the = item;
			var x,checked,success,res = true,
			name = (the.attr('check') || '').split(','),
			toString = Object.prototype.toString;
			

			for(x in name){
				// 有提示
				if(rule[name[x]] && (checked = rule[name[x]]()) ){

					// 数组
					if(toString.call(checked) === '[object Array]'){
						tips[checked[1]] && tips[checked[1]](the,checked[0]);
						if(checked[1] === 'success'){
							success = checked[0] || '';
						}else{
							res = false;
						}

					// 字符串
					}else if(toString.call(checked) === '[object String]'){
						// 默认提示
						tips.error && tips.error(the,checked);
						res = false;
					}

					// 只检验一个失败
					if(!res) break;
				}
			}

			// 如果都通过检验，则显示通过
			if(res) tips.success && tips.success(the,'');

			return res;
		}


		
		return check(this);
	},
	// 下拉
	slct:function(opts){

	
		// 创建点位内容
		this.each(function(){

			var idx = this.selectedIndex;
			var per = this.parentNode;

			per.slt = this;
			per.tle = document.createElement('span');
			per.cnt = document.createElement('ul');
			
			per.tle.className = 'fukrm_select_tle';
			per.tle.innerHTML =  idx <0 ? '':this.options[idx].text;
			per.cnt.className = 'fukrm_select_cnt';

			per.appendChild(per.tle);
			per.appendChild(per.cnt);
		
		});

		// 值改变事件
		this.on('change',function(){
			var idx = this.selectedIndex ;
				idx = idx>-1? idx :0;
			this.parentNode.tle.innerHTML = this.options[idx] ? this.options[idx].text :'';
		}).parent().on('click','li',function(e){

			// 内容点击事件
			var box = this.parentNode.parentNode,
				idx = (function(s,t){for (var i=0,l=s.length;i<l;i++) {if(s[i]==t){return i;}}})(box.cnt.getElementsByTagName('li'),this);
				box.cnt.style.display = 'none';
			if(idx == box.slt.selectedIndex) return;

			box.slt.selectedIndex = idx;
			$(box.slt).trigger('change');
		}).on('click','span',function(e){

			// 标题点击事件
			var box = this.parentNode;
			box.cnt.innerHTML = box.slt.innerHTML.replace(/option/gi,'li');
			box.cnt.style.display = 'block';
			return false;
		});

		var the = this;

		$(document).on('click',function(){
			the.parent().each(function(){
				this.cnt.style.display = 'none';
			});
		});

	},
	citys:function(ops) {

		var prov=[],city = [],town=[];

		prov[0] = [110000,0,'北京'];prov[1] = [340000,0,'安徽'];prov[2] = [500000,0,'重庆'];prov[3] = [350000,0,'福建'];prov[4] = [440000,0,'广东'];prov[5] = [620000,0,'甘肃'];prov[6] = [450000,0,'广西'];prov[7] = [520000,0,'贵州'];prov[8] = [410000,0,'河南'];prov[9] = [420000,0,'湖北'];prov[10] = [130000,0,'河北'];prov[11] = [460000,0,'海南'];prov[12] = [810000,0,'香港'];prov[13] = [230000,0,'黑龙江'];prov[14] = [430000,0,'湖南'];prov[15] = [220000,0,'吉林'];prov[16] = [320000,0,'江苏'];prov[17] = [360000,0,'江西'];prov[18] = [210000,0,'辽宁'];prov[19] = [820000,0,'澳门'];prov[20] = [150000,0,'内蒙古'];prov[21] = [640000,0,'宁夏'];prov[22] = [630000,0,'青海'];prov[23] = [510000,0,'四川'];prov[24] = [370000,0,'山东'];prov[25] = [310000,0,'上海'];prov[26] = [610000,0,'陕西'];prov[27] = [140000,0,'山西'];prov[28] = [120000,0,'天津'];prov[29] = [710000,0,'台湾'];prov[30] = [650000,0,'新疆'];prov[31] = [540000,0,'西藏'];prov[32] = [530000,0,'云南'];prov[33] = [330000,0,'浙江'];
		city[0] =[1000,110000,"北京市"];city[1] =[1100,120000,"天津市"];city[2] =[1210,130000,"石家庄市"];city[3] =[1240,130000,"唐山市"];city[4] =[1260,130000,"秦皇岛市"];city[5] =[1270,130000,"邯郸市"];city[6] =[1310,130000,"邢台市"];city[7] =[1340,130000,"保定市"];city[8] =[1380,130000,"张家口市"];city[9] =[1410,130000,"承德市"];city[10] =[1430,130000,"沧州市"];city[11] =[1460,130000,"廊坊市"];city[12] =[1480,130000,"衡水市"];city[13] =[1610,140000,"太原市"];city[14] =[1620,140000,"大同市"];city[15] =[1630,140000,"阳泉市"];city[16] =[1640,140000,"长治市"];city[17] =[1680,140000,"晋城市"];city[18] =[1690,140000,"朔州市"];city[19] =[1710,140000,"忻州市"];city[20] =[1730,140000,"吕梁市"];city[21] =[1750,140000,"晋中市"];city[22] =[1770,140000,"临汾市"];city[23] =[1810,140000,"运城市"];city[24] =[1910,150000,"呼和浩特市"];city[25] =[1920,150000,"包头市"];city[26] =[1930,150000,"乌海市"];city[27] =[1940,150000,"赤峰市"];city[28] =[1960,150000,"呼伦贝尔市"];city[29] =[1980,150000,"兴安盟"];city[30] =[1990,150000,"通辽市"];city[31] =[2010,150000,"锡林郭勒盟"];city[32] =[2030,150000,"乌兰察布市"];city[33] =[2050,150000,"鄂尔多斯市"];city[34] =[2070,150000,"巴彦淖尔市"];city[35] =[2080,150000,"阿拉善盟"];city[36] =[2210,210000,"沈阳市"];city[37] =[2220,210000,"大连市"];city[38] =[2230,210000,"鞍山市"];city[39] =[2240,210000,"抚顺市"];city[40] =[2250,210000,"本溪市"];city[41] =[2260,210000,"丹东市"];city[42] =[2270,210000,"锦州市"];city[43] =[2276,210000,"葫芦岛市"];city[44] =[2280,210000,"营口市"];city[45] =[2290,210000,"阜新市"];city[46] =[2310,210000,"辽阳市"];city[47] =[2320,210000,"盘锦市"];city[48] =[2330,210000,"铁岭市"];city[49] =[2340,210000,"朝阳市"];city[50] =[2410,220000,"长春市"];city[51] =[2420,220000,"吉林市"];city[52] =[2430,220000,"四平市"];city[53] =[2440,220000,"辽源市"];city[54] =[2450,220000,"通化市"];city[55] =[2460,220000,"白山市"];city[56] =[2470,220000,"白城市"];city[57] =[2520,220000,"松原市"];city[58] =[2490,220000,"延边州"];city[59] =[2610,230000,"哈尔滨市"];city[60] =[2640,230000,"齐齐哈尔市"];city[61] =[2650,230000,"大庆市"];city[62] =[2660,230000,"鸡西市"];city[63] =[2670,230000,"鹤岗市"];city[64] =[2680,230000,"双鸭山市"];city[65] =[2690,230000,"佳木斯市"];city[66] =[2710,230000,"伊春市"];city[67] =[2720,230000,"牡丹江市"];city[68] =[2740,230000,"七台河市"];city[69] =[2760,230000,"绥化市"];city[70] =[2780,230000,"黑河市"];city[71] =[2790,230000,"大兴安岭地区"];city[72] =[2900,310000,"上海市"];city[73] =[3010,320000,"南京市"];city[74] =[3020,320000,"无锡市"];city[75] =[3030,320000,"徐州市"];city[76] =[3040,320000,"常州市"];city[77] =[3050,320000,"苏州市"];city[78] =[3060,320000,"南通市"];city[79] =[3070,320000,"连云港市"];city[80] =[3080,320000,"淮安市"];city[81] =[3090,320000,"宿迁市"];city[82] =[3110,320000,"盐城市"];city[83] =[3120,320000,"扬州市"];city[84] =[3128,320000,"泰州市"];city[85] =[3140,320000,"镇江市"];city[86] =[3310,330000,"杭州市"];city[87] =[3320,330000,"宁波市"];city[88] =[3330,330000,"温州市"];city[89] =[3350,330000,"嘉兴市"];city[90] =[3360,330000,"湖州市"];city[91] =[3370,330000,"绍兴市"];city[92] =[3380,330000,"金华市"];city[93] =[3410,330000,"衢州市"];city[94] =[3420,330000,"舟山市"];city[95] =[3430,330000,"丽水市"];city[96] =[3450,330000,"台州市"];city[97] =[3610,340000,"合肥市"];city[98] =[3620,340000,"芜湖市"];city[99] =[3630,340000,"蚌埠市"];city[100] =[3640,340000,"淮南市"];city[101] =[3650,340000,"马鞍山市"];city[102] =[3660,340000,"淮北市"];city[103] =[3670,340000,"铜陵市"];city[104] =[3680,340000,"安庆市"];city[105] =[3710,340000,"黄山市"];city[106] =[3720,340000,"阜阳市"];city[107] =[3722,340000,"亳州市"];city[108] =[3740,340000,"宿州市"];city[109] =[3750,340000,"滁州市"];city[110] =[3760,340000,"六安市"];city[111] =[3771,340000,"宣城市"];city[112] =[3781,340000,"巢湖市"];city[113] =[3790,340000,"池州市"];city[114] =[3910,350000,"福州市"];city[115] =[3930,350000,"厦门市"];city[116] =[3940,350000,"莆田市"];city[117] =[3950,350000,"三明市"];city[118] =[3970,350000,"泉州市"];city[119] =[3990,350000,"漳州市"];city[120] =[4010,350000,"南平市"];city[121] =[4030,350000,"宁德市"];city[122] =[4050,350000,"龙岩市"];city[123] =[4210,360000,"南昌市"];city[124] =[4220,360000,"景德镇市"];city[125] =[4230,360000,"萍乡市"];city[126] =[4240,360000,"九江市"];city[127] =[4260,360000,"新余市"];city[128] =[4270,360000,"鹰谭市"];city[129] =[4280,360000,"赣州市"];city[130] =[4310,360000,"宜春市"];city[131] =[4330,360000,"上饶市"];city[132] =[4350,360000,"吉安市"];city[133] =[4370,360000,"抚州市"];city[134] =[4510,370000,"济南市"];city[135] =[4520,370000,"青岛市"];city[136] =[4530,370000,"淄博市"];city[137] =[4540,370000,"枣庄市"];city[138] =[4550,370000,"东营市"];city[139] =[4560,370000,"烟台市"];city[140] =[4580,370000,"潍坊市"];city[141] =[4610,370000,"济宁市"];city[142] =[4630,370000,"泰安市"];city[143] =[4634,370000,"莱芜市"];city[144] =[4650,370000,"威海市"];city[145] =[4660,370000,"滨州市"];city[146] =[4680,370000,"德州市"];city[147] =[4710,370000,"聊城市"];city[148] =[4730,370000,"临沂市"];city[149] =[4732,370000,"日照市"];city[150] =[4750,370000,"菏泽市"];city[151] =[4910,410000,"郑州市"];city[152] =[4920,410000,"开封市"];city[153] =[4930,410000,"洛阳市"];city[154] =[4950,410000,"平顶山市"];city[155] =[4960,410000,"安阳市"];city[156] =[4970,410000,"鹤壁市"];city[157] =[4980,410000,"新乡市"];city[158] =[5010,410000,"焦作市"];city[159] =[5020,410000,"濮阳市"];city[160] =[5030,410000,"许昌市"];city[161] =[5040,410000,"漯河市"];city[162] =[5050,410000,"三门峡市"];city[163] =[5060,410000,"商丘市"];city[164] =[5080,410000,"周口市"];city[165] =[5110,410000,"驻马店市"];city[166] =[5130,410000,"南阳市"];city[167] =[5150,410000,"信阳市"];city[168] =[5210,420000,"武汉市"];city[169] =[5220,420000,"黄石市"];city[170] =[5230,420000,"十堰市"];city[171] =[5260,420000,"宜昌市"];city[172] =[5280,420000,"襄樊市"];city[173] =[5286,420000,"随州市"];city[174] =[5310,420000,"鄂州市"];city[175] =[5320,420000,"荆门市"];city[176] =[5330,420000,"黄冈市"];city[177] =[5350,420000,"孝感市"];city[178] =[5360,420000,"咸宁市"];city[179] =[5370,420000,"荆州市"];city[180] =[5410,420000,"恩施州"];city[181] =[5510,430000,"长沙市"];city[182] =[5520,430000,"株州市"];city[183] =[5530,430000,"湘潭市"];city[184] =[5540,430000,"衡阳市"];city[185] =[5550,430000,"邵阳市"];city[186] =[5570,430000,"岳阳市"];city[187] =[5580,430000,"常德市"];city[188] =[5590,430000,"张家界市"];city[189] =[5610,430000,"益阳市"];city[190] =[5620,430000,"娄底市"];city[191] =[5630,430000,"郴州市"];city[192] =[5650,430000,"永州市"];city[193] =[5670,430000,"怀化市"];city[194] =[5690,430000,"吉首市"];city[195] =[5810,440000,"广州市"];city[196] =[5820,440000,"韶关市"];city[197] =[5840,440000,"深圳市"];city[198] =[5850,440000,"珠海市"];city[199] =[5860,440000,"汕头市"];city[200] =[5865,440000,"揭阳市"];city[201] =[5869,440000,"潮州市"];city[202] =[5880,440000,"佛山市"];city[203] =[5890,440000,"江门市"];city[204] =[5910,440000,"湛江市"];city[205] =[5920,440000,"茂名市"];city[206] =[5930,440000,"肇庆市"];city[207] =[5937,440000,"云浮市"];city[208] =[5950,440000,"惠州市"];city[209] =[5960,440000,"梅州市"];city[210] =[5970,440000,"汕尾市"];city[211] =[5980,440000,"河源市"];city[212] =[5990,440000,"阳江市"];city[213] =[6010,440000,"清远市"];city[214] =[6020,440000,"东莞市"];city[215] =[6030,440000,"中山市"];city[216] =[6110,450000,"南宁市"];city[217] =[6128,450000,"崇左市"];city[218] =[6140,450000,"柳州市"];city[219] =[6155,450000,"来宾市"];city[220] =[6170,450000,"桂林市"];city[221] =[6210,450000,"梧州市"];city[222] =[6225,450000,"贺州市"];city[223] =[6230,450000,"北海市"];city[224] =[6240,450000,"玉林市"];city[225] =[6242,450000,"贵港市"];city[226] =[6261,450000,"百色市"];city[227] =[6281,450000,"河池市"];city[228] =[6311,450000,"钦州市"];city[229] =[6330,400,"防城港市"];city[230] =[6410,460000,"海口市"];city[231] =[6420,460000,"三亚市"];city[232] =[6510,510000,"成都市"];city[233] =[6550,510000,"自贡市"];city[234] =[6560,510000,"攀枝花市"];city[235] =[6570,510000,"泸州市"];city[236] =[6580,510000,"德阳市"];city[237] =[6590,510000,"绵阳市"];city[238] =[6610,510000,"广元市"];city[239] =[6620,510000,"遂宁市"];city[240] =[6630,510000,"内江市"];city[241] =[6636,510000,"资阳市"];city[242] =[6650,510000,"乐山市"];city[243] =[6652,510000,"眉山市"];city[244] =[6710,510000,"宜宾市"];city[245] =[6730,510000,"南充市"];city[246] =[6737,510000,"广安市"];city[247] =[6750,510000,"达州市"];city[248] =[6758,510000,"巴中市"];city[249] =[6770,510000,"雅安市"];city[250] =[6790,510000,"阿坝州"];city[251] =[6810,510000,"甘孜州"];city[252] =[6840,510000,"凉山州"];city[253] =[6530,500000,"重庆市"];city[254] =[6670,500000,"万州市"];city[255] =[6690,500000,"涪陵市"];city[256] =[6870,500000,"黔江市"];city[257] =[7010,520000,"贵阳市"];city[258] =[7020,520000,"六盘水市"];city[259] =[7030,520000,"遵义市"];city[260] =[7110,520000,"安顺市"];city[261] =[7310,530000,"昆明市"];city[262] =[7340,530000,"昭通市"];city[263] =[7360,530000,"曲靖市"];city[264] =[7410,530000,"玉溪市"];city[265] =[7470,530000,"思茅市"];city[266] =[7530,530000,"保山市"];city[267] =[7550,530000,"丽江市"];city[268] =[7580,530000,"临沧市"];city[269] =[7700,540000,"拉萨市"];city[270] =[7910,610000,"西安市"];city[271] =[7920,610000,"铜川市"];city[272] =[7930,610000,"宝鸡市"];city[273] =[7950,610000,"咸阳市"];city[274] =[7970,610000,"渭南市"];city[275] =[7990,610000,"汉中市"];city[276] =[8010,610000,"安康市"];city[277] =[8030,610000,"商洛市"];city[278] =[8040,610000,"延安市"];city[279] =[8060,610000,"榆林市"];city[280] =[8210,620000,"兰州市"];city[281] =[8220,620000,"嘉峪关市"];city[282] =[8230,620000,"金昌市"];city[283] =[8240,620000,"白银市"];city[284] =[8250,620000,"天水市"];city[285] =[8260,620000,"酒泉市"];city[286] =[8270,620000,"张掖市"];city[287] =[8280,620000,"武威市"];city[288] =[8290,620000,"定西市"];city[289] =[8310,620000,"陇南市"];city[290] =[8330,620000,"平凉市"];city[291] =[8340,620000,"庆阳市"];city[292] =[8360,620000,"临夏州"];city[293] =[8380,620000,"甘南州"];city[294] =[8510,630000,"西宁市"];city[295] =[8520,630000,"海东地区"];city[296] =[8540,630000,"海北藏族自治州"];city[297] =[8550,630000,"黄南藏族自治州"];city[298] =[8560,630000,"海南藏族自治州"];city[299] =[8570,630000,"果洛藏族自治州"];city[300] =[8580,630000,"玉树藏族自治州"];city[301] =[8590,630000,"海西蒙古族藏族自治州"];city[302] =[8710,640000,"银川市"];city[303] =[8720,640000,"石嘴山市"];city[304] =[8731,640000,"吴忠市"];city[305] =[8733,640000,"中卫市"];city[306] =[8741,640000,"固原市"];city[307] =[8810,650000,"乌鲁木齐市"];city[308] =[8820,650000,"克拉玛依市"];city[309] =[8830,650000,"吐鲁番地区"];city[310] =[8840,650000,"哈密地区"];city[311] =[8850,650000,"昌吉回族自治州"];city[312] =[8870,650000,"博尔塔拉蒙古自治州"];city[313] =[8880,650000,"巴音郭楞蒙古自治州"];city[314] =[8910,650000,"阿克苏地区"];city[315] =[8930,650000,"克孜勒苏柯尔克孜自治州"];city[316] =[8940,650000,"喀什地区"];city[317] =[8960,650000,"和田地区"];city[318] =[8980,650000,"伊犁哈萨克自治州"];city[319] =[9010,650000,"塔城地区"];city[320] =[9020,650000,"阿勒泰地区"];city[321] =[902,650000,"石河子市"] 
		town[0] = [null,1000,'东城区'];town[1] = [null,1000,'西城区'];town[2] = [null,1000,'朝阳区'];town[3] = [null,1000,'丰台区'];town[4] = [null,1000,'石景山区'];town[5] = [null,1000,'海淀区'];town[6] = [null,1000,'门头沟区'];town[7] = [null,1000,'房山区'];town[8] = [null,1000,'通州区'];town[9] = [null,1000,'顺义区'];town[10] = [null,1000,'昌平区'];town[11] = [null,1000,'大兴区'];town[12] = [null,1000,'怀柔区'];town[13] = [null,1000,'平谷区'];town[14] = [null,1000,'密云县'];town[15] = [null,1000,'延庆县'];town[16] = [null,1100,'和平区'];town[17] = [null,1100,'河东区'];town[18] = [null,1100,'河西区'];town[19] = [null,1100,'南开区'];town[20] = [null,1100,'河北区'];town[21] = [null,1100,'红桥区'];town[22] = [null,1100,'东丽区'];town[23] = [null,1100,'西青区'];town[24] = [null,1100,'津南区'];town[25] = [null,1100,'北辰区'];town[26] = [null,1100,'武清区'];town[27] = [null,1100,'宝坻区'];town[28] = [null,1100,'滨海新区'];town[29] = [null,1100,'宁河县'];town[30] = [null,1100,'静海县'];town[31] = [null,1100,'蓟县'];town[32] = [null,1210,'长安区'];town[33] = [null,1210,'桥东区'];town[34] = [null,1210,'桥西区'];town[35] = [null,1210,'新华区'];town[36] = [null,1210,'井陉矿区'];town[37] = [null,1210,'裕华区'];town[38] = [null,1210,'井陉县'];town[39] = [null,1210,'正定县'];town[40] = [null,1210,'栾城县'];town[41] = [null,1210,'行唐县'];town[42] = [null,1210,'灵寿县'];town[43] = [null,1210,'高邑县'];town[44] = [null,1210,'深泽县'];town[45] = [null,1210,'赞皇县'];town[46] = [null,1210,'无极县'];town[47] = [null,1210,'平山县'];town[48] = [null,1210,'元氏县'];town[49] = [null,1210,'赵县'];town[50] = [null,1210,'辛集市'];town[51] = [null,1210,'藁城市'];town[52] = [null,1210,'晋州市'];town[53] = [null,1210,'新乐市'];town[54] = [null,1210,'鹿泉市'];town[55] = [null,1240,'路南区'];town[56] = [null,1240,'路北区'];town[57] = [null,1240,'古冶区'];town[58] = [null,1240,'开平区'];town[59] = [null,1240,'丰南区'];town[60] = [null,1240,'丰润区'];town[61] = [null,1240,'曹妃甸区'];town[62] = [null,1240,'滦县'];town[63] = [null,1240,'滦南县'];town[64] = [null,1240,'乐亭县'];town[65] = [null,1240,'迁西县'];town[66] = [null,1240,'玉田县'];town[67] = [null,1240,'遵化市'];town[68] = [null,1240,'迁安市'];town[69] = [null,1260,'海港区'];town[70] = [null,1260,'山海关区'];town[71] = [null,1260,'北戴河区'];town[72] = [null,1260,'青龙满族自治县'];town[73] = [null,1260,'昌黎县'];town[74] = [null,1260,'抚宁县'];town[75] = [null,1260,'卢龙县'];town[76] = [null,1270,'邯山区'];town[77] = [null,1270,'丛台区'];town[78] = [null,1270,'复兴区'];town[79] = [null,1270,'峰峰矿区'];town[80] = [null,1270,'邯郸县'];town[81] = [null,1270,'临漳县'];town[82] = [null,1270,'成安县'];town[83] = [null,1270,'大名县'];town[84] = [null,1270,'涉县'];town[85] = [null,1270,'磁县'];town[86] = [null,1270,'肥乡县'];town[87] = [null,1270,'永年县'];town[88] = [null,1270,'邱县'];town[89] = [null,1270,'鸡泽县'];town[90] = [null,1270,'广平县'];town[91] = [null,1270,'馆陶县'];town[92] = [null,1270,'魏县'];town[93] = [null,1270,'曲周县'];town[94] = [null,1270,'武安市'];town[95] = [null,1310,'桥东区'];town[96] = [null,1310,'桥西区'];town[97] = [null,1310,'邢台县'];town[98] = [null,1310,'临城县'];town[99] = [null,1310,'内丘县'];town[100] = [null,1310,'柏乡县'];town[101] = [null,1310,'隆尧县'];town[102] = [null,1310,'任县'];town[103] = [null,1310,'南和县'];town[104] = [null,1310,'宁晋县'];town[105] = [null,1310,'巨鹿县'];town[106] = [null,1310,'新河县'];town[107] = [null,1310,'广宗县'];town[108] = [null,1310,'平乡县'];town[109] = [null,1310,'威县'];town[110] = [null,1310,'清河县'];town[111] = [null,1310,'临西县'];town[112] = [null,1310,'南宫市'];town[113] = [null,1310,'沙河市'];town[114] = [null,1340,'新市区'];town[115] = [null,1340,'北市区'];town[116] = [null,1340,'南市区'];town[117] = [null,1340,'满城县'];town[118] = [null,1340,'清苑县'];town[119] = [null,1340,'涞水县'];town[120] = [null,1340,'阜平县'];town[121] = [null,1340,'徐水县'];town[122] = [null,1340,'定兴县'];town[123] = [null,1340,'唐县'];town[124] = [null,1340,'高阳县'];town[125] = [null,1340,'容城县'];town[126] = [null,1340,'涞源县'];town[127] = [null,1340,'望都县'];town[128] = [null,1340,'安新县'];town[129] = [null,1340,'易县'];town[130] = [null,1340,'曲阳县'];town[131] = [null,1340,'蠡县'];town[132] = [null,1340,'顺平县'];town[133] = [null,1340,'博野县'];town[134] = [null,1340,'雄县'];town[135] = [null,1340,'涿州市'];town[136] = [null,1340,'定州市'];town[137] = [null,1340,'安国市'];town[138] = [null,1340,'高碑店市'];town[139] = [null,1380,'桥东区'];town[140] = [null,1380,'桥西区'];town[141] = [null,1380,'宣化区'];town[142] = [null,1380,'下花园区'];town[143] = [null,1380,'宣化县'];town[144] = [null,1380,'张北县'];town[145] = [null,1380,'康保县'];town[146] = [null,1380,'沽源县'];town[147] = [null,1380,'尚义县'];town[148] = [null,1380,'蔚县'];town[149] = [null,1380,'阳原县'];town[150] = [null,1380,'怀安县'];town[151] = [null,1380,'万全县'];town[152] = [null,1380,'怀来县'];town[153] = [null,1380,'涿鹿县'];town[154] = [null,1380,'赤城县'];town[155] = [null,1380,'崇礼县'];town[156] = [null,1410,'双桥区'];town[157] = [null,1410,'双滦区'];town[158] = [null,1410,'鹰手营子矿区'];town[159] = [null,1410,'承德县'];town[160] = [null,1410,'兴隆县'];town[161] = [null,1410,'平泉县'];town[162] = [null,1410,'滦平县'];town[163] = [null,1410,'隆化县'];town[164] = [null,1410,'丰宁满族自治县'];town[165] = [null,1410,'宽城满族自治县'];town[166] = [null,1410,'围场满族蒙古族自治县'];town[167] = [null,1430,'新华区'];town[168] = [null,1430,'运河区'];town[169] = [null,1430,'沧县'];town[170] = [null,1430,'青县'];town[171] = [null,1430,'东光县'];town[172] = [null,1430,'海兴县'];town[173] = [null,1430,'盐山县'];town[174] = [null,1430,'肃宁县'];town[175] = [null,1430,'南皮县'];town[176] = [null,1430,'吴桥县'];town[177] = [null,1430,'献县'];town[178] = [null,1430,'孟村回族自治县'];town[179] = [null,1430,'泊头市'];town[180] = [null,1430,'任丘市'];town[181] = [null,1430,'黄骅市'];town[182] = [null,1430,'河间市'];town[183] = [null,1460,'安次区'];town[184] = [null,1460,'广阳区'];town[185] = [null,1460,'固安县'];town[186] = [null,1460,'永清县'];town[187] = [null,1460,'香河县'];town[188] = [null,1460,'大城县'];town[189] = [null,1460,'文安县'];town[190] = [null,1460,'大厂回族自治县'];town[191] = [null,1460,'霸州市'];town[192] = [null,1460,'三河市'];town[193] = [null,1480,'桃城区'];town[194] = [null,1480,'枣强县'];town[195] = [null,1480,'武邑县'];town[196] = [null,1480,'武强县'];town[197] = [null,1480,'饶阳县'];town[198] = [null,1480,'安平县'];town[199] = [null,1480,'故城县'];town[200] = [null,1480,'景县'];town[201] = [null,1480,'阜城县'];town[202] = [null,1480,'冀州市'];town[203] = [null,1480,'深州市'];town[204] = [null,1610,'小店区'];town[205] = [null,1610,'迎泽区'];town[206] = [null,1610,'杏花岭区'];town[207] = [null,1610,'尖草坪区'];town[208] = [null,1610,'万柏林区'];town[209] = [null,1610,'晋源区'];town[210] = [null,1610,'清徐县'];town[211] = [null,1610,'阳曲县'];town[212] = [null,1610,'娄烦县'];town[213] = [null,1610,'古交市'];town[214] = [null,1620,'城区'];town[215] = [null,1620,'矿区'];town[216] = [null,1620,'南郊区'];town[217] = [null,1620,'新荣区'];town[218] = [null,1620,'阳高县'];town[219] = [null,1620,'天镇县'];town[220] = [null,1620,'广灵县'];town[221] = [null,1620,'灵丘县'];town[222] = [null,1620,'浑源县'];town[223] = [null,1620,'左云县'];town[224] = [null,1620,'大同县'];town[225] = [null,1630,'城区'];town[226] = [null,1630,'矿区'];town[227] = [null,1630,'郊区'];town[228] = [null,1630,'平定县'];town[229] = [null,1630,'盂县'];town[230] = [null,1640,'城区'];town[231] = [null,1640,'郊区'];town[232] = [null,1640,'长治县'];town[233] = [null,1640,'襄垣县'];town[234] = [null,1640,'屯留县'];town[235] = [null,1640,'平顺县'];town[236] = [null,1640,'黎城县'];town[237] = [null,1640,'壶关县'];town[238] = [null,1640,'长子县'];town[239] = [null,1640,'武乡县'];town[240] = [null,1640,'沁县'];town[241] = [null,1640,'沁源县'];town[242] = [null,1640,'潞城市'];town[243] = [null,1680,'城区'];town[244] = [null,1680,'沁水县'];town[245] = [null,1680,'阳城县'];town[246] = [null,1680,'陵川县'];town[247] = [null,1680,'泽州县'];town[248] = [null,1680,'高平市'];town[249] = [null,1690,'朔城区'];town[250] = [null,1690,'平鲁区'];town[251] = [null,1690,'山阴县'];town[252] = [null,1690,'应县'];town[253] = [null,1690,'右玉县'];town[254] = [null,1690,'怀仁县'];town[255] = [null,1750,'榆次区'];town[256] = [null,1750,'榆社县'];town[257] = [null,1750,'左权县'];town[258] = [null,1750,'和顺县'];town[259] = [null,1750,'昔阳县'];town[260] = [null,1750,'寿阳县'];town[261] = [null,1750,'太谷县'];town[262] = [null,1750,'祁县'];town[263] = [null,1750,'平遥县'];town[264] = [null,1750,'灵石县'];town[265] = [null,1750,'介休市'];town[266] = [null,1810,'盐湖区'];town[267] = [null,1810,'临猗县'];town[268] = [null,1810,'万荣县'];town[269] = [null,1810,'闻喜县'];town[270] = [null,1810,'稷山县'];town[271] = [null,1810,'新绛县'];town[272] = [null,1810,'绛县'];town[273] = [null,1810,'垣曲县'];town[274] = [null,1810,'夏县'];town[275] = [null,1810,'平陆县'];town[276] = [null,1810,'芮城县'];town[277] = [null,1810,'永济市'];town[278] = [null,1810,'河津市'];town[279] = [null,1710,'忻府区'];town[280] = [null,1710,'定襄县'];town[281] = [null,1710,'五台县'];town[282] = [null,1710,'代县'];town[283] = [null,1710,'繁峙县'];town[284] = [null,1710,'宁武县'];town[285] = [null,1710,'静乐县'];town[286] = [null,1710,'神池县'];town[287] = [null,1710,'五寨县'];town[288] = [null,1710,'岢岚县'];town[289] = [null,1710,'河曲县'];town[290] = [null,1710,'保德县'];town[291] = [null,1710,'偏关县'];town[292] = [null,1710,'原平市'];town[293] = [null,1770,'尧都区'];town[294] = [null,1770,'曲沃县'];town[295] = [null,1770,'翼城县'];town[296] = [null,1770,'襄汾县'];town[297] = [null,1770,'洪洞县'];town[298] = [null,1770,'古县'];town[299] = [null,1770,'安泽县'];town[300] = [null,1770,'浮山县'];town[301] = [null,1770,'吉县'];town[302] = [null,1770,'乡宁县'];town[303] = [null,1770,'大宁县'];town[304] = [null,1770,'隰县'];town[305] = [null,1770,'永和县'];town[306] = [null,1770,'蒲县'];town[307] = [null,1770,'汾西县'];town[308] = [null,1770,'侯马市'];town[309] = [null,1770,'霍州市'];town[310] = [null,1730,'离石区'];town[311] = [null,1730,'文水县'];town[312] = [null,1730,'交城县'];town[313] = [null,1730,'兴县'];town[314] = [null,1730,'临县'];town[315] = [null,1730,'柳林县'];town[316] = [null,1730,'石楼县'];town[317] = [null,1730,'岚县'];town[318] = [null,1730,'方山县'];town[319] = [null,1730,'中阳县'];town[320] = [null,1730,'交口县'];town[321] = [null,1730,'孝义市'];town[322] = [null,1730,'汾阳市'];town[323] = [null,1910,'新城区'];town[324] = [null,1910,'回民区'];town[325] = [null,1910,'玉泉区'];town[326] = [null,1910,'赛罕区'];town[327] = [null,1910,'土默特左旗'];town[328] = [null,1910,'托克托县'];town[329] = [null,1910,'和林格尔县'];town[330] = [null,1910,'清水河县'];town[331] = [null,1910,'武川县'];town[332] = [null,1920,'东河区'];town[333] = [null,1920,'昆都仑区'];town[334] = [null,1920,'青山区'];town[335] = [null,1920,'石拐区'];town[336] = [null,1920,'白云鄂博矿区'];town[337] = [null,1920,'九原区'];town[338] = [null,1920,'土默特右旗'];town[339] = [null,1920,'固阳县'];town[340] = [null,1920,'达尔罕茂明安联合旗'];town[341] = [null,1930,'海勃湾区'];town[342] = [null,1930,'海南区'];town[343] = [null,1930,'乌达区'];town[344] = [null,1940,'红山区'];town[345] = [null,1940,'元宝山区'];town[346] = [null,1940,'松山区'];town[347] = [null,1940,'阿鲁科尔沁旗'];town[348] = [null,1940,'巴林左旗'];town[349] = [null,1940,'巴林右旗'];town[350] = [null,1940,'林西县'];town[351] = [null,1940,'克什克腾旗'];town[352] = [null,1940,'翁牛特旗'];town[353] = [null,1940,'喀喇沁旗'];town[354] = [null,1940,'宁城县'];town[355] = [null,1940,'敖汉旗'];town[356] = [null,1990,'科尔沁区'];town[357] = [null,1990,'科尔沁左翼中旗'];town[358] = [null,1990,'科尔沁左翼后旗'];town[359] = [null,1990,'开鲁县'];town[360] = [null,1990,'库伦旗'];town[361] = [null,1990,'奈曼旗'];town[362] = [null,1990,'扎鲁特旗'];town[363] = [null,1990,'霍林郭勒市'];town[364] = [null,2050,'东胜区'];town[365] = [null,2050,'达拉特旗'];town[366] = [null,2050,'准格尔旗'];town[367] = [null,2050,'鄂托克前旗'];town[368] = [null,2050,'鄂托克旗'];town[369] = [null,2050,'杭锦旗'];town[370] = [null,2050,'乌审旗'];town[371] = [null,2050,'伊金霍洛旗'];town[372] = [null,1960,'海拉尔区'];town[373] = [null,1960,'扎赉诺尔区'];town[374] = [null,1960,'阿荣旗'];town[375] = [null,1960,'莫力达瓦达斡尔族自治旗'];town[376] = [null,1960,'鄂伦春自治旗'];town[377] = [null,1960,'鄂温克族自治旗'];town[378] = [null,1960,'陈巴尔虎旗'];town[379] = [null,1960,'新巴尔虎左旗'];town[380] = [null,1960,'新巴尔虎右旗'];town[381] = [null,1960,'满洲里市'];town[382] = [null,1960,'牙克石市'];town[383] = [null,1960,'扎兰屯市'];town[384] = [null,1960,'额尔古纳市'];town[385] = [null,1960,'根河市'];town[386] = [null,2070,'临河区'];town[387] = [null,2070,'五原县'];town[388] = [null,2070,'磴口县'];town[389] = [null,2070,'乌拉特前旗'];town[390] = [null,2070,'乌拉特中旗'];town[391] = [null,2070,'乌拉特后旗'];town[392] = [null,2070,'杭锦后旗'];town[393] = [null,2030,'集宁区'];town[394] = [null,2030,'卓资县'];town[395] = [null,2030,'化德县'];town[396] = [null,2030,'商都县'];town[397] = [null,2030,'兴和县'];town[398] = [null,2030,'凉城县'];town[399] = [null,2030,'察哈尔右翼前旗'];town[400] = [null,2030,'察哈尔右翼中旗'];town[401] = [null,2030,'察哈尔右翼后旗'];town[402] = [null,2030,'四子王旗'];town[403] = [null,2030,'丰镇市'];town[404] = [null,1980,'乌兰浩特市'];town[405] = [null,1980,'阿尔山市'];town[406] = [null,1980,'科尔沁右翼前旗'];town[407] = [null,1980,'科尔沁右翼中旗'];town[408] = [null,1980,'扎赉特旗'];town[409] = [null,1980,'突泉县'];town[410] = [null,2010,'二连浩特市'];town[411] = [null,2010,'锡林浩特市'];town[412] = [null,2010,'阿巴嘎旗'];town[413] = [null,2010,'苏尼特左旗'];town[414] = [null,2010,'苏尼特右旗'];town[415] = [null,2010,'东乌珠穆沁旗'];town[416] = [null,2010,'西乌珠穆沁旗'];town[417] = [null,2010,'太仆寺旗'];town[418] = [null,2010,'镶黄旗'];town[419] = [null,2010,'正镶白旗'];town[420] = [null,2010,'正蓝旗'];town[421] = [null,2010,'多伦县'];town[422] = [null,2080,'阿拉善左旗'];town[423] = [null,2080,'阿拉善右旗'];town[424] = [null,2080,'额济纳旗'];town[425] = [null,2210,'和平区'];town[426] = [null,2210,'沈河区'];town[427] = [null,2210,'大东区'];town[428] = [null,2210,'皇姑区'];town[429] = [null,2210,'铁西区'];town[430] = [null,2210,'苏家屯区'];town[431] = [null,2210,'东陵区'];town[432] = [null,2210,'沈北新区'];town[433] = [null,2210,'于洪区'];town[434] = [null,2210,'辽中县'];town[435] = [null,2210,'康平县'];town[436] = [null,2210,'法库县'];town[437] = [null,2210,'新民市'];town[438] = [null,2220,'中山区'];town[439] = [null,2220,'西岗区'];town[440] = [null,2220,'沙河口区'];town[441] = [null,2220,'甘井子区'];town[442] = [null,2220,'旅顺口区'];town[443] = [null,2220,'金州区'];town[444] = [null,2220,'长海县'];town[445] = [null,2220,'瓦房店市'];town[446] = [null,2220,'普兰店市'];town[447] = [null,2220,'庄河市'];town[448] = [null,2230,'铁东区'];town[449] = [null,2230,'铁西区'];town[450] = [null,2230,'立山区'];town[451] = [null,2230,'千山区'];town[452] = [null,2230,'台安县'];town[453] = [null,2230,'岫岩满族自治县'];town[454] = [null,2230,'海城市'];town[455] = [null,2240,'新抚区'];town[456] = [null,2240,'东洲区'];town[457] = [null,2240,'望花区'];town[458] = [null,2240,'顺城区'];town[459] = [null,2240,'抚顺县'];town[460] = [null,2240,'新宾满族自治县'];town[461] = [null,2240,'清原满族自治县'];town[462] = [null,2250,'平山区'];town[463] = [null,2250,'溪湖区'];town[464] = [null,2250,'明山区'];town[465] = [null,2250,'南芬区'];town[466] = [null,2250,'本溪满族自治县'];town[467] = [null,2250,'桓仁满族自治县'];town[468] = [null,2260,'元宝区'];town[469] = [null,2260,'振兴区'];town[470] = [null,2260,'振安区'];town[471] = [null,2260,'宽甸满族自治县'];town[472] = [null,2260,'东港市'];town[473] = [null,2260,'凤城市'];town[474] = [null,2270,'古塔区'];town[475] = [null,2270,'凌河区'];town[476] = [null,2270,'太和区'];town[477] = [null,2270,'黑山县'];town[478] = [null,2270,'义县'];town[479] = [null,2270,'凌海市'];town[480] = [null,2270,'北镇市'];town[481] = [null,2280,'站前区'];town[482] = [null,2280,'西市区'];town[483] = [null,2280,'鲅鱼圈区'];town[484] = [null,2280,'老边区'];town[485] = [null,2280,'盖州市'];town[486] = [null,2280,'大石桥市'];town[487] = [null,2290,'海州区'];town[488] = [null,2290,'新邱区'];town[489] = [null,2290,'太平区'];town[490] = [null,2290,'清河门区'];town[491] = [null,2290,'细河区'];town[492] = [null,2290,'阜新蒙古族自治县'];town[493] = [null,2290,'彰武县'];town[494] = [null,2310,'白塔区'];town[495] = [null,2310,'文圣区'];town[496] = [null,2310,'宏伟区'];town[497] = [null,2310,'弓长岭区'];town[498] = [null,2310,'太子河区'];town[499] = [null,2310,'辽阳县'];town[500] = [null,2310,'灯塔市'];town[501] = [null,2320,'双台子区'];town[502] = [null,2320,'兴隆台区'];town[503] = [null,2320,'大洼县'];town[504] = [null,2320,'盘山县'];town[505] = [null,2330,'银州区'];town[506] = [null,2330,'清河区'];town[507] = [null,2330,'铁岭县'];town[508] = [null,2330,'西丰县'];town[509] = [null,2330,'昌图县'];town[510] = [null,2330,'调兵山市'];town[511] = [null,2330,'开原市'];town[512] = [null,2340,'双塔区'];town[513] = [null,2340,'龙城区'];town[514] = [null,2340,'朝阳县'];town[515] = [null,2340,'建平县'];town[516] = [null,2340,'喀喇沁左翼蒙古族自治县'];town[517] = [null,2340,'北票市'];town[518] = [null,2340,'凌源市'];town[519] = [null,2276,'连山区'];town[520] = [null,2276,'龙港区'];town[521] = [null,2276,'南票区'];town[522] = [null,2276,'绥中县'];town[523] = [null,2276,'建昌县'];town[524] = [null,2276,'兴城市'];town[525] = [null,2410,'南关区'];town[526] = [null,2410,'宽城区'];town[527] = [null,2410,'朝阳区'];town[528] = [null,2410,'二道区'];town[529] = [null,2410,'绿园区'];town[530] = [null,2410,'双阳区'];town[531] = [null,2410,'农安县'];town[532] = [null,2410,'九台市'];town[533] = [null,2410,'榆树市'];town[534] = [null,2410,'德惠市'];town[535] = [null,2420,'昌邑区'];town[536] = [null,2420,'龙潭区'];town[537] = [null,2420,'龙潭区'];town[538] = [null,2420,'丰满区'];town[539] = [null,2420,'永吉县'];town[540] = [null,2420,'蛟河市'];town[541] = [null,2420,'桦甸市'];town[542] = [null,2420,'舒兰市'];town[543] = [null,2420,'磐石市'];town[544] = [null,2430,'铁西区'];town[545] = [null,2430,'铁东区'];town[546] = [null,2430,'梨树县'];town[547] = [null,2430,'伊通满族自治县'];town[548] = [null,2430,'公主岭市'];town[549] = [null,2430,'双辽市'];town[550] = [null,2440,'龙山区'];town[551] = [null,2440,'西安区'];town[552] = [null,2440,'东丰县'];town[553] = [null,2440,'东辽县'];town[554] = [null,2450,'东昌区'];town[555] = [null,2450,'二道江区'];town[556] = [null,2450,'通化县'];town[557] = [null,2450,'辉南县'];town[558] = [null,2450,'柳河县'];town[559] = [null,2450,'梅河口市'];town[560] = [null,2450,'集安市'];town[561] = [null,2460,'浑江区'];town[562] = [null,2460,'江源区'];town[563] = [null,2460,'抚松县'];town[564] = [null,2460,'靖宇县'];town[565] = [null,2460,'长白朝鲜族自治县'];town[566] = [null,2460,'临江市'];town[567] = [null,2520,'宁江区'];town[568] = [null,2520,'前郭尔罗斯蒙古族自治县'];town[569] = [null,2520,'长岭县'];town[570] = [null,2520,'乾安县'];town[571] = [null,2520,'扶余市'];town[572] = [null,2470,'洮北区'];town[573] = [null,2470,'镇赉县'];town[574] = [null,2470,'通榆县'];town[575] = [null,2470,'洮南市'];town[576] = [null,2470,'大安市'];town[577] = [null,2610,'道里区'];town[578] = [null,2610,'南岗区'];town[579] = [null,2610,'道外区'];town[580] = [null,2610,'平房区'];town[581] = [null,2610,'松北区'];town[582] = [null,2610,'香坊区'];town[583] = [null,2610,'呼兰区'];town[584] = [null,2610,'阿城区'];town[585] = [null,2610,'依兰县'];town[586] = [null,2610,'方正县'];town[587] = [null,2610,'宾县'];town[588] = [null,2610,'巴彦县'];town[589] = [null,2610,'木兰县'];town[590] = [null,2610,'通河县'];town[591] = [null,2610,'延寿县'];town[592] = [null,2610,'双城市'];town[593] = [null,2610,'尚志市'];town[594] = [null,2610,'五常市'];town[595] = [null,2640,'龙沙区'];town[596] = [null,2640,'建华区'];town[597] = [null,2640,'铁锋区'];town[598] = [null,2640,'昂昂溪区'];town[599] = [null,2640,'富拉尔基区'];town[600] = [null,2640,'碾子山区'];town[601] = [null,2640,'梅里斯达斡尔族区'];town[602] = [null,2640,'龙江县'];town[603] = [null,2640,'依安县'];town[604] = [null,2640,'泰来县'];town[605] = [null,2640,'甘南县'];town[606] = [null,2640,'富裕县'];town[607] = [null,2640,'克山县'];town[608] = [null,2640,'克东县'];town[609] = [null,2640,'拜泉县'];town[610] = [null,2640,'讷河市'];town[611] = [null,2660,'鸡冠区'];town[612] = [null,2660,'恒山区'];town[613] = [null,2660,'滴道区'];town[614] = [null,2660,'梨树区'];town[615] = [null,2660,'城子河区'];town[616] = [null,2660,'麻山区'];town[617] = [null,2660,'鸡东县'];town[618] = [null,2660,'虎林市'];town[619] = [null,2660,'密山市'];town[620] = [null,2670,'向阳区'];town[621] = [null,2670,'工农区'];town[622] = [null,2670,'南山区'];town[623] = [null,2670,'兴安区'];town[624] = [null,2670,'东山区'];town[625] = [null,2670,'兴山区'];town[626] = [null,2670,'萝北县'];town[627] = [null,2670,'绥滨县'];town[628] = [null,2680,'尖山区'];town[629] = [null,2680,'岭东区'];town[630] = [null,2680,'四方台区'];town[631] = [null,2680,'宝山区'];town[632] = [null,2680,'集贤县'];town[633] = [null,2680,'友谊县'];town[634] = [null,2680,'宝清县'];town[635] = [null,2680,'饶河县'];town[636] = [null,2650,'萨尔图区'];town[637] = [null,2650,'龙凤区'];town[638] = [null,2650,'让胡路区'];town[639] = [null,2650,'红岗区'];town[640] = [null,2650,'大同区'];town[641] = [null,2650,'肇州县'];town[642] = [null,2650,'肇源县'];town[643] = [null,2650,'林甸县'];town[644] = [null,2650,'杜尔伯特蒙古族自治县'];town[645] = [null,2710,'伊春区'];town[646] = [null,2710,'南岔区'];town[647] = [null,2710,'友好区'];town[648] = [null,2710,'西林区'];town[649] = [null,2710,'翠峦区'];town[650] = [null,2710,'新青区'];town[651] = [null,2710,'美溪区'];town[652] = [null,2710,'金山屯区'];town[653] = [null,2710,'五营区'];town[654] = [null,2710,'乌马河区'];town[655] = [null,2710,'汤旺河区'];town[656] = [null,2710,'带岭区'];town[657] = [null,2710,'乌伊岭区'];town[658] = [null,2710,'红星区'];town[659] = [null,2710,'上甘岭区'];town[660] = [null,2710,'嘉荫县'];town[661] = [null,2710,'铁力市'];town[662] = [null,2690,'向阳区'];town[663] = [null,2690,'前进区'];town[664] = [null,2690,'东风区'];town[665] = [null,2690,'郊区'];town[666] = [null,2690,'桦南县'];town[667] = [null,2690,'桦川县'];town[668] = [null,2690,'汤原县'];town[669] = [null,2690,'抚远县'];town[670] = [null,2690,'同江市'];town[671] = [null,2690,'富锦市'];town[672] = [null,2740,'新兴区'];town[673] = [null,2740,'桃山区'];town[674] = [null,2740,'茄子河区'];town[675] = [null,2740,'勃利县'];town[676] = [null,2720,'东安区'];town[677] = [null,2720,'阳明区'];town[678] = [null,2720,'爱民区'];town[679] = [null,2720,'西安区'];town[680] = [null,2720,'东宁县'];town[681] = [null,2720,'林口县'];town[682] = [null,2720,'绥芬河市'];town[683] = [null,2720,'海林市'];town[684] = [null,2720,'宁安市'];town[685] = [null,2720,'穆棱市'];town[686] = [null,2780,'爱辉区'];town[687] = [null,2780,'嫩江县'];town[688] = [null,2780,'逊克县'];town[689] = [null,2780,'孙吴县'];town[690] = [null,2780,'北安市'];town[691] = [null,2780,'五大连池市'];town[692] = [null,2760,'北林区'];town[693] = [null,2760,'望奎县'];town[694] = [null,2760,'兰西县'];town[695] = [null,2760,'青冈县'];town[696] = [null,2760,'庆安县'];town[697] = [null,2760,'明水县'];town[698] = [null,2760,'绥棱县'];town[699] = [null,2760,'安达市'];town[700] = [null,2760,'肇东市'];town[701] = [null,2760,'海伦市'];town[702] = [null,2790,'呼玛县'];town[703] = [null,2790,'塔河县'];town[704] = [null,2790,'漠河县'];town[705] = [null,2900,'黄浦区'];town[706] = [null,2900,'徐汇区'];town[707] = [null,2900,'长宁区'];town[708] = [null,2900,'静安区'];town[709] = [null,2900,'普陀区'];town[710] = [null,2900,'闸北区'];town[711] = [null,2900,'虹口区'];town[712] = [null,2900,'杨浦区'];town[713] = [null,2900,'闵行区'];town[714] = [null,2900,'宝山区'];town[715] = [null,2900,'嘉定区'];town[716] = [null,2900,'浦东新区'];town[717] = [null,2900,'金山区'];town[718] = [null,2900,'松江区'];town[719] = [null,2900,'青浦区'];town[720] = [null,2900,'奉贤区'];town[721] = [null,2900,'崇明县'];town[722] = [null,3010,'玄武区'];town[723] = [null,3010,'秦淮区'];town[724] = [null,3010,'建邺区'];town[725] = [null,3010,'鼓楼区'];town[726] = [null,3010,'浦口区'];town[727] = [null,3010,'栖霞区'];town[728] = [null,3010,'雨花台区'];town[729] = [null,3010,'江宁区'];town[730] = [null,3010,'六合区'];town[731] = [null,3010,'溧水区'];town[732] = [null,3010,'高淳区'];town[733] = [null,3020,'崇安区'];town[734] = [null,3020,'南长区'];town[735] = [null,3020,'北塘区'];town[736] = [null,3020,'锡山区'];town[737] = [null,3020,'惠山区'];town[738] = [null,3020,'滨湖区'];town[739] = [null,3020,'江阴市'];town[740] = [null,3020,'宜兴市'];town[741] = [null,3030,'鼓楼区'];town[742] = [null,3030,'云龙区'];town[743] = [null,3030,'贾汪区'];town[744] = [null,3030,'泉山区'];town[745] = [null,3030,'铜山区'];town[746] = [null,3030,'丰县'];town[747] = [null,3030,'沛县'];town[748] = [null,3030,'睢宁县'];town[749] = [null,3030,'新沂市'];town[750] = [null,3030,'邳州市'];town[751] = [null,3040,'天宁区'];town[752] = [null,3040,'钟楼区'];town[753] = [null,3040,'戚墅堰区'];town[754] = [null,3040,'新北区'];town[755] = [null,3040,'武进区'];town[756] = [null,3040,'溧阳市'];town[757] = [null,3040,'金坛市'];town[758] = [null,3050,'虎丘区'];town[759] = [null,3050,'吴中区'];town[760] = [null,3050,'相城区'];town[761] = [null,3050,'姑苏区'];town[762] = [null,3050,'吴江区'];town[763] = [null,3050,'常熟市'];town[764] = [null,3050,'张家港市'];town[765] = [null,3050,'昆山市'];town[766] = [null,3050,'太仓市'];town[767] = [null,3060,'崇川区'];town[768] = [null,3060,'港闸区'];town[769] = [null,3060,'通州区'];town[770] = [null,3060,'海安县'];town[771] = [null,3060,'如东县'];town[772] = [null,3060,'启东市'];town[773] = [null,3060,'如皋市'];town[774] = [null,3060,'海门市'];town[775] = [null,3070,'连云区'];town[776] = [null,3070,'新浦区'];town[777] = [null,3070,'海州区'];town[778] = [null,3070,'赣榆县'];town[779] = [null,3070,'东海县'];town[780] = [null,3070,'灌云县'];town[781] = [null,3070,'灌南县'];town[782] = [null,3080,'清河区'];town[783] = [null,3080,'淮安区'];town[784] = [null,3080,'淮阴区'];town[785] = [null,3080,'清浦区'];town[786] = [null,3080,'涟水县'];town[787] = [null,3080,'洪泽县'];town[788] = [null,3080,'盱眙县'];town[789] = [null,3080,'金湖县'];town[790] = [null,3110,'亭湖区'];town[791] = [null,3110,'盐都区'];town[792] = [null,3110,'响水县'];town[793] = [null,3110,'滨海县'];town[794] = [null,3110,'阜宁县'];town[795] = [null,3110,'射阳县'];town[796] = [null,3110,'建湖县'];town[797] = [null,3110,'东台市'];town[798] = [null,3110,'大丰市'];town[799] = [null,3120,'广陵区'];town[800] = [null,3120,'邗江区'];town[801] = [null,3120,'江都区'];town[802] = [null,3120,'宝应县'];town[803] = [null,3120,'仪征市'];town[804] = [null,3120,'高邮市'];town[805] = [null,3140,'京口区'];town[806] = [null,3140,'润州区'];town[807] = [null,3140,'丹徒区'];town[808] = [null,3140,'丹阳市'];town[809] = [null,3140,'扬中市'];town[810] = [null,3140,'句容市'];town[811] = [null,3128,'海陵区'];town[812] = [null,3128,'高港区'];town[813] = [null,3128,'姜堰区'];town[814] = [null,3128,'兴化市'];town[815] = [null,3128,'靖江市'];town[816] = [null,3128,'泰兴市'];town[817] = [null,3090,'宿城区'];town[818] = [null,3090,'宿豫区'];town[819] = [null,3090,'沭阳县'];town[820] = [null,3090,'泗阳县'];town[821] = [null,3090,'泗洪县'];town[822] = [null,3310,'上城区'];town[823] = [null,3310,'下城区'];town[824] = [null,3310,'江干区'];town[825] = [null,3310,'拱墅区'];town[826] = [null,3310,'西湖区'];town[827] = [null,3310,'滨江区'];town[828] = [null,3310,'萧山区'];town[829] = [null,3310,'余杭区'];town[830] = [null,3310,'桐庐县'];town[831] = [null,3310,'淳安县'];town[832] = [null,3310,'建德市'];town[833] = [null,3310,'富阳市'];town[834] = [null,3310,'临安市'];town[835] = [null,3320,'海曙区'];town[836] = [null,3320,'江东区'];town[837] = [null,3320,'江北区'];town[838] = [null,3320,'北仑区'];town[839] = [null,3320,'镇海区'];town[840] = [null,3320,'鄞州区'];town[841] = [null,3320,'象山县'];town[842] = [null,3320,'宁海县'];town[843] = [null,3320,'余姚市'];town[844] = [null,3320,'慈溪市'];town[845] = [null,3320,'奉化市'];town[846] = [null,3330,'鹿城区'];town[847] = [null,3330,'龙湾区'];town[848] = [null,3330,'瓯海区'];town[849] = [null,3330,'洞头县'];town[850] = [null,3330,'永嘉县'];town[851] = [null,3330,'平阳县'];town[852] = [null,3330,'苍南县'];town[853] = [null,3330,'文成县'];town[854] = [null,3330,'泰顺县'];town[855] = [null,3330,'瑞安市'];town[856] = [null,3330,'乐清市'];town[857] = [null,3350,'南湖区'];town[858] = [null,3350,'秀洲区'];town[859] = [null,3350,'嘉善县'];town[860] = [null,3350,'海盐县'];town[861] = [null,3350,'海宁市'];town[862] = [null,3350,'平湖市'];town[863] = [null,3350,'桐乡市'];town[864] = [null,3360,'吴兴区'];town[865] = [null,3360,'南浔区'];town[866] = [null,3360,'德清县'];town[867] = [null,3360,'长兴县'];town[868] = [null,3360,'安吉县'];town[869] = [null,3370,'越城区'];town[870] = [null,3370,'绍兴县'];town[871] = [null,3370,'新昌县'];town[872] = [null,3370,'诸暨市'];town[873] = [null,3370,'上虞市'];town[874] = [null,3370,'嵊州市'];town[875] = [null,3380,'婺城区'];town[876] = [null,3380,'金东区'];town[877] = [null,3380,'武义县'];town[878] = [null,3380,'浦江县'];town[879] = [null,3380,'磐安县'];town[880] = [null,3380,'兰溪市'];town[881] = [null,3380,'义乌市'];town[882] = [null,3380,'东阳市'];town[883] = [null,3380,'永康市'];town[884] = [null,3410,'柯城区'];town[885] = [null,3410,'衢江区'];town[886] = [null,3410,'常山县'];town[887] = [null,3410,'开化县'];town[888] = [null,3410,'龙游县'];town[889] = [null,3410,'江山市'];town[890] = [null,3420,'定海区'];town[891] = [null,3420,'普陀区'];town[892] = [null,3420,'岱山县'];town[893] = [null,3420,'嵊泗县'];town[894] = [null,3450,'椒江区'];town[895] = [null,3450,'黄岩区'];town[896] = [null,3450,'路桥区'];town[897] = [null,3450,'玉环县'];town[898] = [null,3450,'三门县'];town[899] = [null,3450,'天台县'];town[900] = [null,3450,'仙居县'];town[901] = [null,3450,'温岭市'];town[902] = [null,3450,'临海市'];town[903] = [null,3430,'莲都区'];town[904] = [null,3430,'青田县'];town[905] = [null,3430,'缙云县'];town[906] = [null,3430,'遂昌县'];town[907] = [null,3430,'松阳县'];town[908] = [null,3430,'云和县'];town[909] = [null,3430,'庆元县'];town[910] = [null,3430,'景宁畲族自治县'];town[911] = [null,3430,'龙泉市'];town[912] = [null,3610,'瑶海区'];town[913] = [null,3610,'庐阳区'];town[914] = [null,3610,'蜀山区'];town[915] = [null,3610,'包河区'];town[916] = [null,3610,'长丰县'];town[917] = [null,3610,'肥东县'];town[918] = [null,3610,'肥西县'];town[919] = [null,3610,'庐江县'];town[920] = [null,3610,'巢湖市'];town[921] = [null,3620,'镜湖区'];town[922] = [null,3620,'弋江区'];town[923] = [null,3620,'鸠江区'];town[924] = [null,3620,'三山区'];town[925] = [null,3620,'芜湖县'];town[926] = [null,3620,'繁昌县'];town[927] = [null,3620,'南陵县'];town[928] = [null,3620,'无为县'];town[929] = [null,3630,'龙子湖区'];town[930] = [null,3630,'蚌山区'];town[931] = [null,3630,'禹会区'];town[932] = [null,3630,'淮上区'];town[933] = [null,3630,'怀远县'];town[934] = [null,3630,'五河县'];town[935] = [null,3630,'固镇县'];town[936] = [null,3640,'大通区'];town[937] = [null,3640,'田家庵区'];town[938] = [null,3640,'谢家集区'];town[939] = [null,3640,'八公山区'];town[940] = [null,3640,'潘集区'];town[941] = [null,3640,'凤台县'];town[942] = [null,3650,'花山区'];town[943] = [null,3650,'雨山区'];town[944] = [null,3650,'博望区'];town[945] = [null,3650,'当涂县'];town[946] = [null,3650,'含山县'];town[947] = [null,3650,'和县'];town[948] = [null,3660,'杜集区'];town[949] = [null,3660,'相山区'];town[950] = [null,3660,'烈山区'];town[951] = [null,3660,'濉溪县'];town[952] = [null,3670,'铜官山区'];town[953] = [null,3670,'狮子山区'];town[954] = [null,3670,'郊区'];town[955] = [null,3670,'铜陵县'];town[956] = [null,3680,'迎江区'];town[957] = [null,3680,'大观区'];town[958] = [null,3680,'宜秀区'];town[959] = [null,3680,'怀宁县'];town[960] = [null,3680,'枞阳县'];town[961] = [null,3680,'潜山县'];town[962] = [null,3680,'太湖县'];town[963] = [null,3680,'宿松县'];town[964] = [null,3680,'望江县'];town[965] = [null,3680,'岳西县'];town[966] = [null,3680,'桐城市'];town[967] = [null,3710,'屯溪区'];town[968] = [null,3710,'黄山区'];town[969] = [null,3710,'徽州区'];town[970] = [null,3710,'歙县'];town[971] = [null,3710,'休宁县'];town[972] = [null,3710,'黟县'];town[973] = [null,3710,'祁门县'];town[974] = [null,3750,'琅琊区'];town[975] = [null,3750,'南谯区'];town[976] = [null,3750,'来安县'];town[977] = [null,3750,'全椒县'];town[978] = [null,3750,'定远县'];town[979] = [null,3750,'凤阳县'];town[980] = [null,3750,'天长市'];town[981] = [null,3750,'明光市'];town[982] = [null,3720,'颍州区'];town[983] = [null,3720,'颍东区'];town[984] = [null,3720,'颍泉区'];town[985] = [null,3720,'临泉县'];town[986] = [null,3720,'太和县'];town[987] = [null,3720,'阜南县'];town[988] = [null,3720,'颍上县'];town[989] = [null,3720,'界首市'];town[990] = [null,3740,'埇桥区'];town[991] = [null,3740,'砀山县'];town[992] = [null,3740,'萧县'];town[993] = [null,3740,'灵璧县'];town[994] = [null,3740,'泗县'];town[995] = [null,3760,'金安区'];town[996] = [null,3760,'裕安区'];town[997] = [null,3760,'寿县'];town[998] = [null,3760,'霍邱县'];town[999] = [null,3760,'舒城县'];town[1000] = [null,3760,'金寨县'];town[1001] = [null,3760,'霍山县'];town[1002] = [null,3722,'谯城区'];town[1003] = [null,3722,'涡阳县'];town[1004] = [null,3722,'蒙城县'];town[1005] = [null,3722,'利辛县'];town[1006] = [null,3790,'贵池区'];town[1007] = [null,3790,'东至县'];town[1008] = [null,3790,'石台县'];town[1009] = [null,3790,'青阳县'];town[1010] = [null,3771,'宣州区'];town[1011] = [null,3771,'郎溪县'];town[1012] = [null,3771,'广德县'];town[1013] = [null,3771,'泾县'];town[1014] = [null,3771,'绩溪县'];town[1015] = [null,3771,'旌德县'];town[1016] = [null,3771,'宁国市'];town[1017] = [null,3910,'鼓楼区'];town[1018] = [null,3910,'台江区'];town[1019] = [null,3910,'仓山区'];town[1020] = [null,3910,'马尾区'];town[1021] = [null,3910,'晋安区'];town[1022] = [null,3910,'闽侯县'];town[1023] = [null,3910,'连江县'];town[1024] = [null,3910,'罗源县'];town[1025] = [null,3910,'闽清县'];town[1026] = [null,3910,'永泰县'];town[1027] = [null,3910,'平潭县'];town[1028] = [null,3910,'福清市'];town[1029] = [null,3910,'长乐市'];town[1030] = [null,3930,'思明区'];town[1031] = [null,3930,'海沧区'];town[1032] = [null,3930,'湖里区'];town[1033] = [null,3930,'集美区'];town[1034] = [null,3930,'同安区'];town[1035] = [null,3930,'翔安区'];town[1036] = [null,3940,'城厢区'];town[1037] = [null,3940,'涵江区'];town[1038] = [null,3940,'荔城区'];town[1039] = [null,3940,'秀屿区'];town[1040] = [null,3940,'仙游县'];town[1041] = [null,3950,'梅列区'];town[1042] = [null,3950,'三元区'];town[1043] = [null,3950,'明溪县'];town[1044] = [null,3950,'清流县'];town[1045] = [null,3950,'宁化县'];town[1046] = [null,3950,'大田县'];town[1047] = [null,3950,'尤溪县'];town[1048] = [null,3950,'沙县'];town[1049] = [null,3950,'将乐县'];town[1050] = [null,3950,'泰宁县'];town[1051] = [null,3950,'建宁县'];town[1052] = [null,3950,'永安市'];town[1053] = [null,3970,'鲤城区'];town[1054] = [null,3970,'丰泽区'];town[1055] = [null,3970,'洛江区'];town[1056] = [null,3970,'泉港区'];town[1057] = [null,3970,'惠安县'];town[1058] = [null,3970,'安溪县'];town[1059] = [null,3970,'永春县'];town[1060] = [null,3970,'德化县'];town[1061] = [null,3970,'金门县'];town[1062] = [null,3970,'石狮市'];town[1063] = [null,3970,'晋江市'];town[1064] = [null,3970,'南安市'];town[1065] = [null,3990,'芗城区'];town[1066] = [null,3990,'龙文区'];town[1067] = [null,3990,'云霄县'];town[1068] = [null,3990,'漳浦县'];town[1069] = [null,3990,'诏安县'];town[1070] = [null,3990,'长泰县'];town[1071] = [null,3990,'东山县'];town[1072] = [null,3990,'南靖县'];town[1073] = [null,3990,'平和县'];town[1074] = [null,3990,'华安县'];town[1075] = [null,3990,'龙海市'];town[1076] = [null,4010,'延平区'];town[1077] = [null,4010,'顺昌县'];town[1078] = [null,4010,'浦城县'];town[1079] = [null,4010,'光泽县'];town[1080] = [null,4010,'松溪县'];town[1081] = [null,4010,'政和县'];town[1082] = [null,4010,'邵武市'];town[1083] = [null,4010,'武夷山市'];town[1084] = [null,4010,'建瓯市'];town[1085] = [null,4010,'建阳市'];town[1086] = [null,4050,'新罗区'];town[1087] = [null,4050,'长汀县'];town[1088] = [null,4050,'永定县'];town[1089] = [null,4050,'上杭县'];town[1090] = [null,4050,'武平县'];town[1091] = [null,4050,'连城县'];town[1092] = [null,4050,'漳平市'];town[1093] = [null,4030,'蕉城区'];town[1094] = [null,4030,'霞浦县'];town[1095] = [null,4030,'古田县'];town[1096] = [null,4030,'屏南县'];town[1097] = [null,4030,'寿宁县'];town[1098] = [null,4030,'周宁县'];town[1099] = [null,4030,'柘荣县'];town[1100] = [null,4030,'福安市'];town[1101] = [null,4030,'福鼎市'];town[1102] = [null,4210,'东湖区'];town[1103] = [null,4210,'西湖区'];town[1104] = [null,4210,'青云谱区'];town[1105] = [null,4210,'湾里区'];town[1106] = [null,4210,'青山湖区'];town[1107] = [null,4210,'南昌县'];town[1108] = [null,4210,'新建县'];town[1109] = [null,4210,'安义县'];town[1110] = [null,4210,'进贤县'];town[1111] = [null,4220,'昌江区'];town[1112] = [null,4220,'珠山区'];town[1113] = [null,4220,'浮梁县'];town[1114] = [null,4220,'乐平市'];town[1115] = [null,4230,'安源区'];town[1116] = [null,4230,'湘东区'];town[1117] = [null,4230,'莲花县'];town[1118] = [null,4230,'上栗县'];town[1119] = [null,4230,'芦溪县'];town[1120] = [null,4240,'庐山区'];town[1121] = [null,4240,'浔阳区'];town[1122] = [null,4240,'九江县'];town[1123] = [null,4240,'武宁县'];town[1124] = [null,4240,'修水县'];town[1125] = [null,4240,'永修县'];town[1126] = [null,4240,'德安县'];town[1127] = [null,4240,'星子县'];town[1128] = [null,4240,'都昌县'];town[1129] = [null,4240,'湖口县'];town[1130] = [null,4240,'彭泽县'];town[1131] = [null,4240,'瑞昌市'];town[1132] = [null,4240,'共青城市'];town[1133] = [null,4260,'渝水区'];town[1134] = [null,4260,'分宜县'];town[1135] = [null,4280,'章贡区'];town[1136] = [null,4280,'赣县'];town[1137] = [null,4280,'信丰县'];town[1138] = [null,4280,'大余县'];town[1139] = [null,4280,'上犹县'];town[1140] = [null,4280,'崇义县'];town[1141] = [null,4280,'安远县'];town[1142] = [null,4280,'龙南县'];town[1143] = [null,4280,'定南县'];town[1144] = [null,4280,'全南县'];town[1145] = [null,4280,'宁都县'];town[1146] = [null,4280,'于都县'];town[1147] = [null,4280,'兴国县'];town[1148] = [null,4280,'会昌县'];town[1149] = [null,4280,'寻乌县'];town[1150] = [null,4280,'石城县'];town[1151] = [null,4280,'瑞金市'];town[1152] = [null,4280,'南康市'];town[1153] = [null,4350,'吉州区'];town[1154] = [null,4350,'青原区'];town[1155] = [null,4350,'吉安县'];town[1156] = [null,4350,'吉水县'];town[1157] = [null,4350,'峡江县'];town[1158] = [null,4350,'新干县'];town[1159] = [null,4350,'永丰县'];town[1160] = [null,4350,'泰和县'];town[1161] = [null,4350,'遂川县'];town[1162] = [null,4350,'万安县'];town[1163] = [null,4350,'安福县'];town[1164] = [null,4350,'永新县'];town[1165] = [null,4350,'井冈山市'];town[1166] = [null,4310,'袁州区'];town[1167] = [null,4310,'奉新县'];town[1168] = [null,4310,'万载县'];town[1169] = [null,4310,'上高县'];town[1170] = [null,4310,'宜丰县'];town[1171] = [null,4310,'靖安县'];town[1172] = [null,4310,'铜鼓县'];town[1173] = [null,4310,'丰城市'];town[1174] = [null,4310,'樟树市'];town[1175] = [null,4310,'高安市'];town[1176] = [null,4370,'临川区'];town[1177] = [null,4370,'南城县'];town[1178] = [null,4370,'黎川县'];town[1179] = [null,4370,'南丰县'];town[1180] = [null,4370,'崇仁县'];town[1181] = [null,4370,'乐安县'];town[1182] = [null,4370,'宜黄县'];town[1183] = [null,4370,'金溪县'];town[1184] = [null,4370,'资溪县'];town[1185] = [null,4370,'东乡县'];town[1186] = [null,4370,'广昌县'];town[1187] = [null,4330,'信州区'];town[1188] = [null,4330,'上饶县'];town[1189] = [null,4330,'广丰县'];town[1190] = [null,4330,'玉山县'];town[1191] = [null,4330,'铅山县'];town[1192] = [null,4330,'横峰县'];town[1193] = [null,4330,'弋阳县'];town[1194] = [null,4330,'余干县'];town[1195] = [null,4330,'鄱阳县'];town[1196] = [null,4330,'万年县'];town[1197] = [null,4330,'婺源县'];town[1198] = [null,4330,'德兴市'];town[1199] = [null,4510,'历下区'];town[1200] = [null,4510,'市中区'];town[1201] = [null,4510,'槐荫区'];town[1202] = [null,4510,'天桥区'];town[1203] = [null,4510,'历城区'];town[1204] = [null,4510,'长清区'];town[1205] = [null,4510,'平阴县'];town[1206] = [null,4510,'济阳县'];town[1207] = [null,4510,'商河县'];town[1208] = [null,4510,'章丘市'];town[1209] = [null,4520,'市南区'];town[1210] = [null,4520,'市北区'];town[1211] = [null,4520,'黄岛区'];town[1212] = [null,4520,'崂山区'];town[1213] = [null,4520,'李沧区'];town[1214] = [null,4520,'城阳区'];town[1215] = [null,4520,'胶州市'];town[1216] = [null,4520,'即墨市'];town[1217] = [null,4520,'平度市'];town[1218] = [null,4520,'莱西市'];town[1219] = [null,4530,'淄川区'];town[1220] = [null,4530,'张店区'];town[1221] = [null,4530,'博山区'];town[1222] = [null,4530,'临淄区'];town[1223] = [null,4530,'周村区'];town[1224] = [null,4530,'桓台县'];town[1225] = [null,4530,'高青县'];town[1226] = [null,4530,'沂源县'];town[1227] = [null,4540,'市中区'];town[1228] = [null,4540,'薛城区'];town[1229] = [null,4540,'峄城区'];town[1230] = [null,4540,'台儿庄区'];town[1231] = [null,4540,'山亭区'];town[1232] = [null,4540,'滕州市'];town[1233] = [null,4550,'东营区'];town[1234] = [null,4550,'河口区'];town[1235] = [null,4550,'垦利县'];town[1236] = [null,4550,'利津县'];town[1237] = [null,4550,'广饶县'];town[1238] = [null,4560,'芝罘区'];town[1239] = [null,4560,'福山区'];town[1240] = [null,4560,'牟平区'];town[1241] = [null,4560,'莱山区'];town[1242] = [null,4560,'长岛县'];town[1243] = [null,4560,'龙口市'];town[1244] = [null,4560,'莱阳市'];town[1245] = [null,4560,'莱州市'];town[1246] = [null,4560,'蓬莱市'];town[1247] = [null,4560,'招远市'];town[1248] = [null,4560,'栖霞市'];town[1249] = [null,4560,'海阳市'];town[1250] = [null,4580,'潍城区'];town[1251] = [null,4580,'寒亭区'];town[1252] = [null,4580,'坊子区'];town[1253] = [null,4580,'奎文区'];town[1254] = [null,4580,'临朐县'];town[1255] = [null,4580,'昌乐县'];town[1256] = [null,4580,'青州市'];town[1257] = [null,4580,'诸城市'];town[1258] = [null,4580,'寿光市'];town[1259] = [null,4580,'安丘市'];town[1260] = [null,4580,'高密市'];town[1261] = [null,4580,'昌邑市'];town[1262] = [null,4610,'市中区'];town[1263] = [null,4610,'任城区'];town[1264] = [null,4610,'微山县'];town[1265] = [null,4610,'鱼台县'];town[1266] = [null,4610,'金乡县'];town[1267] = [null,4610,'嘉祥县'];town[1268] = [null,4610,'汶上县'];town[1269] = [null,4610,'泗水县'];town[1270] = [null,4610,'梁山县'];town[1271] = [null,4610,'曲阜市'];town[1272] = [null,4610,'兖州市'];town[1273] = [null,4610,'邹城市'];town[1274] = [null,4630,'泰山区'];town[1275] = [null,4630,'岱岳区'];town[1276] = [null,4630,'宁阳县'];town[1277] = [null,4630,'东平县'];town[1278] = [null,4630,'新泰市'];town[1279] = [null,4630,'肥城市'];town[1280] = [null,4650,'环翠区'];town[1281] = [null,4650,'文登市'];town[1282] = [null,4650,'荣成市'];town[1283] = [null,4650,'乳山市'];town[1284] = [null,4732,'东港区'];town[1285] = [null,4732,'岚山区'];town[1286] = [null,4732,'五莲县'];town[1287] = [null,4732,'莒县'];town[1288] = [null,4634,'莱城区'];town[1289] = [null,4634,'钢城区'];town[1290] = [null,4730,'兰山区'];town[1291] = [null,4730,'罗庄区'];town[1292] = [null,4730,'河东区'];town[1293] = [null,4730,'沂南县'];town[1294] = [null,4730,'郯城县'];town[1295] = [null,4730,'沂水县'];town[1296] = [null,4730,'苍山县'];town[1297] = [null,4730,'费县'];town[1298] = [null,4730,'平邑县'];town[1299] = [null,4730,'莒南县'];town[1300] = [null,4730,'蒙阴县'];town[1301] = [null,4730,'临沭县'];town[1302] = [null,4680,'德城区'];town[1303] = [null,4680,'陵县'];town[1304] = [null,4680,'宁津县'];town[1305] = [null,4680,'庆云县'];town[1306] = [null,4680,'临邑县'];town[1307] = [null,4680,'齐河县'];town[1308] = [null,4680,'平原县'];town[1309] = [null,4680,'夏津县'];town[1310] = [null,4680,'武城县'];town[1311] = [null,4680,'乐陵市'];town[1312] = [null,4680,'禹城市'];town[1313] = [null,4710,'东昌府区'];town[1314] = [null,4710,'阳谷县'];town[1315] = [null,4710,'莘县'];town[1316] = [null,4710,'茌平县'];town[1317] = [null,4710,'东阿县'];town[1318] = [null,4710,'冠县'];town[1319] = [null,4710,'高唐县'];town[1320] = [null,4710,'临清市'];town[1321] = [null,4660,'滨城区'];town[1322] = [null,4660,'惠民县'];town[1323] = [null,4660,'阳信县'];town[1324] = [null,4660,'无棣县'];town[1325] = [null,4660,'沾化县'];town[1326] = [null,4660,'博兴县'];town[1327] = [null,4660,'邹平县'];town[1328] = [null,4750,'牡丹区'];town[1329] = [null,4750,'曹县'];town[1330] = [null,4750,'单县'];town[1331] = [null,4750,'成武县'];town[1332] = [null,4750,'巨野县'];town[1333] = [null,4750,'郓城县'];town[1334] = [null,4750,'鄄城县'];town[1335] = [null,4750,'定陶县'];town[1336] = [null,4750,'东明县'];town[1337] = [null,4910,'中原区'];town[1338] = [null,4910,'二七区'];town[1339] = [null,4910,'管城回族区'];town[1340] = [null,4910,'金水区'];town[1341] = [null,4910,'上街区'];town[1342] = [null,4910,'惠济区'];town[1343] = [null,4910,'中牟县'];town[1344] = [null,4910,'巩义市'];town[1345] = [null,4910,'荥阳市'];town[1346] = [null,4910,'新密市'];town[1347] = [null,4910,'新郑市'];town[1348] = [null,4910,'登封市'];town[1349] = [null,4920,'龙亭区'];town[1350] = [null,4920,'顺河回族区'];town[1351] = [null,4920,'鼓楼区'];town[1352] = [null,4920,'禹王台区'];town[1353] = [null,4920,'金明区'];town[1354] = [null,4920,'杞县'];town[1355] = [null,4920,'通许县'];town[1356] = [null,4920,'尉氏县'];town[1357] = [null,4920,'开封县'];town[1358] = [null,4920,'兰考县'];town[1359] = [null,4930,'老城区'];town[1360] = [null,4930,'西工区'];town[1361] = [null,4930,'瀍河回族区'];town[1362] = [null,4930,'涧西区'];town[1363] = [null,4930,'吉利区'];town[1364] = [null,4930,'洛龙区'];town[1365] = [null,4930,'孟津县'];town[1366] = [null,4930,'新安县'];town[1367] = [null,4930,'栾川县'];town[1368] = [null,4930,'嵩县'];town[1369] = [null,4930,'汝阳县'];town[1370] = [null,4930,'宜阳县'];town[1371] = [null,4930,'洛宁县'];town[1372] = [null,4930,'伊川县'];town[1373] = [null,4930,'偃师市'];town[1374] = [null,4950,'新华区'];town[1375] = [null,4950,'卫东区'];town[1376] = [null,4950,'石龙区'];town[1377] = [null,4950,'湛河区'];town[1378] = [null,4950,'宝丰县'];town[1379] = [null,4950,'叶县'];town[1380] = [null,4950,'鲁山县'];town[1381] = [null,4950,'郏县'];town[1382] = [null,4950,'舞钢市'];town[1383] = [null,4950,'汝州市'];town[1384] = [null,4960,'文峰区'];town[1385] = [null,4960,'北关区'];town[1386] = [null,4960,'殷都区'];town[1387] = [null,4960,'龙安区'];town[1388] = [null,4960,'安阳县'];town[1389] = [null,4960,'汤阴县'];town[1390] = [null,4960,'滑县'];town[1391] = [null,4960,'内黄县'];town[1392] = [null,4960,'林州市'];town[1393] = [null,4970,'鹤山区'];town[1394] = [null,4970,'山城区'];town[1395] = [null,4970,'淇滨区'];town[1396] = [null,4970,'浚县'];town[1397] = [null,4970,'淇县'];town[1398] = [null,4980,'红旗区'];town[1399] = [null,4980,'卫滨区'];town[1400] = [null,4980,'凤泉区'];town[1401] = [null,4980,'牧野区'];town[1402] = [null,4980,'新乡县'];town[1403] = [null,4980,'获嘉县'];town[1404] = [null,4980,'原阳县'];town[1405] = [null,4980,'延津县'];town[1406] = [null,4980,'封丘县'];town[1407] = [null,4980,'长垣县'];town[1408] = [null,4980,'卫辉市'];town[1409] = [null,4980,'辉县市'];town[1410] = [null,5010,'解放区'];town[1411] = [null,5010,'中站区'];town[1412] = [null,5010,'马村区'];town[1413] = [null,5010,'山阳区'];town[1414] = [null,5010,'修武县'];town[1415] = [null,5010,'博爱县'];town[1416] = [null,5010,'武陟县'];town[1417] = [null,5010,'温县'];town[1418] = [null,5010,'沁阳市'];town[1419] = [null,5010,'孟州市'];town[1420] = [null,5020,'华龙区'];town[1421] = [null,5020,'清丰县'];town[1422] = [null,5020,'南乐县'];town[1423] = [null,5020,'范县'];town[1424] = [null,5020,'台前县'];town[1425] = [null,5020,'濮阳县'];town[1426] = [null,5030,'魏都区'];town[1427] = [null,5030,'许昌县'];town[1428] = [null,5030,'鄢陵县'];town[1429] = [null,5030,'襄城县'];town[1430] = [null,5030,'禹州市'];town[1431] = [null,5030,'长葛市'];town[1432] = [null,5040,'源汇区'];town[1433] = [null,5040,'郾城区'];town[1434] = [null,5040,'召陵区'];town[1435] = [null,5040,'舞阳县'];town[1436] = [null,5040,'临颍县'];town[1437] = [null,5050,'湖滨区'];town[1438] = [null,5050,'渑池县'];town[1439] = [null,5050,'陕县'];town[1440] = [null,5050,'卢氏县'];town[1441] = [null,5050,'义马市'];town[1442] = [null,5050,'灵宝市'];town[1443] = [null,5130,'宛城区'];town[1444] = [null,5130,'卧龙区'];town[1445] = [null,5130,'南召县'];town[1446] = [null,5130,'方城县'];town[1447] = [null,5130,'西峡县'];town[1448] = [null,5130,'镇平县'];town[1449] = [null,5130,'内乡县'];town[1450] = [null,5130,'淅川县'];town[1451] = [null,5130,'社旗县'];town[1452] = [null,5130,'唐河县'];town[1453] = [null,5130,'新野县'];town[1454] = [null,5130,'桐柏县'];town[1455] = [null,5130,'邓州市'];town[1456] = [null,5060,'梁园区'];town[1457] = [null,5060,'睢阳区'];town[1458] = [null,5060,'民权县'];town[1459] = [null,5060,'睢县'];town[1460] = [null,5060,'宁陵县'];town[1461] = [null,5060,'柘城县'];town[1462] = [null,5060,'虞城县'];town[1463] = [null,5060,'夏邑县'];town[1464] = [null,5060,'永城市'];town[1465] = [null,5150,'浉河区'];town[1466] = [null,5150,'平桥区'];town[1467] = [null,5150,'罗山县'];town[1468] = [null,5150,'光山县'];town[1469] = [null,5150,'新县'];town[1470] = [null,5150,'商城县'];town[1471] = [null,5150,'固始县'];town[1472] = [null,5150,'潢川县'];town[1473] = [null,5150,'淮滨县'];town[1474] = [null,5150,'息县'];town[1475] = [null,5080,'川汇区'];town[1476] = [null,5080,'扶沟县'];town[1477] = [null,5080,'西华县'];town[1478] = [null,5080,'商水县'];town[1479] = [null,5080,'沈丘县'];town[1480] = [null,5080,'郸城县'];town[1481] = [null,5080,'淮阳县'];town[1482] = [null,5080,'太康县'];town[1483] = [null,5080,'鹿邑县'];town[1484] = [null,5080,'项城市'];town[1485] = [null,5110,'驿城区'];town[1486] = [null,5110,'西平县'];town[1487] = [null,5110,'上蔡县'];town[1488] = [null,5110,'平舆县'];town[1489] = [null,5110,'正阳县'];town[1490] = [null,5110,'确山县'];town[1491] = [null,5110,'泌阳县'];town[1492] = [null,5110,'汝南县'];town[1493] = [null,5110,'遂平县'];town[1494] = [null,5110,'新蔡县'];town[1495] = [null,5210,'江岸区'];town[1496] = [null,5210,'江汉区'];town[1497] = [null,5210,'硚口区'];town[1498] = [null,5210,'汉阳区'];town[1499] = [null,5210,'武昌区'];town[1500] = [null,5210,'青山区'];town[1501] = [null,5210,'洪山区'];town[1502] = [null,5210,'东西湖区'];town[1503] = [null,5210,'汉南区'];town[1504] = [null,5210,'蔡甸区'];town[1505] = [null,5210,'江夏区'];town[1506] = [null,5210,'黄陂区'];town[1507] = [null,5210,'新洲区'];town[1508] = [null,5220,'黄石港区'];town[1509] = [null,5220,'西塞山区'];town[1510] = [null,5220,'下陆区'];town[1511] = [null,5220,'铁山区'];town[1512] = [null,5220,'阳新县'];town[1513] = [null,5220,'大冶市'];town[1514] = [null,5230,'茅箭区'];town[1515] = [null,5230,'张湾区'];town[1516] = [null,5230,'郧县'];town[1517] = [null,5230,'郧西县'];town[1518] = [null,5230,'竹山县'];town[1519] = [null,5230,'竹溪县'];town[1520] = [null,5230,'房县'];town[1521] = [null,5230,'丹江口市'];town[1522] = [null,5260,'西陵区'];town[1523] = [null,5260,'伍家岗区'];town[1524] = [null,5260,'点军区'];town[1525] = [null,5260,'猇亭区'];town[1526] = [null,5260,'夷陵区'];town[1527] = [null,5260,'远安县'];town[1528] = [null,5260,'兴山县'];town[1529] = [null,5260,'秭归县'];town[1530] = [null,5260,'长阳土家族自治县'];town[1531] = [null,5260,'五峰土家族自治县'];town[1532] = [null,5260,'宜都市'];town[1533] = [null,5260,'当阳市'];town[1534] = [null,5260,'枝江市'];town[1535] = [null,5310,'梁子湖区'];town[1536] = [null,5310,'华容区'];town[1537] = [null,5310,'鄂城区'];town[1538] = [null,5320,'东宝区'];town[1539] = [null,5320,'掇刀区'];town[1540] = [null,5320,'京山县'];town[1541] = [null,5320,'沙洋县'];town[1542] = [null,5320,'钟祥市'];town[1543] = [null,5350,'孝南区'];town[1544] = [null,5350,'孝昌县'];town[1545] = [null,5350,'大悟县'];town[1546] = [null,5350,'云梦县'];town[1547] = [null,5350,'应城市'];town[1548] = [null,5350,'安陆市'];town[1549] = [null,5350,'汉川市'];town[1550] = [null,5370,'沙市区'];town[1551] = [null,5370,'荆州区'];town[1552] = [null,5370,'公安县'];town[1553] = [null,5370,'监利县'];town[1554] = [null,5370,'江陵县'];town[1555] = [null,5370,'石首市'];town[1556] = [null,5370,'洪湖市'];town[1557] = [null,5370,'松滋市'];town[1558] = [null,5330,'黄州区'];town[1559] = [null,5330,'团风县'];town[1560] = [null,5330,'红安县'];town[1561] = [null,5330,'罗田县'];town[1562] = [null,5330,'英山县'];town[1563] = [null,5330,'浠水县'];town[1564] = [null,5330,'蕲春县'];town[1565] = [null,5330,'黄梅县'];town[1566] = [null,5330,'麻城市'];town[1567] = [null,5330,'武穴市'];town[1568] = [null,5360,'咸安区'];town[1569] = [null,5360,'嘉鱼县'];town[1570] = [null,5360,'通城县'];town[1571] = [null,5360,'崇阳县'];town[1572] = [null,5360,'通山县'];town[1573] = [null,5360,'赤壁市'];town[1574] = [null,5286,'曾都区'];town[1575] = [null,5286,'随县'];town[1576] = [null,5286,'广水市'];town[1577] = [null,5510,'芙蓉区'];town[1578] = [null,5510,'天心区'];town[1579] = [null,5510,'岳麓区'];town[1580] = [null,5510,'开福区'];town[1581] = [null,5510,'雨花区'];town[1582] = [null,5510,'望城区'];town[1583] = [null,5510,'长沙县'];town[1584] = [null,5510,'宁乡县'];town[1585] = [null,5510,'浏阳市'];town[1586] = [null,5530,'雨湖区'];town[1587] = [null,5530,'岳塘区'];town[1588] = [null,5530,'湘潭县'];town[1589] = [null,5530,'湘乡市'];town[1590] = [null,5530,'韶山市'];town[1591] = [null,5540,'珠晖区'];town[1592] = [null,5540,'雁峰区'];town[1593] = [null,5540,'石鼓区'];town[1594] = [null,5540,'蒸湘区'];town[1595] = [null,5540,'南岳区'];town[1596] = [null,5540,'衡阳县'];town[1597] = [null,5540,'衡南县'];town[1598] = [null,5540,'衡山县'];town[1599] = [null,5540,'衡东县'];town[1600] = [null,5540,'祁东县'];town[1601] = [null,5540,'耒阳市'];town[1602] = [null,5540,'常宁市'];town[1603] = [null,5550,'双清区'];town[1604] = [null,5550,'大祥区'];town[1605] = [null,5550,'北塔区'];town[1606] = [null,5550,'邵东县'];town[1607] = [null,5550,'新邵县'];town[1608] = [null,5550,'邵阳县'];town[1609] = [null,5550,'隆回县'];town[1610] = [null,5550,'洞口县'];town[1611] = [null,5550,'绥宁县'];town[1612] = [null,5550,'新宁县'];town[1613] = [null,5550,'城步苗族自治县'];town[1614] = [null,5550,'武冈市'];town[1615] = [null,5570,'岳阳楼区'];town[1616] = [null,5570,'云溪区'];town[1617] = [null,5570,'君山区'];town[1618] = [null,5570,'岳阳县'];town[1619] = [null,5570,'华容县'];town[1620] = [null,5570,'湘阴县'];town[1621] = [null,5570,'平江县'];town[1622] = [null,5570,'汨罗市'];town[1623] = [null,5570,'临湘市'];town[1624] = [null,5580,'武陵区'];town[1625] = [null,5580,'鼎城区'];town[1626] = [null,5580,'安乡县'];town[1627] = [null,5580,'汉寿县'];town[1628] = [null,5580,'澧县'];town[1629] = [null,5580,'临澧县'];town[1630] = [null,5580,'桃源县'];town[1631] = [null,5580,'石门县'];town[1632] = [null,5580,'津市市'];town[1633] = [null,5590,'永定区'];town[1634] = [null,5590,'武陵源区'];town[1635] = [null,5590,'慈利县'];town[1636] = [null,5590,'桑植县'];town[1637] = [null,5610,'资阳区'];town[1638] = [null,5610,'赫山区'];town[1639] = [null,5610,'南县'];town[1640] = [null,5610,'桃江县'];town[1641] = [null,5610,'安化县'];town[1642] = [null,5610,'沅江市'];town[1643] = [null,5630,'北湖区'];town[1644] = [null,5630,'苏仙区'];town[1645] = [null,5630,'桂阳县'];town[1646] = [null,5630,'宜章县'];town[1647] = [null,5630,'永兴县'];town[1648] = [null,5630,'嘉禾县'];town[1649] = [null,5630,'临武县'];town[1650] = [null,5630,'汝城县'];town[1651] = [null,5630,'桂东县'];town[1652] = [null,5630,'安仁县'];town[1653] = [null,5630,'资兴市'];town[1654] = [null,5650,'零陵区'];town[1655] = [null,5650,'冷水滩区'];town[1656] = [null,5650,'祁阳县'];town[1657] = [null,5650,'东安县'];town[1658] = [null,5650,'双牌县'];town[1659] = [null,5650,'道县'];town[1660] = [null,5650,'江永县'];town[1661] = [null,5650,'宁远县'];town[1662] = [null,5650,'蓝山县'];town[1663] = [null,5650,'新田县'];town[1664] = [null,5650,'江华瑶族自治县'];town[1665] = [null,5670,'鹤城区'];town[1666] = [null,5670,'中方县'];town[1667] = [null,5670,'沅陵县'];town[1668] = [null,5670,'辰溪县'];town[1669] = [null,5670,'溆浦县'];town[1670] = [null,5670,'会同县'];town[1671] = [null,5670,'麻阳苗族自治县'];town[1672] = [null,5670,'新晃侗族自治县'];town[1673] = [null,5670,'芷江侗族自治县'];town[1674] = [null,5670,'靖州苗族侗族自治县'];town[1675] = [null,5670,'通道侗族自治县'];town[1676] = [null,5670,'洪江市'];town[1677] = [null,5620,'娄星区'];town[1678] = [null,5620,'双峰县'];town[1679] = [null,5620,'新化县'];town[1680] = [null,5620,'冷水江市'];town[1681] = [null,5620,'涟源市'];town[1682] = [null,5810,'荔湾区'];town[1683] = [null,5810,'越秀区'];town[1684] = [null,5810,'海珠区'];town[1685] = [null,5810,'天河区'];town[1686] = [null,5810,'白云区'];town[1687] = [null,5810,'黄埔区'];town[1688] = [null,5810,'番禺区'];town[1689] = [null,5810,'花都区'];town[1690] = [null,5810,'南沙区'];town[1691] = [null,5810,'萝岗区'];town[1692] = [null,5810,'增城市'];town[1693] = [null,5810,'从化市'];town[1694] = [null,5820,'武江区'];town[1695] = [null,5820,'浈江区'];town[1696] = [null,5820,'曲江区'];town[1697] = [null,5820,'始兴县'];town[1698] = [null,5820,'仁化县'];town[1699] = [null,5820,'翁源县'];town[1700] = [null,5820,'乳源瑶族自治县'];town[1701] = [null,5820,'新丰县'];town[1702] = [null,5820,'乐昌市'];town[1703] = [null,5820,'南雄市'];town[1704] = [null,5840,'罗湖区'];town[1705] = [null,5840,'福田区'];town[1706] = [null,5840,'南山区'];town[1707] = [null,5840,'宝安区'];town[1708] = [null,5840,'龙岗区'];town[1709] = [null,5840,'盐田区'];town[1710] = [null,5850,'香洲区'];town[1711] = [null,5850,'斗门区'];town[1712] = [null,5850,'金湾区'];town[1713] = [null,5860,'龙湖区'];town[1714] = [null,5860,'金平区'];town[1715] = [null,5860,'濠江区'];town[1716] = [null,5860,'潮阳区'];town[1717] = [null,5860,'潮南区'];town[1718] = [null,5860,'澄海区'];town[1719] = [null,5860,'南澳县'];town[1720] = [null,5880,'禅城区'];town[1721] = [null,5880,'南海区'];town[1722] = [null,5880,'顺德区'];town[1723] = [null,5880,'三水区'];town[1724] = [null,5880,'高明区'];town[1725] = [null,5890,'蓬江区'];town[1726] = [null,5890,'江海区'];town[1727] = [null,5890,'新会区'];town[1728] = [null,5890,'台山市'];town[1729] = [null,5890,'开平市'];town[1730] = [null,5890,'鹤山市'];town[1731] = [null,5890,'恩平市'];town[1732] = [null,5910,'赤坎区'];town[1733] = [null,5910,'霞山区'];town[1734] = [null,5910,'坡头区'];town[1735] = [null,5910,'麻章区'];town[1736] = [null,5910,'遂溪县'];town[1737] = [null,5910,'徐闻县'];town[1738] = [null,5910,'廉江市'];town[1739] = [null,5910,'雷州市'];town[1740] = [null,5910,'吴川市'];town[1741] = [null,5920,'茂南区'];town[1742] = [null,5920,'茂港区'];town[1743] = [null,5920,'电白县'];town[1744] = [null,5920,'高州市'];town[1745] = [null,5920,'化州市'];town[1746] = [null,5920,'信宜市'];town[1747] = [null,5930,'端州区'];town[1748] = [null,5930,'鼎湖区'];town[1749] = [null,5930,'广宁县'];town[1750] = [null,5930,'怀集县'];town[1751] = [null,5930,'封开县'];town[1752] = [null,5930,'德庆县'];town[1753] = [null,5930,'高要市'];town[1754] = [null,5930,'四会市'];town[1755] = [null,5950,'惠城区'];town[1756] = [null,5950,'惠阳区'];town[1757] = [null,5950,'博罗县'];town[1758] = [null,5950,'惠东县'];town[1759] = [null,5950,'龙门县'];town[1760] = [null,5960,'梅江区'];town[1761] = [null,5960,'梅县'];town[1762] = [null,5960,'大埔县'];town[1763] = [null,5960,'丰顺县'];town[1764] = [null,5960,'五华县'];town[1765] = [null,5960,'平远县'];town[1766] = [null,5960,'蕉岭县'];town[1767] = [null,5960,'兴宁市'];town[1768] = [null,5970,'城区'];town[1769] = [null,5970,'海丰县'];town[1770] = [null,5970,'陆河县'];town[1771] = [null,5970,'陆丰市'];town[1772] = [null,5980,'源城区'];town[1773] = [null,5980,'紫金县'];town[1774] = [null,5980,'龙川县'];town[1775] = [null,5980,'连平县'];town[1776] = [null,5980,'和平县'];town[1777] = [null,5980,'东源县'];town[1778] = [null,5990,'江城区'];town[1779] = [null,5990,'阳西县'];town[1780] = [null,5990,'阳东县'];town[1781] = [null,5990,'阳春市'];town[1782] = [null,6010,'清城区'];town[1783] = [null,6010,'清新区'];town[1784] = [null,6010,'佛冈县'];town[1785] = [null,6010,'阳山县'];town[1786] = [null,6010,'连山壮族瑶族自治县'];town[1787] = [null,6010,'连南瑶族自治县'];town[1788] = [null,6010,'英德市'];town[1789] = [null,6010,'连州市'];town[1790] = [null,5869,'湘桥区'];town[1791] = [null,5869,'潮安区'];town[1792] = [null,5869,'饶平县'];town[1793] = [null,5865,'榕城区'];town[1794] = [null,5865,'揭东区'];town[1795] = [null,5865,'揭西县'];town[1796] = [null,5865,'惠来县'];town[1797] = [null,5865,'普宁市'];town[1798] = [null,5937,'云城区'];town[1799] = [null,5937,'新兴县'];town[1800] = [null,5937,'郁南县'];town[1801] = [null,5937,'云安县'];town[1802] = [null,5937,'罗定市'];town[1803] = [null,6110,'兴宁区'];town[1804] = [null,6110,'青秀区'];town[1805] = [null,6110,'江南区'];town[1806] = [null,6110,'西乡塘区'];town[1807] = [null,6110,'良庆区'];town[1808] = [null,6110,'邕宁区'];town[1809] = [null,6110,'武鸣县'];town[1810] = [null,6110,'隆安县'];town[1811] = [null,6110,'马山县'];town[1812] = [null,6110,'上林县'];town[1813] = [null,6110,'宾阳县'];town[1814] = [null,6110,'横县'];town[1815] = [null,6140,'城中区'];town[1816] = [null,6140,'鱼峰区'];town[1817] = [null,6140,'柳南区'];town[1818] = [null,6140,'柳北区'];town[1819] = [null,6140,'柳江县'];town[1820] = [null,6140,'柳城县'];town[1821] = [null,6140,'鹿寨县'];town[1822] = [null,6140,'融安县'];town[1823] = [null,6140,'融水苗族自治县'];town[1824] = [null,6140,'三江侗族自治县'];town[1825] = [null,6170,'秀峰区'];town[1826] = [null,6170,'叠彩区'];town[1827] = [null,6170,'象山区'];town[1828] = [null,6170,'七星区'];town[1829] = [null,6170,'雁山区'];town[1830] = [null,6170,'临桂区'];town[1831] = [null,6170,'阳朔县'];town[1832] = [null,6170,'灵川县'];town[1833] = [null,6170,'全州县'];town[1834] = [null,6170,'兴安县'];town[1835] = [null,6170,'永福县'];town[1836] = [null,6170,'灌阳县'];town[1837] = [null,6170,'龙胜各族自治县'];town[1838] = [null,6170,'资源县'];town[1839] = [null,6170,'平乐县'];town[1840] = [null,6170,'荔浦县'];town[1841] = [null,6170,'恭城瑶族自治县'];town[1842] = [null,6210,'万秀区'];town[1843] = [null,6210,'长洲区'];town[1844] = [null,6210,'龙圩区'];town[1845] = [null,6210,'苍梧县'];town[1846] = [null,6210,'藤县'];town[1847] = [null,6210,'蒙山县'];town[1848] = [null,6210,'岑溪市'];town[1849] = [null,6230,'海城区'];town[1850] = [null,6230,'银海区'];town[1851] = [null,6230,'铁山港区'];town[1852] = [null,6230,'合浦县'];town[1853] = [null,6330,'港口区'];town[1854] = [null,6330,'防城区'];town[1855] = [null,6330,'上思县'];town[1856] = [null,6330,'东兴市'];town[1857] = [null,6311,'钦南区'];town[1858] = [null,6311,'钦北区'];town[1859] = [null,6311,'灵山县'];town[1860] = [null,6311,'浦北县'];town[1861] = [null,6242,'港北区'];town[1862] = [null,6242,'港南区'];town[1863] = [null,6242,'覃塘区'];town[1864] = [null,6242,'平南县'];town[1865] = [null,6242,'桂平市'];town[1866] = [null,6240,'玉州区'];town[1867] = [null,6240,'福绵区'];town[1868] = [null,6240,'容县'];town[1869] = [null,6240,'陆川县'];town[1870] = [null,6240,'博白县'];town[1871] = [null,6240,'兴业县'];town[1872] = [null,6240,'北流市'];town[1873] = [null,6261,'右江区'];town[1874] = [null,6261,'田阳县'];town[1875] = [null,6261,'田东县'];town[1876] = [null,6261,'平果县'];town[1877] = [null,6261,'德保县'];town[1878] = [null,6261,'靖西县'];town[1879] = [null,6261,'那坡县'];town[1880] = [null,6261,'凌云县'];town[1881] = [null,6261,'乐业县'];town[1882] = [null,6261,'田林县'];town[1883] = [null,6261,'西林县'];town[1884] = [null,6261,'隆林各族自治县'];town[1885] = [null,6225,'八步区'];town[1886] = [null,6225,'昭平县'];town[1887] = [null,6225,'钟山县'];town[1888] = [null,6225,'富川瑶族自治县'];town[1889] = [null,6281,'金城江区'];town[1890] = [null,6281,'南丹县'];town[1891] = [null,6281,'天峨县'];town[1892] = [null,6281,'凤山县'];town[1893] = [null,6281,'东兰县'];town[1894] = [null,6281,'罗城仫佬族自治县'];town[1895] = [null,6281,'环江毛南族自治县'];town[1896] = [null,6281,'巴马瑶族自治县'];town[1897] = [null,6281,'都安瑶族自治县'];town[1898] = [null,6281,'大化瑶族自治县'];town[1899] = [null,6281,'宜州市'];town[1900] = [null,6155,'兴宾区'];town[1901] = [null,6155,'忻城县'];town[1902] = [null,6155,'象州县'];town[1903] = [null,6155,'武宣县'];town[1904] = [null,6155,'金秀瑶族自治县'];town[1905] = [null,6155,'合山市'];town[1906] = [null,6128,'江州区'];town[1907] = [null,6128,'扶绥县'];town[1908] = [null,6128,'宁明县'];town[1909] = [null,6128,'龙州县'];town[1910] = [null,6128,'大新县'];town[1911] = [null,6128,'天等县'];town[1912] = [null,6128,'凭祥市'];town[1913] = [null,6410,'秀英区'];town[1914] = [null,6410,'龙华区'];town[1915] = [null,6410,'琼山区'];town[1916] = [null,6410,'美兰区'];town[1917] = [null,6530,'万州区'];town[1918] = [null,6530,'涪陵区'];town[1919] = [null,6530,'渝中区'];town[1920] = [null,6530,'大渡口区'];town[1921] = [null,6530,'江北区'];town[1922] = [null,6530,'沙坪坝区'];town[1923] = [null,6530,'九龙坡区'];town[1924] = [null,6530,'南岸区'];town[1925] = [null,6530,'北碚区'];town[1926] = [null,6530,'綦江区'];town[1927] = [null,6530,'大足区'];town[1928] = [null,6530,'渝北区'];town[1929] = [null,6530,'巴南区'];town[1930] = [null,6530,'黔江区'];town[1931] = [null,6530,'长寿区'];town[1932] = [null,6530,'江津区'];town[1933] = [null,6530,'合川区'];town[1934] = [null,6530,'永川区'];town[1935] = [null,6530,'南川区'];town[1936] = [null,6530,'潼南县'];town[1937] = [null,6530,'铜梁县'];town[1938] = [null,6530,'荣昌县'];town[1939] = [null,6530,'璧山县'];town[1940] = [null,6530,'梁平县'];town[1941] = [null,6530,'城口县'];town[1942] = [null,6530,'丰都县'];town[1943] = [null,6530,'垫江县'];town[1944] = [null,6530,'武隆县'];town[1945] = [null,6530,'忠县'];town[1946] = [null,6530,'开县'];town[1947] = [null,6530,'云阳县'];town[1948] = [null,6530,'奉节县'];town[1949] = [null,6530,'巫山县'];town[1950] = [null,6530,'巫溪县'];town[1951] = [null,6530,'石柱土家族自治县'];town[1952] = [null,6530,'秀山土家族苗族自治县'];town[1953] = [null,6530,'酉阳土家族苗族自治县'];town[1954] = [null,6530,'彭水苗族土家族自治县'];town[1955] = [null,6510,'锦江区'];town[1956] = [null,6510,'青羊区'];town[1957] = [null,6510,'金牛区'];town[1958] = [null,6510,'武侯区'];town[1959] = [null,6510,'成华区'];town[1960] = [null,6510,'龙泉驿区'];town[1961] = [null,6510,'青白江区'];town[1962] = [null,6510,'新都区'];town[1963] = [null,6510,'温江区'];town[1964] = [null,6510,'金堂县'];town[1965] = [null,6510,'双流县'];town[1966] = [null,6510,'郫县'];town[1967] = [null,6510,'大邑县'];town[1968] = [null,6510,'蒲江县'];town[1969] = [null,6510,'新津县'];town[1970] = [null,6510,'都江堰市'];town[1971] = [null,6510,'彭州市'];town[1972] = [null,6510,'邛崃市'];town[1973] = [null,6510,'崇州市'];town[1974] = [null,6550,'自流井区'];town[1975] = [null,6550,'贡井区'];town[1976] = [null,6550,'大安区'];town[1977] = [null,6550,'沿滩区'];town[1978] = [null,6550,'荣县'];town[1979] = [null,6550,'富顺县'];town[1980] = [null,6560,'东区'];town[1981] = [null,6560,'西区'];town[1982] = [null,6560,'仁和区'];town[1983] = [null,6560,'米易县'];town[1984] = [null,6560,'盐边县'];town[1985] = [null,6570,'江阳区'];town[1986] = [null,6570,'纳溪区'];town[1987] = [null,6570,'龙马潭区'];town[1988] = [null,6570,'泸县'];town[1989] = [null,6570,'合江县'];town[1990] = [null,6570,'叙永县'];town[1991] = [null,6570,'古蔺县'];town[1992] = [null,6580,'旌阳区'];town[1993] = [null,6580,'中江县'];town[1994] = [null,6580,'罗江县'];town[1995] = [null,6580,'广汉市'];town[1996] = [null,6580,'什邡市'];town[1997] = [null,6580,'绵竹市'];town[1998] = [null,6590,'涪城区'];town[1999] = [null,6590,'游仙区'];town[2000] = [null,6590,'三台县'];town[2001] = [null,6590,'盐亭县'];town[2002] = [null,6590,'安县'];town[2003] = [null,6590,'梓潼县'];town[2004] = [null,6590,'北川羌族自治县'];town[2005] = [null,6590,'平武县'];town[2006] = [null,6590,'江油市'];town[2007] = [null,6610,'利州区'];town[2008] = [null,6610,'元坝区'];town[2009] = [null,6610,'朝天区'];town[2010] = [null,6610,'旺苍县'];town[2011] = [null,6610,'青川县'];town[2012] = [null,6610,'剑阁县'];town[2013] = [null,6610,'苍溪县'];town[2014] = [null,6620,'船山区'];town[2015] = [null,6620,'安居区'];town[2016] = [null,6620,'蓬溪县'];town[2017] = [null,6620,'射洪县'];town[2018] = [null,6620,'大英县'];town[2019] = [null,6630,'市中区'];town[2020] = [null,6630,'东兴区'];town[2021] = [null,6630,'威远县'];town[2022] = [null,6630,'资中县'];town[2023] = [null,6630,'隆昌县'];town[2024] = [null,6650,'市中区'];town[2025] = [null,6650,'沙湾区'];town[2026] = [null,6650,'五通桥区'];town[2027] = [null,6650,'金口河区'];town[2028] = [null,6650,'犍为县'];town[2029] = [null,6650,'井研县'];town[2030] = [null,6650,'夹江县'];town[2031] = [null,6650,'沐川县'];town[2032] = [null,6650,'峨边彝族自治县'];town[2033] = [null,6650,'马边彝族自治县'];town[2034] = [null,6650,'峨眉山市'];town[2035] = [null,6730,'顺庆区'];town[2036] = [null,6730,'高坪区'];town[2037] = [null,6730,'嘉陵区'];town[2038] = [null,6730,'南部县'];town[2039] = [null,6730,'营山县'];town[2040] = [null,6730,'蓬安县'];town[2041] = [null,6730,'仪陇县'];town[2042] = [null,6730,'西充县'];town[2043] = [null,6730,'阆中市'];town[2044] = [null,6652,'东坡区'];town[2045] = [null,6652,'仁寿县'];town[2046] = [null,6652,'彭山县'];town[2047] = [null,6652,'洪雅县'];town[2048] = [null,6652,'丹棱县'];town[2049] = [null,6652,'青神县'];town[2050] = [null,6710,'翠屏区'];town[2051] = [null,6710,'南溪区'];town[2052] = [null,6710,'宜宾县'];town[2053] = [null,6710,'江安县'];town[2054] = [null,6710,'长宁县'];town[2055] = [null,6710,'高县'];town[2056] = [null,6710,'珙县'];town[2057] = [null,6710,'筠连县'];town[2058] = [null,6710,'兴文县'];town[2059] = [null,6710,'屏山县'];town[2060] = [null,6737,'广安区'];town[2061] = [null,6737,'前锋区'];town[2062] = [null,6737,'岳池县'];town[2063] = [null,6737,'武胜县'];town[2064] = [null,6737,'邻水县'];town[2065] = [null,6737,'华蓥市'];town[2066] = [null,6750,'通川区'];town[2067] = [null,6750,'达川区'];town[2068] = [null,6750,'宣汉县'];town[2069] = [null,6750,'开江县'];town[2070] = [null,6750,'大竹县'];town[2071] = [null,6750,'渠县'];town[2072] = [null,6750,'万源市'];town[2073] = [null,6770,'雨城区'];town[2074] = [null,6770,'名山区'];town[2075] = [null,6770,'荥经县'];town[2076] = [null,6770,'汉源县'];town[2077] = [null,6770,'石棉县'];town[2078] = [null,6770,'天全县'];town[2079] = [null,6770,'芦山县'];town[2080] = [null,6770,'宝兴县'];town[2081] = [null,6758,'巴州区'];town[2082] = [null,6758,'恩阳区'];town[2083] = [null,6758,'通江县'];town[2084] = [null,6758,'南江县'];town[2085] = [null,6758,'平昌县'];town[2086] = [null,6636,'雁江区'];town[2087] = [null,6636,'安岳县'];town[2088] = [null,6636,'乐至县'];town[2089] = [null,6636,'简阳市'];town[2090] = [null,7010,'南明区'];town[2091] = [null,7010,'云岩区'];town[2092] = [null,7010,'花溪区'];town[2093] = [null,7010,'乌当区'];town[2094] = [null,7010,'白云区'];town[2095] = [null,7010,'观山湖区'];town[2096] = [null,7010,'开阳县'];town[2097] = [null,7010,'息烽县'];town[2098] = [null,7010,'修文县'];town[2099] = [null,7010,'清镇市'];town[2100] = [null,7020,'钟山区'];town[2101] = [null,7020,'六枝特区'];town[2102] = [null,7020,'水城县'];town[2103] = [null,7020,'盘县'];town[2104] = [null,7030,'红花岗区'];town[2105] = [null,7030,'汇川区'];town[2106] = [null,7030,'遵义县'];town[2107] = [null,7030,'桐梓县'];town[2108] = [null,7030,'绥阳县'];town[2109] = [null,7030,'正安县'];town[2110] = [null,7030,'道真仡佬族苗族自治县'];town[2111] = [null,7030,'务川仡佬族苗族自治县'];town[2112] = [null,7030,'凤冈县'];town[2113] = [null,7030,'湄潭县'];town[2114] = [null,7030,'余庆县'];town[2115] = [null,7030,'习水县'];town[2116] = [null,7030,'赤水市'];town[2117] = [null,7030,'仁怀市'];town[2118] = [null,7110,'西秀区'];town[2119] = [null,7110,'平坝县'];town[2120] = [null,7110,'普定县'];town[2121] = [null,7110,'镇宁布依族苗族自治县'];town[2122] = [null,7110,'关岭布依族苗族自治县'];town[2123] = [null,7110,'紫云苗族布依族自治县'];town[2124] = [null,7310,'五华区'];town[2125] = [null,7310,'盘龙区'];town[2126] = [null,7310,'官渡区'];town[2127] = [null,7310,'西山区'];town[2128] = [null,7310,'东川区'];town[2129] = [null,7310,'呈贡区'];town[2130] = [null,7310,'晋宁县'];town[2131] = [null,7310,'富民县'];town[2132] = [null,7310,'宜良县'];town[2133] = [null,7310,'石林彝族自治县'];town[2134] = [null,7310,'嵩明县'];town[2135] = [null,7310,'禄劝彝族苗族自治县'];town[2136] = [null,7310,'寻甸回族彝族自治县'];town[2137] = [null,7310,'安宁市'];town[2138] = [null,7360,'麒麟区'];town[2139] = [null,7360,'马龙县'];town[2140] = [null,7360,'陆良县'];town[2141] = [null,7360,'师宗县'];town[2142] = [null,7360,'罗平县'];town[2143] = [null,7360,'富源县'];town[2144] = [null,7360,'会泽县'];town[2145] = [null,7360,'沾益县'];town[2146] = [null,7360,'宣威市'];town[2147] = [null,7410,'红塔区'];town[2148] = [null,7410,'江川县'];town[2149] = [null,7410,'澄江县'];town[2150] = [null,7410,'通海县'];town[2151] = [null,7410,'华宁县'];town[2152] = [null,7410,'易门县'];town[2153] = [null,7410,'峨山彝族自治县'];town[2154] = [null,7410,'新平彝族傣族自治县'];town[2155] = [null,7410,'元江哈尼族彝族傣族自治县'];town[2156] = [null,7530,'隆阳区'];town[2157] = [null,7530,'施甸县'];town[2158] = [null,7530,'腾冲县'];town[2159] = [null,7530,'龙陵县'];town[2160] = [null,7530,'昌宁县'];town[2161] = [null,7340,'昭阳区'];town[2162] = [null,7340,'鲁甸县'];town[2163] = [null,7340,'巧家县'];town[2164] = [null,7340,'盐津县'];town[2165] = [null,7340,'大关县'];town[2166] = [null,7340,'永善县'];town[2167] = [null,7340,'绥江县'];town[2168] = [null,7340,'镇雄县'];town[2169] = [null,7340,'彝良县'];town[2170] = [null,7340,'威信县'];town[2171] = [null,7340,'水富县'];town[2172] = [null,7550,'古城区'];town[2173] = [null,7550,'玉龙纳西族自治县'];town[2174] = [null,7550,'永胜县'];town[2175] = [null,7550,'华坪县'];town[2176] = [null,7550,'宁蒗彝族自治县'];town[2177] = [null,7580,'临翔区'];town[2178] = [null,7580,'凤庆县'];town[2179] = [null,7580,'云县'];town[2180] = [null,7580,'永德县'];town[2181] = [null,7580,'镇康县'];town[2182] = [null,7580,'双江拉祜族佤族布朗族傣族自治县'];town[2183] = [null,7580,'耿马傣族佤族自治县'];town[2184] = [null,7580,'沧源佤族自治县'];town[2185] = [null,7700,'城关区'];town[2186] = [null,7700,'林周县'];town[2187] = [null,7700,'当雄县'];town[2188] = [null,7700,'尼木县'];town[2189] = [null,7700,'曲水县'];town[2190] = [null,7700,'堆龙德庆县'];town[2191] = [null,7700,'达孜县'];town[2192] = [null,7700,'墨竹工卡县'];town[2193] = [null,7910,'新城区'];town[2194] = [null,7910,'碑林区'];town[2195] = [null,7910,'莲湖区'];town[2196] = [null,7910,'灞桥区'];town[2197] = [null,7910,'未央区'];town[2198] = [null,7910,'雁塔区'];town[2199] = [null,7910,'阎良区'];town[2200] = [null,7910,'临潼区'];town[2201] = [null,7910,'长安区'];town[2202] = [null,7910,'蓝田县'];town[2203] = [null,7910,'周至县'];town[2204] = [null,7910,'户县'];town[2205] = [null,7910,'高陵县'];town[2206] = [null,7920,'王益区'];town[2207] = [null,7920,'印台区'];town[2208] = [null,7920,'耀州区'];town[2209] = [null,7920,'宜君县'];town[2210] = [null,7930,'渭滨区'];town[2211] = [null,7930,'金台区'];town[2212] = [null,7930,'陈仓区'];town[2213] = [null,7930,'凤翔县'];town[2214] = [null,7930,'岐山县'];town[2215] = [null,7930,'扶风县'];town[2216] = [null,7930,'眉县'];town[2217] = [null,7930,'陇县'];town[2218] = [null,7930,'千阳县'];town[2219] = [null,7930,'麟游县'];town[2220] = [null,7930,'凤县'];town[2221] = [null,7930,'太白县'];town[2222] = [null,7950,'秦都区'];town[2223] = [null,7950,'杨陵区'];town[2224] = [null,7950,'渭城区'];town[2225] = [null,7950,'三原县'];town[2226] = [null,7950,'泾阳县'];town[2227] = [null,7950,'乾县'];town[2228] = [null,7950,'礼泉县'];town[2229] = [null,7950,'永寿县'];town[2230] = [null,7950,'彬县'];town[2231] = [null,7950,'长武县'];town[2232] = [null,7950,'旬邑县'];town[2233] = [null,7950,'淳化县'];town[2234] = [null,7950,'武功县'];town[2235] = [null,7950,'兴平市'];town[2236] = [null,7970,'临渭区'];town[2237] = [null,7970,'华县'];town[2238] = [null,7970,'潼关县'];town[2239] = [null,7970,'大荔县'];town[2240] = [null,7970,'合阳县'];town[2241] = [null,7970,'澄城县'];town[2242] = [null,7970,'蒲城县'];town[2243] = [null,7970,'白水县'];town[2244] = [null,7970,'富平县'];town[2245] = [null,7970,'韩城市'];town[2246] = [null,7970,'华阴市'];town[2247] = [null,8040,'宝塔区'];town[2248] = [null,8040,'延长县'];town[2249] = [null,8040,'延川县'];town[2250] = [null,8040,'子长县'];town[2251] = [null,8040,'安塞县'];town[2252] = [null,8040,'志丹县'];town[2253] = [null,8040,'吴起县'];town[2254] = [null,8040,'甘泉县'];town[2255] = [null,8040,'富县'];town[2256] = [null,8040,'洛川县'];town[2257] = [null,8040,'宜川县'];town[2258] = [null,8040,'黄龙县'];town[2259] = [null,8040,'黄陵县'];town[2260] = [null,7990,'汉台区'];town[2261] = [null,7990,'南郑县'];town[2262] = [null,7990,'城固县'];town[2263] = [null,7990,'洋县'];town[2264] = [null,7990,'西乡县'];town[2265] = [null,7990,'勉县'];town[2266] = [null,7990,'宁强县'];town[2267] = [null,7990,'略阳县'];town[2268] = [null,7990,'镇巴县'];town[2269] = [null,7990,'留坝县'];town[2270] = [null,7990,'佛坪县'];town[2271] = [null,8060,'榆阳区'];town[2272] = [null,8060,'神木县'];town[2273] = [null,8060,'府谷县'];town[2274] = [null,8060,'横山县'];town[2275] = [null,8060,'靖边县'];town[2276] = [null,8060,'定边县'];town[2277] = [null,8060,'绥德县'];town[2278] = [null,8060,'米脂县'];town[2279] = [null,8060,'佳县'];town[2280] = [null,8060,'吴堡县'];town[2281] = [null,8060,'清涧县'];town[2282] = [null,8060,'子洲县'];town[2283] = [null,8010,'汉滨区'];town[2284] = [null,8010,'汉阴县'];town[2285] = [null,8010,'石泉县'];town[2286] = [null,8010,'宁陕县'];town[2287] = [null,8010,'紫阳县'];town[2288] = [null,8010,'岚皋县'];town[2289] = [null,8010,'平利县'];town[2290] = [null,8010,'镇坪县'];town[2291] = [null,8010,'旬阳县'];town[2292] = [null,8010,'白河县'];town[2293] = [null,8030,'商州区'];town[2294] = [null,8030,'洛南县'];town[2295] = [null,8030,'丹凤县'];town[2296] = [null,8030,'商南县'];town[2297] = [null,8030,'山阳县'];town[2298] = [null,8030,'镇安县'];town[2299] = [null,8030,'柞水县'];town[2300] = [null,8210,'城关区'];town[2301] = [null,8210,'七里河区'];town[2302] = [null,8210,'西固区'];town[2303] = [null,8210,'安宁区'];town[2304] = [null,8210,'红古区'];town[2305] = [null,8210,'永登县'];town[2306] = [null,8210,'皋兰县'];town[2307] = [null,8210,'榆中县'];town[2308] = [null,8230,'金川区'];town[2309] = [null,8230,'永昌县'];town[2310] = [null,8240,'白银区'];town[2311] = [null,8240,'平川区'];town[2312] = [null,8240,'靖远县'];town[2313] = [null,8240,'会宁县'];town[2314] = [null,8240,'景泰县'];town[2315] = [null,8250,'秦州区'];town[2316] = [null,8250,'麦积区'];town[2317] = [null,8250,'清水县'];town[2318] = [null,8250,'秦安县'];town[2319] = [null,8250,'甘谷县'];town[2320] = [null,8250,'武山县'];town[2321] = [null,8250,'张家川回族自治县'];town[2322] = [null,8280,'凉州区'];town[2323] = [null,8280,'民勤县'];town[2324] = [null,8280,'古浪县'];town[2325] = [null,8280,'天祝藏族自治县'];town[2326] = [null,8270,'甘州区'];town[2327] = [null,8270,'肃南裕固族自治县'];town[2328] = [null,8270,'民乐县'];town[2329] = [null,8270,'临泽县'];town[2330] = [null,8270,'高台县'];town[2331] = [null,8270,'山丹县'];town[2332] = [null,8330,'崆峒区'];town[2333] = [null,8330,'泾川县'];town[2334] = [null,8330,'灵台县'];town[2335] = [null,8330,'崇信县'];town[2336] = [null,8330,'华亭县'];town[2337] = [null,8330,'庄浪县'];town[2338] = [null,8330,'静宁县'];town[2339] = [null,8260,'肃州区'];town[2340] = [null,8260,'金塔县'];town[2341] = [null,8260,'瓜州县'];town[2342] = [null,8260,'肃北蒙古族自治县'];town[2343] = [null,8260,'阿克塞哈萨克族自治县'];town[2344] = [null,8260,'玉门市'];town[2345] = [null,8260,'敦煌市'];town[2346] = [null,8340,'西峰区'];town[2347] = [null,8340,'庆城县'];town[2348] = [null,8340,'环县'];town[2349] = [null,8340,'华池县'];town[2350] = [null,8340,'合水县'];town[2351] = [null,8340,'正宁县'];town[2352] = [null,8340,'宁县'];town[2353] = [null,8340,'镇原县'];town[2354] = [null,8290,'安定区'];town[2355] = [null,8290,'通渭县'];town[2356] = [null,8290,'陇西县'];town[2357] = [null,8290,'渭源县'];town[2358] = [null,8290,'临洮县'];town[2359] = [null,8290,'漳县'];town[2360] = [null,8290,'岷县'];town[2361] = [null,8310,'武都区'];town[2362] = [null,8310,'成县'];town[2363] = [null,8310,'文县'];town[2364] = [null,8310,'宕昌县'];town[2365] = [null,8310,'康县'];town[2366] = [null,8310,'西和县'];town[2367] = [null,8310,'礼县'];town[2368] = [null,8310,'徽县'];town[2369] = [null,8310,'两当县'];town[2370] = [null,8510,'城东区'];town[2371] = [null,8510,'城中区'];town[2372] = [null,8510,'城西区'];town[2373] = [null,8510,'城北区'];town[2374] = [null,8510,'大通回族土族自治县'];town[2375] = [null,8510,'湟中县'];town[2376] = [null,8510,'湟源县'];town[2377] = [null,8540,'门源回族自治县'];town[2378] = [null,8540,'祁连县'];town[2379] = [null,8540,'海晏县'];town[2380] = [null,8540,'刚察县'];town[2381] = [null,8550,'同仁县'];town[2382] = [null,8550,'尖扎县'];town[2383] = [null,8550,'泽库县'];town[2384] = [null,8550,'河南蒙古族自治县'];town[2385] = [null,8560,'共和县'];town[2386] = [null,8560,'同德县'];town[2387] = [null,8560,'贵德县'];town[2388] = [null,8560,'兴海县'];town[2389] = [null,8560,'贵南县'];town[2390] = [null,8570,'玛沁县'];town[2391] = [null,8570,'班玛县'];town[2392] = [null,8570,'甘德县'];town[2393] = [null,8570,'达日县'];town[2394] = [null,8570,'久治县'];town[2395] = [null,8570,'玛多县'];town[2396] = [null,8580,'玉树市'];town[2397] = [null,8580,'杂多县'];town[2398] = [null,8580,'称多县'];town[2399] = [null,8580,'治多县'];town[2400] = [null,8580,'囊谦县'];town[2401] = [null,8580,'曲麻莱县'];town[2402] = [null,8590,'格尔木市'];town[2403] = [null,8590,'德令哈市'];town[2404] = [null,8590,'乌兰县'];town[2405] = [null,8590,'都兰县'];town[2406] = [null,8590,'天峻县'];town[2407] = [null,8710,'兴庆区'];town[2408] = [null,8710,'西夏区'];town[2409] = [null,8710,'金凤区'];town[2410] = [null,8710,'永宁县'];town[2411] = [null,8710,'贺兰县'];town[2412] = [null,8710,'灵武市'];town[2413] = [null,8720,'大武口区'];town[2414] = [null,8720,'惠农区'];town[2415] = [null,8720,'平罗县'];town[2416] = [null,8731,'利通区'];town[2417] = [null,8731,'红寺堡区'];town[2418] = [null,8731,'盐池县'];town[2419] = [null,8731,'同心县'];town[2420] = [null,8731,'青铜峡市'];town[2421] = [null,8741,'原州区'];town[2422] = [null,8741,'西吉县'];town[2423] = [null,8741,'隆德县'];town[2424] = [null,8741,'泾源县'];town[2425] = [null,8741,'彭阳县'];town[2426] = [null,8733,'沙坡头区'];town[2427] = [null,8733,'中宁县'];town[2428] = [null,8733,'海原县'];town[2429] = [null,8810,'天山区'];town[2430] = [null,8810,'沙依巴克区'];town[2431] = [null,8810,'新市区'];town[2432] = [null,8810,'水磨沟区'];town[2433] = [null,8810,'头屯河区'];town[2434] = [null,8810,'达坂城区'];town[2435] = [null,8810,'米东区'];town[2436] = [null,8810,'乌鲁木齐县'];town[2437] = [null,8820,'独山子区'];town[2438] = [null,8820,'克拉玛依区'];town[2439] = [null,8820,'白碱滩区'];town[2440] = [null,8820,'乌尔禾区'];town[2441] = [null,8830,'吐鲁番市'];town[2442] = [null,8830,'鄯善县'];town[2443] = [null,8830,'托克逊县'];town[2444] = [null,8840,'哈密市'];town[2445] = [null,8840,'巴里坤哈萨克自治县'];town[2446] = [null,8840,'伊吾县'];town[2447] = [null,8850,'昌吉市'];town[2448] = [null,8850,'阜康市'];town[2449] = [null,8850,'呼图壁县'];town[2450] = [null,8850,'玛纳斯县'];town[2451] = [null,8850,'奇台县'];town[2452] = [null,8850,'吉木萨尔县'];town[2453] = [null,8850,'木垒哈萨克自治县'];town[2454] = [null,8870,'博乐市'];town[2455] = [null,8870,'阿拉山口市'];town[2456] = [null,8870,'精河县'];town[2457] = [null,8870,'温泉县'];town[2458] = [null,8880,'库尔勒市'];town[2459] = [null,8880,'轮台县'];town[2460] = [null,8880,'尉犁县'];town[2461] = [null,8880,'若羌县'];town[2462] = [null,8880,'且末县'];town[2463] = [null,8880,'焉耆回族自治县'];town[2464] = [null,8880,'和静县'];town[2465] = [null,8880,'和硕县'];town[2466] = [null,8880,'博湖县'];town[2467] = [null,8910,'阿克苏市'];town[2468] = [null,8910,'温宿县'];town[2469] = [null,8910,'库车县'];town[2470] = [null,8910,'沙雅县'];town[2471] = [null,8910,'新和县'];town[2472] = [null,8910,'拜城县'];town[2473] = [null,8910,'乌什县'];town[2474] = [null,8910,'阿瓦提县'];town[2475] = [null,8910,'柯坪县'];town[2476] = [null,8930,'阿图什市'];town[2477] = [null,8930,'阿克陶县'];town[2478] = [null,8930,'阿合奇县'];town[2479] = [null,8930,'乌恰县'];town[2480] = [null,8940,'喀什市'];town[2481] = [null,8940,'疏附县'];town[2482] = [null,8940,'疏勒县'];town[2483] = [null,8940,'英吉沙县'];town[2484] = [null,8940,'泽普县'];town[2485] = [null,8940,'莎车县'];town[2486] = [null,8940,'叶城县'];town[2487] = [null,8940,'麦盖提县'];town[2488] = [null,8940,'岳普湖县'];town[2489] = [null,8940,'伽师县'];town[2490] = [null,8940,'巴楚县'];town[2491] = [null,8940,'塔什库尔干塔吉克自治县'];town[2492] = [null,8960,'和田市'];town[2493] = [null,8960,'和田县'];town[2494] = [null,8960,'墨玉县'];town[2495] = [null,8960,'皮山县'];town[2496] = [null,8960,'洛浦县'];town[2497] = [null,8960,'策勒县'];town[2498] = [null,8960,'于田县'];town[2499] = [null,8960,'民丰县'];town[2500] = [null,8980,'伊宁市'];town[2501] = [null,8980,'奎屯市'];town[2502] = [null,8980,'伊宁县'];town[2503] = [null,8980,'察布查尔锡伯自治县'];town[2504] = [null,8980,'霍城县'];town[2505] = [null,8980,'巩留县'];town[2506] = [null,8980,'新源县'];town[2507] = [null,8980,'昭苏县'];town[2508] = [null,8980,'特克斯县'];town[2509] = [null,8980,'尼勒克县'];town[2510] = [null,9010,'塔城市'];town[2511] = [null,9010,'乌苏市'];town[2512] = [null,9010,'额敏县'];town[2513] = [null,9010,'沙湾县'];town[2514] = [null,9010,'托里县'];town[2515] = [null,9010,'裕民县'];town[2516] = [null,9010,'和布克赛尔蒙古自治县'];town[2517] = [null,9020,'阿勒泰市'];town[2518] = [null,9020,'布尔津县'];town[2519] = [null,9020,'富蕴县'];town[2520] = [null,9020,'福海县'];town[2521] = [null,9020,'哈巴河县'];town[2522] = [null,9020,'青河县'];town[2523] = [null,9020,'吉木乃县'];

		var change = function(arr,par,item){
			
			if(item.length<1) return;

			// 更换镇
			item.html(function(){
				var res = [];
				for(var i=0,l=arr.length;i<l;i++){
					if(arr[i][1] === par){
						res.push('<option value="'+arr[i][2]+'" code="'+arr[i][0]+'">'+arr[i][2]+'</option>');
					}
				}
				return res.join('');
			});

			if(item.attr('default')){
				var options = item.find('option');
				var idx = options.index(options.filter('[value="'+item.attr('default')+'"]'));
				item.get(0).selectedIndex = idx>=0 ? idx :0;
				item.removeAttr('default');
			}else{
				item.get(0).selectedIndex = 0;
			}
		}

		this.on('change','select',function(){

			var $this = $(this);
			var selects = $this.closest('.js-form-city').find('select');

			if($this.is('.prov')){
				// 更换市
				change(city,parseInt($this.find('option').eq(this.selectedIndex).attr('code')),selects.eq(1));
				selects.eq(1).trigger("change");

			}else if($this.is('.city')){

				// 更换镇
				change(town,parseInt($this.find('option').eq(this.selectedIndex).attr('code')),selects.eq(2));
				selects.eq(2).trigger("change");
			}
		});


		// 初始化
		return this.each(function(){
			var select = $(this).find('select').eq(0);
			change(prov,0,select);
			
			select.trigger("change");
		});
	},
	// 图片上传预览
	upic:function(opts){
		opts = jQuery.extend({
			ImgType: ["gif", "jpeg", "jpg", "bmp", "png"],
			Callback: function() {}
		}, opts || {});


		var getUrl = (function(){
			if (window.createObjectURL != undefined) {
				return function(file){return window.createObjectURL(file);}
			} else if (window.URL != undefined) {
				return function(file){return  window.URL.createObjectURL(file);}
			} else if (window.webkitURL != undefined) {
				return function(file){return window.webkitURL.createObjectURL(file);}
			}
		})();

		return this.on('change',function(){
			var $this = $(this);
			var show = $this.siblings('.fukrm_file_box');
			if (this.value) {
				if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
					alert("选择文件错误,图片类型必须是" + opts.ImgType.join("，") + "中的一种");
					this.value = "";
					return false;
				}
				try {
					show.children('img').attr('src', getUrl(this.files[0]));
				} catch (e) {
					var src = "";
					$this.select();
					if (top != self) {
						window.parent.document.body.focus()
					} else {
						$this.blur()
					}
					src = document.selection.createRange().text;
					document.selection.empty();

					show.css('filter','progid:DXImageTransform.Microsoft.AlphaImageLoader(src="'+src+'",sizingMethod=scale)').children('img').hide();
				}
				opts.Callback();
			}
		}).after(function(){
			var img = this.getAttribute('default') ? '<img src="'+this.getAttribute('default')+'">' : '<img src="#">';
			return '<div class="fukrm_file_box">'+img+'</div>';
		});
	},
	fukrm: function(opts) {
		opts = jQuery.extend({}, opts || {});

		// 加外层
		var item = this.find('input,textarea,select').wrap(function(){return '<div class="fukrm_item fukrm_'+(this.getAttribute('type')||this.tagName).toLowerCase()+'"/>';});


		// 如果没有placeholder 加 em
		if ( !('placeholder' in document.createElement('input'))){
			item.after(function(){
				var dip = this.value == '' ? '' : 'style="display:none"';
				return this.getAttribute('placeholder') ? '<em '+dip+'>'+this.getAttribute('placeholder')+'</em>' : false ;
			})
			.on('blur', function(){
				if(this.value.length >0){
					$(this).siblings('em').hide();
				}else{
					$(this).siblings('em').show();
				}
			})
			.on('focus',function() {
				$(this).siblings('em').hide();
			}).next('em').on('click',function () {
				$(this).parent().find('input,textarea').trigger('focus');
			});
		}


		// checkbox,radio美化
		item.filter('[type=checkbox],[type=radio]').on('change',function(){
			var $this = $(this);
			$this.prop('checked') ?$this.parent().addClass('checked') : $this.parent().removeClass('checked');
		}).trigger('change');

		item.filter('[type=file]').not('').upic();
		item.filter('select').slct();

		item.filter('[check]').after('<i class="fukrm_note"></i>').on('blur',function(){$(this).formCheck()});
		return this;
	}
});


$(function(){


	$('.fukrm').fukrm();

	// 城市级联
	$('.js-form-city').citys();


	//同步拦截
	$('.fukrm-check').not('.fukrm-ajax').on('submit',function(){
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
		
		
	})
	
	
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
	

	// 密码强度
	$('.checkstrong').on('keyup',function(){
		function CharMode(iN) {
				if (iN >= 48 && iN <= 57) //数字    
					return 1;
				if (iN >= 65 && iN <= 90) //大写    
					return 2;
				if (iN >= 97 && iN <= 122) //小写    
					return 4;
				else
					return 8;
			}
			//bitTotal函数    
			//计算密码模式    
		function bitTotal(num) {
				modes = 0;
				for (i = 0; i < 4; i++) {
					if (num & 1) modes++;
					num >>>= 1;
				}
				return modes;
			}
			//返回强度级别    
		function checkStrong(sPW) {
			if (sPW.length < 6)
				return 0; //密码太短，不检测级别  
			Modes = 0;
			for (i = 0; i < sPW.length; i++) {
				//密码模式    
				Modes |= CharMode(sPW.charCodeAt(i));
			}
			return bitTotal(Modes);
		}


		var $this = $(this);
		var val = $this.val();

		var Dfault_color = "#eeeeee"; //默认颜色  
		var L_color = "#ee2323"; //低强度的颜色，且只显示在最左边的单元格中  
		var M_color = "#ff9900"; //中等强度的颜色，且只显示在左边两个单元格中  
		var H_color = "#33cc00"; //高强度的颜色，三个单元格都显示 

		var Lcolor,Mcolor,Hcolor;

		if (val == null || val == '') {
			Lcolor = L_color;
			Mcolor = Hcolor = Dfault_color;
		} else {
			S_level = checkStrong(val);
			switch (S_level) {
				case 0:
					Lcolor = L_color;
					Mcolor = Hcolor = Dfault_color;
					break;
				case 1:
					Lcolor = L_color;
					Mcolor = Hcolor = Dfault_color;
					break;
				case 2:
					Lcolor = Mcolor = M_color;
					Hcolor = Dfault_color;
					break;
				default:
					Lcolor = Mcolor = Hcolor = H_color;

			}
		}


		var ckeckres = $this.parent().parent().find('.checkstrong_res b');
		ckeckres.eq(0).css('background',Lcolor);
		ckeckres.eq(1).css('background',Mcolor);
		ckeckres.eq(2).css('background',Hcolor);
	});


	// 获取验证码 b标签需定义 for="mobile" url="the url"
	$('.getcode').on('click',function(){

		
		var the = $(this);
		var name = the.attr('for');
		var url = the.attr('url');
		var mobile = the.closest('form').find('input[name='+name+']');


		// 检查url 和name
		if(!url || !name) {return ;}
		// 检查手机号
		if(!mobile.formCheck()){ return ;}

		// 禁止重复点击
		if(the.is('.disabled')) return;
		the.addClass('disabled')

		// 发送手机短信
		$.ajax({
			type: "POST",
			dataType:'json',
			url: url,
			data: "phone=" + mobile.val(),
			success: function(data) {

				// 成功
				if (data.status == 200) {
					var time = 300; //单位秒
					var dom = the.html('倒计时 <b>('+time+')</b>').siblings('i').attr('class','').html('').end().find('b');
					(function(){
						if(time <=0){
							the.removeClass('disabled').html('获取验证码 >');
						}else{
							dom.html(time);
							time --;
							setTimeout(arguments.callee,1000);
						}
					})();

					the.parent().find('i').attr('class','form-note-success').html('');
				// 未过期
				}else if(data.status == 403){
					the.removeClass('disabled').parent().find('i').attr('class','form-note-warn').html(data.message);
				// 失败
				}else {
					the.removeClass('disabled').parent().find('i').attr('class','form-note-warn').html(data.message);
				}
			},
			error:function(){}
		});
		
		return false;

	});


	// 图片上传裁剪
	$('input.js-cutpic').parent().addClass('cutpic').append('<input type="file" name="fuck">').on('change','input[type=file]',function(){
		var the = $(this);

		function imgReady(img){
			var i = $(img);
			var cut = the.siblings('input[type=text]').attr('cutsize').split(',');
			if(i.width()>1000 || i.height()>800){
				alert('图片像素过大，请上传图片宽度小于1000像素，高度小于800像素');
				return false;
			}

			GLOBAL.cutpic = {img:img,width:cut[0],height:cut[1],file:the};
			$.ajax({
				type: "POST",
				url: '/cglib/dialog/cutpic.jsp',
				dataType: "text",
				success: function(text){
					dialog.html(text).dialog('open');
				}
			});
		}

		if(this.value){

			var img =  new Image();
				img.style.position = 'absolute';
				img.style.visibility = 'hidden';
			var getUrl = (function(){
				if (window.createObjectURL != undefined) {
					return function(file){return window.createObjectURL(file);}
				} else if (window.URL != undefined) {
					return function(file){return  window.URL.createObjectURL(file);}
				} else if (window.webkitURL != undefined) {
					return function(file){return window.webkitURL.createObjectURL(file);}
				}
			})();


			if (!/(gif)|(jpeg)|(jpg)|(bmp)|(png)$/.test(this.value.toLowerCase())) {
				alert("选择文件错误,图片类型必须是gif,jpeg,jpg,bmp,png中的一种");
				this.value = "";
				return false;
			}
			try {
				img.src =  getUrl(this.files[0]);
				document.body.appendChild(img);
				img.onload = function(){imgReady(img)};
			} catch (e) {
				this.select();
				if (top != self){window.parent.document.body.focus();}else{this.blur();}
				var src = document.selection.createRange().text;
				document.selection.empty();
				img.style.filter = 'progid:DXImageTransform.Microsoft.AlphaImageLoader(src="'+src+'",sizingMethod="image")';
				img.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
				document.body.appendChild(img);
				imgReady(img);
			}
		}

		return false;
	}).append(function(){
		var val = $(this).find('input.js-cutpic').val();

		var src = val.length>0 ? val : '/images/icon_form_upload.png';
		return '<img src="'+src+'">';
		
		
	});




})



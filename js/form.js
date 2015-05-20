// jquery.form
/*!
 * jQuery Form Plugin
 * version: 3.50.0-2014.02.05
 * Requires jQuery v1.5 or later
 * Copyright (c) 2013 M. Alsup
 * Examples and documentation at: http://malsup.com/jquery/form/*/
!function(a){"use strict";"function"==typeof define&&define.amd?define(["jquery"],a):a("undefined"!=typeof jQuery?jQuery:window.Zepto)}(function(a){"use strict";function d(b){var c=b.data;b.isDefaultPrevented()||(b.preventDefault(),a(b.target).ajaxSubmit(c))}function e(b){var e,f,g,c=b.target,d=a(c);if(!d.is("[type=submit],[type=image]")){if(e=d.closest("[type=submit]"),0===e.length)return;c=e[0]}f=this,f.clk=c,"image"==c.type&&(void 0!==b.offsetX?(f.clk_x=b.offsetX,f.clk_y=b.offsetY):"function"==typeof a.fn.offset?(g=d.offset(),f.clk_x=b.pageX-g.left,f.clk_y=b.pageY-g.top):(f.clk_x=b.pageX-c.offsetLeft,f.clk_y=b.pageY-c.offsetTop)),setTimeout(function(){f.clk=f.clk_x=f.clk_y=null},100)}function f(){if(a.fn.ajaxSubmit.debug){var b="[jquery.form] "+Array.prototype.join.call(arguments,"");window.console&&window.console.log?window.console.log(b):window.opera&&window.opera.postError&&window.opera.postError(b)}}var c,b={};b.fileapi=void 0!==a("<input type='file'/>").get(0).files,b.formdata=void 0!==window.FormData,c=!!a.fn.prop,a.fn.attr2=function(){if(!c)return this.attr.apply(this,arguments);var a=this.prop.apply(this,arguments);return a&&a.jquery||"string"==typeof a?a:this.attr.apply(this,arguments)},a.fn.ajaxSubmit=function(d){function B(b){var g,h,c=a.param(b,d.traditional).split("&"),e=c.length,f=[];for(g=0;e>g;g++)c[g]=c[g].replace(/\+/g," "),h=c[g].split("="),f.push([decodeURIComponent(h[0]),decodeURIComponent(h[1])]);return f}function C(b){var f,g,h,i,c=new FormData;for(f=0;f<b.length;f++)c.append(b[f].name,b[f].value);if(d.extraData)for(g=B(d.extraData),f=0;f<g.length;f++)g[f]&&c.append(g[f][0],g[f][1]);return d.data=null,h=a.extend(!0,{},a.ajaxSettings,d,{contentType:!1,processData:!1,cache:!1,type:e||"POST"}),d.uploadProgress&&(h.xhr=function(){var b=a.ajaxSettings.xhr();return b.upload&&b.upload.addEventListener("progress",function(a){var b=0,c=a.loaded||a.position,e=a.total;a.lengthComputable&&(b=Math.ceil(100*(c/e))),d.uploadProgress(a,c,e,b)},!1),b}),h.data=null,i=h.beforeSend,h.beforeSend=function(a,b){b.data=d.formData?d.formData:c,i&&i.call(this,a,b)},a.ajax(h)}function D(b){function y(a){var b=null;try{a.contentWindow&&(b=a.contentWindow.document)}catch(c){f("cannot get iframe.contentWindow document: "+c)}if(b)return b;try{b=a.contentDocument?a.contentDocument:a.document}catch(c){f("cannot get iframe.contentDocument: "+c),b=a.document}return b}function B(){function j(){try{var a=y(p).readyState;f("state = "+a),a&&"uninitialized"==a.toLowerCase()&&setTimeout(j,50)}catch(b){f("Server abort: ",b," (",b.name,")"),G(x),u&&clearTimeout(u),u=void 0}}var l,m,r,b=i.attr2("target"),c=i.attr2("action"),d="multipart/form-data",h=i.attr("enctype")||i.attr("encoding")||d;g.setAttribute("target",n),(!e||/post/i.test(e))&&g.setAttribute("method","POST"),c!=k.url&&g.setAttribute("action",k.url),k.skipEncodingOverride||e&&!/post/i.test(e)||i.attr({encoding:"multipart/form-data",enctype:"multipart/form-data"}),k.timeout&&(u=setTimeout(function(){t=!0,G(w)},k.timeout)),l=[];try{if(k.extraData)for(m in k.extraData)k.extraData.hasOwnProperty(m)&&(a.isPlainObject(k.extraData[m])&&k.extraData[m].hasOwnProperty("name")&&k.extraData[m].hasOwnProperty("value")?l.push(a('<input type="hidden" name="'+k.extraData[m].name+'">').val(k.extraData[m].value).appendTo(g)[0]):l.push(a('<input type="hidden" name="'+m+'">').val(k.extraData[m]).appendTo(g)[0]));k.iframeTarget||o.appendTo("body"),p.attachEvent?p.attachEvent("onload",G):p.addEventListener("load",G,!1),setTimeout(j,15);try{g.submit()}catch(q){r=document.createElement("form").submit,r.apply(g)}}finally{g.setAttribute("action",c),g.setAttribute("enctype",h),b?g.setAttribute("target",b):i.removeAttr("target"),a(l).remove()}}function G(b){var d,c,e,g,h,i,j,l,n;if(!q.aborted&&!F){if(D=y(p),D||(f("cannot access response document"),b=x),b===w&&q)return q.abort("timeout"),v.reject(q,"timeout"),void 0;if(b==x&&q)return q.abort("server abort"),v.reject(q,"error","server abort"),void 0;if(D&&D.location.href!=k.iframeSrc||t){p.detachEvent?p.detachEvent("onload",G):p.removeEventListener("load",G,!1),c="success";try{if(t)throw"timeout";if(e="xml"==k.dataType||D.XMLDocument||a.isXMLDoc(D),f("isXml="+e),!e&&window.opera&&(null===D.body||!D.body.innerHTML)&&--E)return f("requeing onLoad callback, DOM not available"),setTimeout(G,250),void 0;g=D.body?D.body:D.documentElement,q.responseText=g?g.innerHTML:null,q.responseXML=D.XMLDocument?D.XMLDocument:D,e&&(k.dataType="xml"),q.getResponseHeader=function(a){var b={"content-type":k.dataType};return b[a.toLowerCase()]},g&&(q.status=Number(g.getAttribute("status"))||q.status,q.statusText=g.getAttribute("statusText")||q.statusText),h=(k.dataType||"").toLowerCase(),i=/(json|script|text)/.test(h),i||k.textarea?(j=D.getElementsByTagName("textarea")[0],j?(q.responseText=j.value,q.status=Number(j.getAttribute("status"))||q.status,q.statusText=j.getAttribute("statusText")||q.statusText):i&&(l=D.getElementsByTagName("pre")[0],n=D.getElementsByTagName("body")[0],l?q.responseText=l.textContent?l.textContent:l.innerText:n&&(q.responseText=n.textContent?n.textContent:n.innerText))):"xml"==h&&!q.responseXML&&q.responseText&&(q.responseXML=H(q.responseText));try{C=J(q,h,k)}catch(r){c="parsererror",q.error=d=r||c}}catch(r){f("error caught: ",r),c="error",q.error=d=r||c}q.aborted&&(f("upload aborted"),c=null),q.status&&(c=q.status>=200&&q.status<300||304===q.status?"success":"error"),"success"===c?(k.success&&k.success.call(k.context,C,"success",q),v.resolve(q.responseText,"success",q),m&&a.event.trigger("ajaxSuccess",[q,k])):c&&(void 0===d&&(d=q.statusText),k.error&&k.error.call(k.context,q,c,d),v.reject(q,"error",d),m&&a.event.trigger("ajaxError",[q,k,d])),m&&a.event.trigger("ajaxComplete",[q,k]),m&&!--a.active&&a.event.trigger("ajaxStop"),k.complete&&k.complete.call(k.context,q,c),F=!0,k.timeout&&clearTimeout(u),setTimeout(function(){k.iframeTarget?o.attr("src",k.iframeSrc):o.remove(),q.responseXML=null},100)}}}var h,j,k,m,n,o,p,q,r,s,t,u,w,x,z,A,C,D,F,E,H,I,J,g=i[0],v=a.Deferred();if(v.abort=function(a){q.abort(a)},b)for(j=0;j<l.length;j++)h=a(l[j]),c?h.prop("disabled",!1):h.removeAttr("disabled");return k=a.extend(!0,{},a.ajaxSettings,d),k.context=k.context||k,n="jqFormIO"+(new Date).getTime(),k.iframeTarget?(o=a(k.iframeTarget),s=o.attr2("name"),s?n=s:o.attr2("name",n)):(o=a('<iframe name="'+n+'" src="'+k.iframeSrc+'" />'),o.css({position:"absolute",top:"-1000px",left:"-1000px"})),p=o[0],q={aborted:0,responseText:null,responseXML:null,status:0,statusText:"n/a",getAllResponseHeaders:function(){},getResponseHeader:function(){},setRequestHeader:function(){},abort:function(b){var c="timeout"===b?"timeout":"aborted";f("aborting upload... "+c),this.aborted=1;try{p.contentWindow.document.execCommand&&p.contentWindow.document.execCommand("Stop")}catch(d){}o.attr("src",k.iframeSrc),q.error=c,k.error&&k.error.call(k.context,q,c,b),m&&a.event.trigger("ajaxError",[q,k,c]),k.complete&&k.complete.call(k.context,q,c)}},m=k.global,m&&0===a.active++&&a.event.trigger("ajaxStart"),m&&a.event.trigger("ajaxSend",[q,k]),k.beforeSend&&k.beforeSend.call(k.context,q,k)===!1?(k.global&&a.active--,v.reject(),v):q.aborted?(v.reject(),v):(r=g.clk,r&&(s=r.name,s&&!r.disabled&&(k.extraData=k.extraData||{},k.extraData[s]=r.value,"image"==r.type&&(k.extraData[s+".x"]=g.clk_x,k.extraData[s+".y"]=g.clk_y))),w=1,x=2,z=a("meta[name=csrf-token]").attr("content"),A=a("meta[name=csrf-param]").attr("content"),A&&z&&(k.extraData=k.extraData||{},k.extraData[A]=z),k.forceSync?B():setTimeout(B,10),E=50,H=a.parseXML||function(a,b){return window.ActiveXObject?(b=new ActiveXObject("Microsoft.XMLDOM"),b.async="false",b.loadXML(a)):b=(new DOMParser).parseFromString(a,"text/xml"),b&&b.documentElement&&"parsererror"!=b.documentElement.nodeName?b:null},I=a.parseJSON||function(a){return window["eval"]("("+a+")")},J=function(b,c,d){var e=b.getResponseHeader("content-type")||"",f="xml"===c||!c&&e.indexOf("xml")>=0,g=f?b.responseXML:b.responseText;return f&&"parsererror"===g.documentElement.nodeName&&a.error&&a.error("parsererror"),d&&d.dataFilter&&(g=d.dataFilter(g,c)),"string"==typeof g&&("json"===c||!c&&e.indexOf("json")>=0?g=I(g):("script"===c||!c&&e.indexOf("javascript")>=0)&&a.globalEval(g)),g},v)}var e,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A;if(!this.length)return f("ajaxSubmit: skipping submit process - no element selected"),this;if(i=this,"function"==typeof d?d={success:d}:void 0===d&&(d={}),e=d.type||this.attr2("method"),g=d.url||this.attr2("action"),h="string"==typeof g?a.trim(g):"",h=h||window.location.href||"",h&&(h=(h.match(/^([^#]+)/)||[])[1]),d=a.extend(!0,{url:h,success:a.ajaxSettings.success,type:e||a.ajaxSettings.type,iframeSrc:/^https/i.test(window.location.href||"")?"javascript:false":"about:blank"},d),j={},this.trigger("form-pre-serialize",[this,d,j]),j.veto)return f("ajaxSubmit: submit vetoed via form-pre-serialize trigger"),this;if(d.beforeSerialize&&d.beforeSerialize(this,d)===!1)return f("ajaxSubmit: submit aborted via beforeSerialize callback"),this;if(k=d.traditional,void 0===k&&(k=a.ajaxSettings.traditional),l=[],n=this.formToArray(d.semantic,l),d.data&&(d.extraData=d.data,m=a.param(d.data,k)),d.beforeSubmit&&d.beforeSubmit(n,this,d)===!1)return f("ajaxSubmit: submit aborted via beforeSubmit callback"),this;if(this.trigger("form-submit-validate",[n,this,d,j]),j.veto)return f("ajaxSubmit: submit vetoed via form-submit-validate trigger"),this;for(o=a.param(n,k),m&&(o=o?o+"&"+m:m),"GET"==d.type.toUpperCase()?(d.url+=(d.url.indexOf("?")>=0?"&":"?")+o,d.data=null):d.data=o,p=[],d.resetForm&&p.push(function(){i.resetForm()}),d.clearForm&&p.push(function(){i.clearForm(d.includeHidden)}),!d.dataType&&d.target?(q=d.success||function(){},p.push(function(b){var c=d.replaceTarget?"replaceWith":"html";a(d.target)[c](b).each(q,arguments)})):d.success&&p.push(d.success),d.success=function(a,b,c){var f,g,e=d.context||this;for(f=0,g=p.length;g>f;f++)p[f].apply(e,[a,b,c||i,i])},d.error&&(r=d.error,d.error=function(a,b,c){var e=d.context||this;r.apply(e,[a,b,c,i])}),d.complete&&(s=d.complete,d.complete=function(a,b){var c=d.context||this;s.apply(c,[a,b,i])}),t=a("input[type=file]:enabled",this).filter(function(){return""!==a(this).val()}),u=t.length>0,v="multipart/form-data",w=i.attr("enctype")==v||i.attr("encoding")==v,x=b.fileapi&&b.formdata,f("fileAPI :"+x),y=(u||w)&&!x,d.iframe!==!1&&(d.iframe||y)?d.closeKeepAlive?a.get(d.closeKeepAlive,function(){z=D(n)}):z=D(n):z=(u||w)&&x?C(n):a.ajax(d),i.removeData("jqxhr").data("jqxhr",z),A=0;A<l.length;A++)l[A]=null;return this.trigger("form-submit-notify",[this,d]),this},a.fn.ajaxForm=function(b){if(b=b||{},b.delegation=b.delegation&&a.isFunction(a.fn.on),!b.delegation&&0===this.length){var c={s:this.selector,c:this.context};return!a.isReady&&c.s?(f("DOM not ready, queuing ajaxForm"),a(function(){a(c.s,c.c).ajaxForm(b)}),this):(f("terminating; zero elements found by selector"+(a.isReady?"":" (DOM not ready)")),this)}return b.delegation?(a(document).off("submit.form-plugin",this.selector,d).off("click.form-plugin",this.selector,e).on("submit.form-plugin",this.selector,b,d).on("click.form-plugin",this.selector,b,e),this):this.ajaxFormUnbind().bind("submit.form-plugin",b,d).bind("click.form-plugin",b,e)},a.fn.ajaxFormUnbind=function(){return this.unbind("submit.form-plugin click.form-plugin")},a.fn.formToArray=function(c,d){var f,g,h,i,j,k,l,m,n,o,p,q,r,s,e=[];if(0===this.length)return e;if(f=this[0],g=this.attr("id"),h=c?f.getElementsByTagName("*"):f.elements,h&&!/MSIE [678]/.test(navigator.userAgent)&&(h=a(h).get()),g&&(i=a(":input[form="+g+"]").get(),i.length&&(h=(h||[]).concat(i))),!h||!h.length)return e;for(j=0,o=h.length;o>j;j++)if(n=h[j],l=n.name,l&&!n.disabled)if(c&&f.clk&&"image"==n.type)f.clk==n&&(e.push({name:l,value:a(n).val(),type:n.type}),e.push({name:l+".x",value:f.clk_x},{name:l+".y",value:f.clk_y}));else if(m=a.fieldValue(n,!0),m&&m.constructor==Array)for(d&&d.push(n),k=0,p=m.length;p>k;k++)e.push({name:l,value:m[k]});else if(b.fileapi&&"file"==n.type)if(d&&d.push(n),q=n.files,q.length)for(k=0;k<q.length;k++)e.push({name:l,value:q[k],type:n.type});else e.push({name:l,value:"",type:n.type});else null!==m&&"undefined"!=typeof m&&(d&&d.push(n),e.push({name:l,value:m,type:n.type,required:n.required}));return!c&&f.clk&&(r=a(f.clk),s=r[0],l=s.name,l&&!s.disabled&&"image"==s.type&&(e.push({name:l,value:r.val()}),e.push({name:l+".x",value:f.clk_x},{name:l+".y",value:f.clk_y}))),e},a.fn.formSerialize=function(b){return a.param(this.formToArray(b))},a.fn.fieldSerialize=function(b){var c=[];return this.each(function(){var e,f,g,d=this.name;if(d)if(e=a.fieldValue(this,b),e&&e.constructor==Array)for(f=0,g=e.length;g>f;f++)c.push({name:d,value:e[f]});else null!==e&&"undefined"!=typeof e&&c.push({name:this.name,value:e})}),a.param(c)},a.fn.fieldValue=function(b){var c,d,e,f,g;for(c=[],d=0,e=this.length;e>d;d++)f=this[d],g=a.fieldValue(f,b),null===g||"undefined"==typeof g||g.constructor==Array&&!g.length||(g.constructor==Array?a.merge(c,g):c.push(g));return c},a.fieldValue=function(b,c){var g,h,i,j,k,l,m,n,d=b.name,e=b.type,f=b.tagName.toLowerCase();if(void 0===c&&(c=!0),c&&(!d||b.disabled||"reset"==e||"button"==e||("checkbox"==e||"radio"==e)&&!b.checked||("submit"==e||"image"==e)&&b.form&&b.form.clk!=b||"select"==f&&-1==b.selectedIndex))return null;if("select"==f){if(g=b.selectedIndex,0>g)return null;for(h=[],i=b.options,j="select-one"==e,k=j?g+1:i.length,l=j?g:0;k>l;l++)if(m=i[l],m.selected){if(n=m.value,n||(n=m.attributes&&m.attributes.value&&!m.attributes.value.specified?m.text:m.value),j)return n;h.push(n)}return h}return a(b).val()},a.fn.clearForm=function(b){return this.each(function(){a("input,select,textarea",this).clearFields(b)})},a.fn.clearFields=a.fn.clearInputs=function(b){var c=/^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i;return this.each(function(){var d=this.type,e=this.tagName.toLowerCase();c.test(d)||"textarea"==e?this.value="":"checkbox"==d||"radio"==d?this.checked=!1:"select"==e?this.selectedIndex=-1:"file"==d?/MSIE/.test(navigator.userAgent)?a(this).replaceWith(a(this).clone(!0)):a(this).val(""):b&&(b===!0&&/hidden/.test(d)||"string"==typeof b&&a(this).is(b))&&(this.value="")})},a.fn.resetForm=function(){return this.each(function(){("function"==typeof this.reset||"object"==typeof this.reset&&!this.reset.nodeType)&&this.reset()})},a.fn.enable=function(a){return void 0===a&&(a=!0),this.each(function(){this.disabled=!a})},a.fn.selected=function(b){return void 0===b&&(b=!0),this.each(function(){var d,c=this.type;"checkbox"==c||"radio"==c?this.checked=b:"option"==this.tagName.toLowerCase()&&(d=a(this).parent("select"),b&&d[0]&&"select-one"==d[0].type&&d.find("option").selected(!1),this.selected=b)})},a.fn.ajaxSubmit.debug=!1});


// 表单插件
(function (factory) {
    if (typeof define === "function" && define.amd) {
        // AMD模式
        define(["jquery"], factory);
    } else {
        // 全局模式
        factory(jQuery);
    }
}(function ($) {

	//插件直接写入jquery
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
					dom.parent().siblings('i').attr('class','form-note-warn').html(value);
					opts.failure(the);
				},
				// 错误
				error:function(dom,value){
					dom.parent().siblings('i').attr('class','form-note-error').html(value);
					opts.failure(the);
				},
				// 成功
				success:function(dom,value){
					dom.parent().siblings('i').attr('class','form-note-success').html(value);
					opts.success(the);
				},
				// 等待
				wait:function(dom,value){
					dom.parent().siblings('i').attr('class','form-note-wait').html(value);
				},
				// 取消提示
				notips:function(dom,value){
					dom.parent().siblings('i').attr('class','').html(value);
				}
				
			}

			var rule = {
				// 检测不为空
				required:function(){
					return the.val().length>0 ? false: ['不能为空','warn'];
				},
				
				// 长度验证
				context:function(){
					return the.val().length<90 ? false: ['长度过长','warn'];
				},
				
	
				// 检测为数字
				number:function(){
					return /^\d+$/.test(the.val()) ? false : '必须为数字';
				},
				// 检测邮箱账号
				email:function(){
					return /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+\.){1,63}[a-z0-9]+$/.test(the.val()) ? false : '邮箱格式错误';
				},
				// 检测密码
				password:function(){
					return /^[\d|\w]{6,12}$/.test(the.val()) ? false : '密码必须是6-12位字符只包含字母或数字';
				},
				
				oldpassword:function(){
					return /^[\d|\w]{6,12}$/.test(the.val()) ? false : '密码必须是6-12位字符只包含字母或数字';
				},
				
				newpassword:function(){
					return /^[\d|\w]{6,12}$/.test(the.val()) ? false : '密码必须是6-12位字符只包含字母或数字';
				},
				
				// 检测重复密码
				repassword:function(){
					return the.val() === the.closest('form').find('input[type="password"]').not(the).val() ? false : '密码不一致';
				},
				// 检测手机号码
				phone:function(){
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
					return /^\d{16,19}$|^\d{6}[- ]\d{10,13}$|^\d{4}[- ]\d{4}[- ]\d{4}[- ]\d{4,7}$/.test(the.val()) ? false : '银行卡格式错误';
				},
				changepic:function(){
					return the.val().length>0 ? false: ['请更新图片','warn'];
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
								the.closest('form').find('input[name=username]').val(data.name || '');
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

		//下拉框功能及美化
		beautySelect: function(options){
			var option = {'class':'select','height':200};
			$.extend(option,options);

			
			var box = (function($,option){
				var data;
				//document.getElementById('test').innerHTML = option['class']
				var old_box = $('.'+option['class']+'_box');
				var box =  old_box.length> 0 ? old_box: $('<div/>').addClass(option['class']+'_box').css({'position':'absolute','display':'none'}).appendTo('body');
				


				//禁止选中文字
				(!+[1,])? box.attr('unselectable','on') : box.css({'user-select': 'none'});


				box.on('click','li',function(){
					//console.log('fsefe');
					var the = $(this);
					var idx = the.parent().children('li').index(the);

					if(!the.hasClass('hot') || (data.multiple && data.select.val().length != 1)){

						//改变原控件
						data.select.get(0).selectedIndex = idx;
			    		data.select.trigger("onchange");

						//改变替换控件内容
						//data.replace.children('span').html(the.html());
						//data.replace.find('li').removeClass('hot').eq(idx).addClass('hot');

						data.change = true;
						
					}

				}).on('click','i',function(){

					if(!data.multiple) return true;

					
					var the = $(this);
					var li  = the.parent();
					var list= li.parent().children('li');
					var idx = list.index(li);

					if(li.hasClass('hot')){
						li.removeClass('hot');
						//data.replace.find('li').eq(idx).removeClass('hot');
						data.select.find('option').eq(idx).prop("selected",false);
					}else{
						li.addClass('hot');
						//data.replace.find('li').eq(idx).addClass('hot');
						data.select.find('option').eq(idx).prop("selected",true);
					}


					box.find('b').slideDown(500);
					//data.replace.children('span').html(title.join(','));

					data.change = true;
					
					return false;
				});

				$(document).on('click',function(){

					if(data){
						

						if(data.change) {
							data.select.trigger("change");
							data.change = false;
						}

						data.replace.children('span').removeClass('hot');
						box.hide();
					}
					
				});

				return {
					value : function(val){box.html(val);
					}
					,show : function(d){
						data = d,
						data.change = false;
						select = data.select,
						replace= data.replace;
						body = replace.children('div');

						box.html('<div class="'+body.attr('class')+'">'+ body.html() +'</div>');

						data.replace.children('span').addClass('hot');

						box.css({
							left:replace.offset().left
							,top:replace.offset().top+replace.height()
							,width:replace.innerWidth()
							,'max-height':option['height']
						});

						box.show();

						//禁止滚动
						//$(window).on('mousewheel',function(){return false;});
					}
					,hide : function(){box.hide();}
				}

				/**/
			
			})($,option);




			return this.each(function(){

				var replace,title,body,value
					select 		= $(this),
					multiple 	= !!select.attr('multiple');
					// multiple 	= false;


				//////////////创建
				//如果隐藏，不执行后面，防止多次执行
				// if(select.is(":visible") == false) return false;


				value =(function(select,multiple){
					var title = [],
						body  = [],
						item  = select.find('option'),
						i 	  =0,
						l     = item.length,
						each ,
						html  = '',
						selected = (multiple && select.val()) ? select.val().join('-') : (select.val() ? select.val():'');
							
					for(;i<l;i++){
						each = item.eq(i);
						html = each.html();
						if(selected.indexOf(each.val()) > -1 ){
							title.push(html);
							body.push('<li class="hot">');
						}else{
							body.push('<li>');
						}
						body.push('<i></i>')
						body.push(html);
						body.push('</li>');
					}

					
					if(!multiple){
						title = title[title.length-1];
					} else {
						title = title.join(',');
					}

					body = body.join('');

					return {title:title,body:body}
				})(select,multiple); 



				//新建替换元素
				replace = $('<div/>')
					.addClass(option['class'])
					.addClass(select.attr('name'))
					.css({
						 width:select.innerWidth()
						,height:select.innerHeight()
					});

				
			
				title = $('<span/>').html(value.title).on({
						click: function(e){
							var data = $(this).data();
							data.select.trigger('click');
							box.show({select:data.select,replace:data.replace,multiple:data.multiple});
					        return false;
						},
						//触发select 鼠标经过事件
						hover : function(){select.trigger('hover');}
					}).appendTo(replace).data({select:select,replace:replace,multiple:multiple});

				body = $('<div/>').html(function(){

					var wrap = [];
					if(multiple){
						wrap.push('<strong>全选/全不选</strong><ul>');
						wrap.push(value.body);
						wrap.push('</ul><b>确定</b>');
					}else{
						wrap.push('<ul>');
						wrap.push(value.body);
						wrap.push('</ul>');
					}
					return wrap.join('');

				}).addClass(function(){
					return multiple? option['class']+'_multiple': option['class']+'_radio';
				}).hide().appendTo(replace);

				

				select.on('change',function(){

					var the = $(this);
					var options = the.find('option');
					var replace = the.next('.select');

					var title=[];
					var body = [];

					//select.next('.select').children('div').html(html.replace(/option/g,'li'));

					//var list = replace.find('li');

					for(var i=0,v,l=options.length;i<l;i++){

						v = options.eq(i);
						if(v.prop('selected')){
							body.push('<li class="hot">');
							title.push(v.html());
						}else{
							body.push('<li>');
						}
						body.push(v.html());
						body.push('</li>');

					}

					replace.children('span').html(title.join(''));
					replace.children('div').html('<ul>'+body.join('')+'</ul>');

				});


				select.css('position','absolute').after(replace)
				/**/
			});
		},
		cxSelect: function(settings){

			// 默认值
			var cxSelect = {
				settings: $.extend({
					selects: [], // 下拉选框组
					url: null, // 列表数据文件路径（josn 格式）
					nodata: null, // 无数据状态
					required: true // 是否为必选
					//	firstTitle : '请选择',	// 下拉选框的标题
					//	firstValue : '0'		// 下拉选框的值
				}, settings),
				dom: {
					box: this
				}
			};
			
			cxSelect.init = function(){
				var _this = this;

				// 父容器不存在、未设置选择器组
				if (!_this.dom.box.length) {return};
				if (!_this.settings.selects.length) {return};
				
				_this.selectArray = [];
				_this.selectSum = _this.settings.selects.length;
				
				for (var i = 0; i < _this.selectSum; i++) {
					if (!_this.dom.box.find('select.' + _this.settings.selects[i])) {break};

					_this.selectArray.push(_this.dom.box.find('select.' + _this.settings.selects[i]));
				};

				_this.selectSum = _this.selectArray.length;

				// 设置的选择器组不存在
				if (!_this.selectSum) {return};

				// 设置 URL，通过 Ajax 获取数据
				if (typeof _this.settings.url === 'string') {
					$.getJSON(_this.settings.url, function(json){
						_this.dataJson = json;
						_this.buildContent();
					});

				// 设置自定义数据
				} else if (typeof _this.settings.url === 'object') {
					_this.dataJson = _this.settings.url;
					_this.buildContent();
				};
			};

			// 兼容旧浏览器的方法 
			cxSelect.isArray = function(value){
				if (typeof Array.isArray === "function") {
					return Array.isArray(value);
				} else {
					return Object.prototype.toString.call(value) === "[object Array]";
				}
			}

			cxSelect.getIndex = function(n){
				return (this.settings.required) ? n : n - 1;
			};

			// 获取下拉框内容
			cxSelect.getNewOptions = function(elemJquery, json){
				var _title = this.settings.firstTitle;
				var _value = this.settings.firstValue;
				var _html;
				
				if (typeof elemJquery.data('firstTitle') === 'string' || typeof elemJquery.data('firstTitle') === 'number') {
					_title = elemJquery.data('firstTitle');
				};
				if (typeof elemJquery.data('firstValue') === 'string' || typeof elemJquery.data('firstValue') === 'number') {
					_value = elemJquery.data('firstValue');
				};
				if(!this.settings.required){
					_html='<option value="' + _value + '">' + _title + '</option>';
				};

				$.each(json, function(i, v){
					if(typeof(v.v) === 'string' || typeof(v.v) === 'number'){
						_html += '<option value="'+v.v+'">' + v.n + '</option>';
					}else{
						_html += '<option value="'+v.n+'">' + v.n + '</option>';
					};
				});

				return _html;
			};

			// 构建选框内容
			cxSelect.buildContent = function(){
				var _this = this;

				_this.dom.box.on('change', 'select', function(){
					_this.selectChange(this.className);
				});

				var _html = _this.getNewOptions(_this.selectArray[0], _this.dataJson);
				_this.selectArray[0].html(_html).prop('disabled', false).trigger('change');

				_this.setDefaultValue();
			};

			// 设置默认值
			cxSelect.setDefaultValue = function(n){
				var _this = this;
				n = n || 0;

				if (n >= _this.selectSum) {return};

				if (_this.selectArray[n].data('value') && _this.selectArray[n].data('value').length) {
				
					setTimeout(function(){
						_this.selectArray[n].val(_this.selectArray[n].find('option').filter(function () { return $(this).html() == _this.selectArray[n].data('value'); }).val()).trigger('change');
						n++;
						_this.setDefaultValue(n);
					}, 1);
				};
			};

			// 改变选择时的处理
			cxSelect.selectChange = function(name){
				name = name.replace(/ /g,',');
				name = ',' + name + ',';

				var selectValues=[];
				var selectIndex;
				var selectNext;
				var selectData;
				var _html;
				// 获取当前 select 位置、选择值，并清空后面的 select
				for (var i = 0; i < this.selectSum; i++) {
					selectValues.push(this.getIndex(this.selectArray[i].get(0).selectedIndex));

					// if (typeof selectIndex === 'number' && i > selectIndex) {
					// 	this.selectArray[i].empty().prop('disabled', true);

					// 	if (this.settings.nodata === 'none') {
					// 		this.selectArray[i].css('display', 'none');
					// 	} else if(this.settings.nodata === 'hidden') {
					// 		this.selectArray[i].css('visibility', 'hidden');
					// 	};
					// };

					if (name.indexOf(',' + this.settings.selects[i] + ',') > -1) {
						selectIndex = i;
					};
				};

				// 获取下级的列表数据
				selectNext = selectIndex + 1;
				selectData = this.dataJson;

				for (var i = 0; i < selectNext; i++){
					if (typeof selectData[selectValues[i]]  === 'undefined' || this.isArray(selectData[selectValues[i]].s) === false || !selectData[selectValues[i]].s.length) {
						return;
					};
					selectData = selectData[selectValues[i]].s;
				};

				// 遍历数据写入下拉选框
				if (this.selectArray[selectNext]) {
					_html = this.getNewOptions(this.selectArray[selectNext], selectData);
					//this.selectArray[selectNext].html(_html).prop('disabled', false).css({'display':'', 'visibility':''}).trigger('change');
					this.selectArray[selectNext].html(_html).prop('disabled', false).trigger('change');
				};
			};
			
			cxSelect.init();
		},

		uploadPreview: function(opts) {
			// var _self = this,
			// 	_this = $(this);
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
				if (this.value) {
					if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
						alert("选择文件错误,图片类型必须是" + opts.ImgType.join("，") + "中的一种");
						this.value = "";
						return false;
					}

					try {
						$this.siblings('div').children('img').attr('src', getUrl(this.files[0]));
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

						$this.siblings('div').css('filter','progid:DXImageTransform.Microsoft.AlphaImageLoader(src="'+src+'",sizingMethod=scale)').children('img').hide();

					}
					$this.siblings('em').hide();
					opts.Callback();
				}

			}).each(function(){
				var $this = $(this);
				if( !/icon_form_upload/.test($this.siblings('div').children('img').attr('src'))){
					$this.siblings('em').addClass('form_upload_mark');
				}

			})
		},

		formBeauty:function(opts){
			opts = jQuery.extend({}, opts || {});

			var event = {
				text: function () {
					if(this.value.length>0){
						$(this).siblings('em').hide();
					}else{
						$(this).siblings('em').show();
					}
				},
				checkbox:function(){
					var $this = $(this);
					if($this.prop('checked')){
						$this.addClass('select');
					}else{
						$this.removeClass('select');
					}

				},
				radio:function(){
					var $this = $(this);
					if($this.prop('checked')){
						$this.addClass('select').closest('form').find('input[type="radio"]').filter('[name="'+$this.attr('name')+'"]').not($this).removeClass('select');
					}
				},
				file:function(){
					var $this = $(this);
					if($this.val()){
						$this.siblings('div').find('img').attr('src',$this.val());
					}

				}
			}

		


			if('placeholder' in document.createElement('input')){

				// 文本
				this.find('input[type="text"]').each(function(){
					var the = $(this);
					var placeholder = the.siblings('em')
					the.attr('placeholder',placeholder.text());
					placeholder.hide();
				});

				// 密码
				this.find('input[type="password"]').each(function(){
					var the = $(this);
					var placeholder = the.siblings('em')
					the.attr('placeholder',placeholder.text());
					placeholder.hide();
				});

			}else{

				// 文本
				this.find('input[type="text"]').each(event.text);
				this.on('blur','input[type="text"]',event.text);
				this.on('focus','input[type="text"]',function(){$(this).siblings('em').hide();});

				// 密码
				this.find('input[type="password"]').each(event.text);
				this.on('blur','input[type="password"]',event.text);
				this.on('focus','input[type="password"]',function(){$(this).siblings('em').hide();});
			}



			// 初始化
			this.find('input[type="radio"]').each(event.radio);
			this.find('input[type="checkbox"]').each(event.checkbox);
			this.find('input[type="file"]').not('.nojs').uploadPreview();
			this.find('select').beautySelect({'class':'select','height':300});


			

			// 文本域
			this.on('blur','textarea',event.text);
			this.on('focus','textarea',function(){$(this).siblings('em').hide();});

			


			// 单选
			this.on('click','input[type="radio"]',event.radio);

			// 复选
			this.on('click','input[type="checkbox"]',event.checkbox);

			return this;
		}
	});

    return $;
}));

// $.cxSelect.defaults.url = "/get_province_city_county_json.html";

$(document).ready(function () {

	// 表单美化 
	$('.js-form').formBeauty().find('input,textarea,select').filter('[check]').on('blur',function(){$(this).formCheck()});


	// 城市级联
	$(".js-form-city").cxSelect({
		selects : ["province", "city", "area"],
		nodata : "none",
		url:'/js/cityData.min.json'
	});



	// 密码强度
	$('.checkstrong').on('blur',function(){
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


		var ckeckres = $this.closest('cite').find('.checkstrong_res b');
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

		
		// 发送手机短信
		$.ajax({
			type: "POST",
			dataType:'json',
			url: url,
			data: "mobile=" + mobile.val(),
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
				// 失败
				}else {
					the.removeClass('disabled').siblings('i').attr('class','form-note-warn').html(data.message);
				}
			},
			error:function(){

			}
		});



		// 禁止重复点击
		the.addClass('disabled');
	});



	// 异步表单
	var former;
	$('.js-form-ajax').ajaxForm({
		type:'POST',
		dataType:'json',
		beforeSubmit:function(data,form){
		
			former = form;
			var check = [];
			form.find('input,textarea,select').filter('[check]').filter(':visible').each(function(){
				var the = $(this);
				if(!the.closest('cite').children('i').is('.form-note-success') && !the.formCheck() ){
					check.push(the);
				}

			});

			if(check.length>0){
				check[0].focus();
				return false;
			}
		},
		success: function(data) {
		
			if(data.status && data.status === '200'){
				former.clearForm();
				if(!data.url) return ;
				window.location.href = data.url;
			}else if( data.status === '201'){
				former.clearForm();
				alert(data.message);
				location.reload();
				
			}else{
				alert(data.message);
				
			}


		}

	});
	
	





})


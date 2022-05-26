var isIE = (document.all) ? true : false;

var fn = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
	create: function() {
		return function() { this.initialize.apply(this, arguments); }
	}
}

var Extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
}

var Bind = function(object, fun) {
	var args = Array.prototype.slice.call(arguments).slice(2);
	return function() {
		return fun.apply(object, args);
	}
}

var BindAsEventListener = function(object, fun) {
	return function(event) {
		return fun.call(object, Event(event));
	}
}

function Event(e){
	var oEvent = isIE ? window.event : e;
	if (isIE) {
		oEvent.pageX = oEvent.clientX + document.documentElement.scrollLeft;
		oEvent.pageY = oEvent.clientY + document.documentElement.scrollTop;
		oEvent.preventDefault = function () { this.returnValue = false; };
		oEvent.detail = oEvent.wheelDelta / (-40);
		oEvent.stopPropagation = function(){ this.cancelBubble = true; }; 
	}
	return oEvent;
}

var CurrentStyle = function(element){
	return element.currentStyle || document.defaultView.getComputedStyle(element, null);
}

function addEventHandler(oTarget, sEventType, fnHandler) {
	if (oTarget.addEventListener) {
		oTarget.addEventListener(sEventType, fnHandler, false);
	} else if (oTarget.attachEvent) {
		oTarget.attachEvent("on" + sEventType, fnHandler);
	} else {
		oTarget["on" + sEventType] = fnHandler;
	}
};

function removeEventHandler(oTarget, sEventType, fnHandler) {
    if (oTarget.removeEventListener) {
        oTarget.removeEventListener(sEventType, fnHandler, false);
    } else if (oTarget.detachEvent) {
        oTarget.detachEvent("on" + sEventType, fnHandler);
    } else { 
        oTarget["on" + sEventType] = null;
    }
};


//����������
var Slider = Class.create();
Slider.prototype = {
  //�������󣬻���
  initialize: function(container, bar, options) {
	this.Bar = fn(bar);
	this.Container = fn(container);
	this._timer = null;//�Զ����ƵĶ�ʱ��
	this._ondrag = false;//���ie��click����
	//�Ƿ���Сֵ�����ֵ���м�ֵ
	this._IsMin = this._IsMax = this._IsMid = false;
	//ʵ����һ���ϷŶ��󣬲��޶���Χ
	this._drag = new Drag(this.Bar, { Limit: true, mxContainer: this.Container,
		onStart: Bind(this, this.DragStart), onStop: Bind(this, this.DragStop), onMove: Bind(this, this.Move)
	});
	
	this.SetOptions(options);
	
	this.WheelSpeed = Math.max(0, this.options.WheelSpeed);
	this.KeySpeed = Math.max(0, this.options.KeySpeed);
	
	this.MinValue = this.options.MinValue;
	this.MaxValue = this.options.MaxValue;
	
	this.RunTime = Math.max(1, this.options.RunTime);
	this.RunStep = Math.max(1, this.options.RunStep);
	
	this.Ease = !!this.options.Ease;
	this.EaseStep = Math.max(1, this.options.EaseStep);
	
	this.onMin = this.options.onMin;
	this.onMax = this.options.onMax;
	this.onMid = this.options.onMid;
	
	this.onDragStart = this.options.onDragStart;
	this.onDragStop = this.options.onDragStop;
	
	this.onMove = this.options.onMove;
	
	this._horizontal = !!this.options.Horizontal;//һ�㲻�����޸�
	
	//�����Ϸŷ���
	this._drag[this._horizontal ? "LockY" : "LockX"] = true;
	
	//�������
	addEventHandler(this.Container, "click", BindAsEventListener(this, function(e){ this._ondrag || this.ClickCtrl(e);}));
	//ȡ��ð�ݣ���ֹ��Container��click��ͻ
	addEventHandler(this.Bar, "click", BindAsEventListener(this, function(e){ e.stopPropagation(); }));
	
	//���������ֿ���
	this.WheelBind(this.Container);
	//���÷��������
	this.KeyBind(this.Container);
	//������ȡ����
	var oFocus = isIE ? (this.KeyBind(this.Bar), this.Bar) : this.Container;
	addEventHandler(this.Bar, "mousedown", function(){ oFocus.focus(); });
	//ie��겶���ff��ȡ��Ĭ�϶��������ܻ�ý��㣬����Ҫ�ֶ���ȡ
	//���ie��focus���õ�Container����ô�ڳ��ֹ�����ʱie��focus���ܻᵼ���Զ�����
  },
  //����Ĭ������
  SetOptions: function(options) {
	this.options = {//Ĭ��ֵ
		MinValue:	0,//��Сֵ
		MaxValue:	100,//���ֵ
		WheelSpeed: 5,//�������ٶ�,Խ��Խ��(0��ȡ�������ֿ���)
		KeySpeed: 	50,//����������ٶ�,Խ��Խ��(0��ȡ�����������)
		Horizontal:	true,//�Ƿ�ˮƽ����
		RunTime:	20,//�Զ����Ƶ���ʱʱ��,Խ��Խ��
		RunStep:	2,//�Զ�����ÿ�λ����İٷֱ�
		Ease:		false,//�Ƿ񻺶�
		EaseStep:	5,//�����ȼ�,Խ��Խ��
		onMin:		function(){},//��Сֵʱִ��
		onMax:		function(){},//���ֵʱִ��
		onMid:		function(){},//�м�ֵʱִ��
		onDragStart:function(){},//�϶���ʼʱִ��
		onDragStop:	function(){},//�϶�����ʱִ��
		onMove:		function(){}//����ʱִ��
	};
	Extend(this.options, options || {});
  },
  //��ʼ�ϷŻ���
  DragStart: function() {
  	this.onDragStart();
	this._ondrag = true;
  },
  //�����ϷŻ���
  DragStop: function() {
  	this.onDragStop();
	setTimeout(Bind(this, function(){ this._ondrag = false; }), 10);
  },
  //������
  Move: function() {
  	this.onMove();
	
	var percent = this.GetPercent();
	//��Сֵ�ж�
	if(percent > 0){
		this._IsMin = false;
	}else{
		if(!this._IsMin){ this.onMin(); this._IsMin = true; }
	}
	//���ֵ�ж�
	if(percent < 1){
		this._IsMax = false;
	}else{
		if(!this._IsMax){ this.onMax(); this._IsMax = true; }
	}
	//�м�ֵ�ж�
	if(percent > 0 && percent < 1){
		if(!this._IsMid){ this.onMid(); this._IsMid = true; }
	}else{
		this._IsMid = false;
	}
  },
  //���������
  ClickCtrl: function(e) {
	var o = this.Container, iLeft = o.offsetLeft, iTop = o.offsetTop;
	while (o.offsetParent) { o = o.offsetParent; iLeft += o.offsetLeft; iTop += o.offsetTop; }
	//�����й�������Ҫ��pageX��pageY
	this.EasePos(e.pageX - iLeft - this.Bar.offsetWidth / 2, e.pageY - iTop - this.Bar.offsetHeight / 2);
  },
  //�����ֿ���
  WheelCtrl: function(e) {
	var i = this.WheelSpeed * e.detail;
	this.SetPos(this.Bar.offsetLeft + i, this.Bar.offsetTop + i);
	//��ֹ��������������
	e.preventDefault();
  },
  //��������
  WheelBind: function(o) {
  	//�����ֿ���
	addEventHandler(o, isIE ? "mousewheel" : "DOMMouseScroll", BindAsEventListener(this, this.WheelCtrl));
  },
  //���������
  KeyCtrl: function(e) {
	if(this.KeySpeed){
		var iLeft = this.Bar.offsetLeft, iWidth = (this.Container.clientWidth - this.Bar.offsetWidth) / this.KeySpeed
			, iTop = this.Bar.offsetTop, iHeight = (this.Container.clientHeight - this.Bar.offsetHeight) / this.KeySpeed;
		//���ݰ�������ֵ
		switch (e.keyCode) {
			case 37 ://��
				iLeft -= iWidth; break;
			case 38 ://��
				iTop -= iHeight; break;
			case 39 ://��
				iLeft += iWidth; break;
			case 40 ://��
				iTop += iHeight; break;
			default :
				return;//���Ƿ��򰴼�����
		}
		this.SetPos(iLeft, iTop);
		//��ֹ��������������
		e.preventDefault();
	}
  },
  //�󶨷����
  KeyBind: function(o) {
	addEventHandler(o, "keydown", BindAsEventListener(this, this.KeyCtrl));
	//����tabIndexʹ���ö�����֧��focus
	o.tabIndex = -1;
	//ȡ��focusʱ���ֵ����߿�
	isIE || (o.style.outline = "none");
  },
  //��ȡ��ǰֵ
  GetValue: function() {
	//���������Сֵ�ͻ����ٷֱ�ȡֵ
	return this.MinValue + this.GetPercent() * (this.MaxValue - this.MinValue);
  },
  //����ֵλ��
  SetValue: function(value) {
	//���������Сֵ�Ͳ���ֵ���û���λ��
	this.SetPercent((value- this.MinValue)/(this.MaxValue - this.MinValue));
  },
  //��ȡ�ٷֱ�
  GetPercent: function() {
	//���ݻ���������ȡ�ٷֱ�
	return this._horizontal ? this.Bar.offsetLeft / (this.Container.clientWidth - this.Bar.offsetWidth)
		: this.Bar.offsetTop / (this.Container.clientHeight - this.Bar.offsetHeight)
  },
  //���ðٷֱ�λ��
  SetPercent: function(value) {
	//���ݰٷֱ����û���λ��
	this.EasePos((this.Container.clientWidth - this.Bar.offsetWidth) * value, (this.Container.clientHeight - this.Bar.offsetHeight) * value);
  },
  //�Զ�����(�Ƿ����)
  Run: function(bIncrease) {
	this.Stop();
	//����һ��bIncrease
	bIncrease = !!bIncrease;
	//�����Ƿ����������ֵ
	var percent = this.GetPercent() + (bIncrease ? 1 : -1) * this.RunStep / 100;
	this.SetPos((this.Container.clientWidth - this.Bar.offsetWidth) * percent, (this.Container.clientHeight - this.Bar.offsetHeight) * percent);
	//���û�е�����ֵ�ͼ�������
	if(!(bIncrease ? this._IsMax : this._IsMin)){
		this._timer = setTimeout(Bind(this, this.Run, bIncrease), this.RunTime);
	}
  },
  //ֹͣ����
  Stop: function() {
	clearTimeout(this._timer);
  },
  //��������
  EasePos: function(iLeftT, iTopT) {
	this.Stop();
	//���������������������ѭ��
	iLeftT = Math.round(iLeftT); iTopT = Math.round(iTopT);
	//���û�����û���
	if(!this.Ease){ this.SetPos(iLeftT, iTopT); return; }
	//��ȡ��������
	var iLeftN = this.Bar.offsetLeft, iLeftS = this.GetStep(iLeftT, iLeftN)
	, iTopN = this.Bar.offsetTop, iTopS = this.GetStep(iTopT, iTopN);
	//���������ֵ
	if(this._horizontal ? iLeftS : iTopS){
		//����λ��
		this.SetPos(iLeftN + iLeftS, iTopN + iTopS);
		//���û�е�����ֵ���������
		if(this._IsMid){ this._timer = setTimeout(Bind(this, this.EasePos, iLeftT, iTopT), this.RunTime); }
	}
  },
  //��ȡ����
  GetStep: function(iTarget, iNow) {
    var iStep = (iTarget - iNow) / this.EaseStep;
    if (iStep == 0) return 0;
    if (Math.abs(iStep) < 1) return (iStep > 0 ? 1 : -1);
    return iStep;
  },
  //���û���λ��
  SetPos: function(iLeft, iTop) {
	this.Stop();
	this._drag.SetPos(iLeft, iTop);
  }
};

//�Ϸų���
var Drag = Class.create();
Drag.prototype = {
  //�ϷŶ���
  initialize: function(drag, options) {
	this.Drag = fn(drag);//�ϷŶ���
	this._x = this._y = 0;//��¼�������ϷŶ����λ��
	this._marginLeft = this._marginTop = 0;//��¼margin
	//�¼�����(���ڰ��Ƴ��¼�)
	this._fM = BindAsEventListener(this, this.Move);
	this._fS = Bind(this, this.Stop);
	
	this.SetOptions(options);
	
	this.Limit = !!this.options.Limit;
	this.mxLeft = parseInt(this.options.mxLeft);
	this.mxRight = parseInt(this.options.mxRight);
	this.mxTop = parseInt(this.options.mxTop);
	this.mxBottom = parseInt(this.options.mxBottom);
	
	this.LockX = !!this.options.LockX;
	this.LockY = !!this.options.LockY;
	this.Lock = !!this.options.Lock;
	
	this.onStart = this.options.onStart;
	this.onMove = this.options.onMove;
	this.onStop = this.options.onStop;
	
	this._Handle = fn(this.options.Handle) || this.Drag;
	this._mxContainer = fn(this.options.mxContainer) || null;
	
	this.Drag.style.position = "absolute";
	//͸��
	if(isIE && !!this.options.Transparent){
		//����ϷŶ���
		with(this._Handle.appendChild(document.createElement("div")).style){
			width = height = "100%"; backgroundColor = "#fff"; filter = "alpha(opacity:0)"; fontSize = 0;
		}
	}
	//������Χ
	this.Repair();
	addEventHandler(this._Handle, "mousedown", BindAsEventListener(this, this.Start));
  },
  //����Ĭ������
  SetOptions: function(options) {
	this.options = {//Ĭ��ֵ
		Handle:			"",//���ô������󣨲�������ʹ���ϷŶ���
		Limit:			false,//�Ƿ����÷�Χ����(Ϊtrueʱ�����������,�����Ǹ���)
		mxLeft:			0,//�������
		mxRight:		9999,//�ұ�����
		mxTop:			0,//�ϱ�����
		mxBottom:		9999,//�±�����
		mxContainer:	"",//ָ��������������
		LockX:			false,//�Ƿ�����ˮƽ�����Ϸ�
		LockY:			false,//�Ƿ�������ֱ�����Ϸ�
		Lock:			false,//�Ƿ�����
		Transparent:	false,//�Ƿ�͸��
		onStart:		function(){},//��ʼ�ƶ�ʱִ��
		onMove:			function(){},//�ƶ�ʱִ��
		onStop:			function(){}//�����ƶ�ʱִ��
	};
	Extend(this.options, options || {});
  },
  //׼���϶�
  Start: function(oEvent) {
	if(this.Lock){ return; }
	this.Repair();
	//��¼�������ϷŶ����λ��
	this._x = oEvent.clientX - this.Drag.offsetLeft;
	this._y = oEvent.clientY - this.Drag.offsetTop;
	//��¼margin
	this._marginLeft = parseInt(CurrentStyle(this.Drag).marginLeft) || 0;
	this._marginTop = parseInt(CurrentStyle(this.Drag).marginTop) || 0;
	//mousemoveʱ�ƶ� mouseupʱֹͣ
	addEventHandler(document, "mousemove", this._fM);
	addEventHandler(document, "mouseup", this._fS);
	if(isIE){
		//���㶪ʧ
		addEventHandler(this._Handle, "losecapture", this._fS);
		//������겶��
		this._Handle.setCapture();
	}else{
		//���㶪ʧ
		addEventHandler(window, "blur", this._fS);
		//��ֹĬ�϶���
		oEvent.preventDefault();
	};
	//���ӳ���
	this.onStart();
  },
  //������Χ
  Repair: function() {
	if(this.Limit){
		//��������Χ����
		this.mxRight = Math.max(this.mxRight, this.mxLeft + this.Drag.offsetWidth);
		this.mxBottom = Math.max(this.mxBottom, this.mxTop + this.Drag.offsetHeight);
		//�����������������positionΪrelative����Զ�λ�����ڻ�ȡoffset֮ǰ����
		!this._mxContainer || CurrentStyle(this._mxContainer).position == "relative" || CurrentStyle(this._mxContainer).position == "absolute" || (this._mxContainer.style.position = "relative");
	}
  },
  //�϶�
  Move: function(oEvent) {
	//�ж��Ƿ�����
	if(this.Lock){ this.Stop(); return; };
	//���ѡ��
	window.getSelection ? window.getSelection().removeAllRanges() : document.selection.empty();
	//�����ƶ�����
	this.SetPos(oEvent.clientX - this._x, oEvent.clientY - this._y);
  },
  //����λ��
  SetPos: function(iLeft, iTop) {
	//���÷�Χ����
	if(this.Limit){
		//���÷�Χ����
		var mxLeft = this.mxLeft, mxRight = this.mxRight, mxTop = this.mxTop, mxBottom = this.mxBottom;
		//�����������������������Χ����
		if(!!this._mxContainer){
			mxLeft = Math.max(mxLeft, 0);
			mxTop = Math.max(mxTop, 0);
			mxRight = Math.min(mxRight, this._mxContainer.clientWidth);
			mxBottom = Math.min(mxBottom, this._mxContainer.clientHeight);
		};
		//�����ƶ�����
		iLeft = Math.max(Math.min(iLeft, mxRight - this.Drag.offsetWidth), mxLeft);
		iTop = Math.max(Math.min(iTop, mxBottom - this.Drag.offsetHeight), mxTop);
	}
	//����λ�ã�������margin
	if(!this.LockX){ this.Drag.style.left = iLeft - this._marginLeft + "px"; }
	if(!this.LockY){ this.Drag.style.top = iTop - this._marginTop + "px"; }
	//���ӳ���
	this.onMove();
  },
  //ֹͣ�϶�
  Stop: function() {
	//�Ƴ��¼�
	removeEventHandler(document, "mousemove", this._fM);
	removeEventHandler(document, "mouseup", this._fS);
	if(isIE){
		removeEventHandler(this._Handle, "losecapture", this._fS);
		this._Handle.releaseCapture();
	}else{
		removeEventHandler(window, "blur", this._fS);
	};
	//���ӳ���
	this.onStop();
  }
};
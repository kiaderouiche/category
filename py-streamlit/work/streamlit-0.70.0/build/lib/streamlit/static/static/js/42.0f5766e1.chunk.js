(this["webpackJsonpstreamlit-browser"]=this["webpackJsonpstreamlit-browser"]||[]).push([[42],{2289:function(e,t,a){"use strict";a.r(t);var r=a(4),n=a(3),l=a(7),i=a(131),s=a(16),u=a(17),o=a(0),c=a.n(o),d=a(2293),m=a(1045),p=a(9),f=a(23),v=a(36),h=a(83),b=a.n(h),g=function(e){Object(s.a)(a,e);var t=Object(u.a)(a);function a(e){var l;return Object(n.a)(this,a),(l=t.call(this,e)).state=void 0,l.sliderRef=c.a.createRef(),l.setWidgetValueDebounced=void 0,l.componentDidMount=function(){l.getAllSliderRoles().forEach((function(e,t){e.addEventListener("click",l.handleClick),l.setAriaValueText(e,t)})),l.setWidgetValueImmediately({fromUi:!1})},l.componentDidUpdate=function(){l.getAllSliderRoles().forEach((function(e,t){l.setAriaValueText(e,t)}))},l.componentWillUnmount=function(){l.getAllSliderRoles().forEach((function(e){e.removeEventListener("click",l.handleClick)}))},l.setWidgetValueImmediately=function(e){var t=l.props.element.id;l.props.widgetMgr.setFloatArrayValue(t,l.state.value,e)},l.getAllSliderRoles=function(){if(!l.sliderRef.current)return[];var e=l.sliderRef.current.querySelectorAll('[role="slider"]');return Array.from(e)},l.setAriaValueText=function(e,t){if(l.props.element.options.length>0||l.isDateTimeType()){var a=Object(i.a)(l).value;t<a.length&&e.setAttribute("aria-valuetext",l.formatValue(a[t]))}},l.handleChange=function(e){var t=e.value;l.setState({value:t},(function(){return l.setWidgetValueDebounced({fromUi:!0})}))},l.handleClick=function(e){e.target.focus()},l.renderThumbValue=function(e){var t=f.j.ThumbValue.style({$disabled:l.props.disabled});return c.a.createElement("div",{style:t},l.formatValue(e.$value[e.$thumbIndex]))},l.renderTickBar=function(){var e=l.props.element,t=e.max,a=e.min,r=f.j.TickBarItem.style;return c.a.createElement("div",{className:"sliderTickBar",style:f.j.TickBar.style},c.a.createElement("div",{className:"tickBarMin",style:r},l.formatValue(a)),c.a.createElement("div",{className:"tickBarMax",style:r},l.formatValue(t)))},l.render=function(){var e={width:l.props.width};return c.a.createElement("div",{ref:l.sliderRef,className:"Widget stSlider",style:e},c.a.createElement("label",null,l.props.element.label),c.a.createElement(d.a,{min:l.props.element.min,max:l.props.element.max,step:l.props.element.step,value:l.value,onChange:l.handleChange,disabled:l.props.disabled,overrides:Object(r.a)(Object(r.a)({},f.j),{},{ThumbValue:l.renderThumbValue,TickBar:l.renderTickBar})}))},l.setWidgetValueDebounced=Object(v.a)(200,l.setWidgetValueImmediately.bind(Object(i.a)(l))),l.state={value:l.initialValue},l}return Object(l.a)(a,[{key:"isDateTimeType",value:function(){var e=this.props.element.dataType;return e===p.n.DataType.DATETIME||e===p.n.DataType.DATE||e===p.n.DataType.TIME}},{key:"formatValue",value:function(e){var t=this.props.element,a=t.format,r=t.options;return this.isDateTimeType()?b()(e/1e3).format(a):r.length>0?Object(m.sprintf)(a,r[e]):Object(m.sprintf)(a,e)}},{key:"initialValue",get:function(){var e=this.props.element.id,t=this.props.widgetMgr.getFloatArrayValue(e);return void 0!==t?t:this.props.element.default}},{key:"value",get:function(){var e=this.props.element,t=e.min,a=e.max,r=this.state.value,n=r[0],l=r.length>1?r[1]:r[0];return n>l&&(n=l),n<t&&(n=t),n>a&&(n=a),l<t&&(l=t),l>a&&(l=a),r.length>1?[n,l]:[n]}}]),a}(c.a.PureComponent);a.d(t,"default",(function(){return g}))}}]);
//# sourceMappingURL=42.0f5766e1.chunk.js.map
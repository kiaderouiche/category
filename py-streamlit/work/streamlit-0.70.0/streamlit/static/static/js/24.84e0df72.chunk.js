(this["webpackJsonpstreamlit-browser"]=this["webpackJsonpstreamlit-browser"]||[]).push([[24],{1268:function(e,t,a){},1272:function(e,t,a){"use strict";var n=a(134),r=a(0),i=a.n(r),l=a(1140),o=a(89),s=a(1509);a(1268);function u(e){var t=e.data,a=e.index,r=e.style,o=t[a].props,s=o.item,u=(o.overrides,Object(n.a)(o,["item","overrides"]));return i.a.createElement(l.e,Object.assign({key:s.value,className:"dropdownListItem",style:r},u),i.a.createElement("span",{className:"noTextOverflow"},s.label))}var c=i.a.forwardRef((function(e,t){var a=i.a.Children.toArray(e.children);if(!a[0]||!a[0].props.item){var n=a[0]?a[0].props:{};return i.a.createElement(o.b,{$style:{height:"".concat(90,"px")},ref:t},i.a.createElement(o.a,n))}var r=Math.min(300,40*a.length);return i.a.createElement(o.b,{ref:t},i.a.createElement(s.FixedSizeList,{width:"100%",height:r,itemCount:a.length,itemData:a,itemKey:function(e,t){return t[e].props.item.value},itemSize:40},u))}));c.displayName="VirtualDropdown";var p=c;a.d(t,"a",(function(){return p}))},2288:function(e,t,a){"use strict";a.r(t);var n=a(33),r=a(3),i=a(7),l=a(16),o=a(17),s=a(0),u=a.n(s),c=a(2267),p=a(5),d=a(1272),v=function(e){Object(l.a)(a,e);var t=Object(o.a)(a);function a(){var e;Object(r.a)(this,a);for(var i=arguments.length,l=new Array(i),o=0;o<i;o++)l[o]=arguments[o];return(e=t.call.apply(t,[this].concat(l))).state={value:e.initialValue},e.setWidgetValue=function(t){var a=e.props.element.id;e.props.widgetMgr.setIntValue(a,e.state.value,t)},e.onChange=function(t){if(0!==t.value.length){var a=Object(n.a)(t.value,1)[0];e.setState({value:parseInt(a.value,10)},(function(){return e.setWidgetValue({fromUi:!0})}))}else Object(p.d)("No value selected!")},e.filterOptions=function(e,t){return e.filter((function(e){return e.label.toLowerCase().includes(t.toString().toLowerCase())}))},e.render=function(){var t={width:e.props.width},a=e.props.element.options,n=e.props.disabled,r=[{label:a.length>0?a[e.state.value]:"No options to select.",value:e.state.value.toString()}];0===a.length&&(a=["No options to select."],n=!0);var i=[];return a.forEach((function(e,t){return i.push({label:e,value:t.toString()})})),u.a.createElement("div",{className:"Widget row-widget stSelectbox",style:t},u.a.createElement("label",null,e.props.element.label),u.a.createElement(c.a,{clearable:!1,disabled:n,labelKey:"label",onChange:e.onChange,options:i,filterOptions:e.filterOptions,value:r,valueKey:"value",overrides:{Dropdown:{component:d.a}}}))},e}return Object(i.a)(a,[{key:"componentDidMount",value:function(){this.setWidgetValue({fromUi:!1})}},{key:"initialValue",get:function(){var e=this.props.element.id,t=this.props.widgetMgr.getIntValue(e);return void 0!==t?t:this.props.element.default}}]),a}(u.a.PureComponent);a.d(t,"default",(function(){return v}))}}]);
//# sourceMappingURL=24.84e0df72.chunk.js.map
/*!
 * Copyright (c) 2012 - 2020, Anaconda, Inc., and Bokeh Contributors
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * 
 * Neither the name of Anaconda nor the names of any contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
*/
(function(root, factory) {
  factory(root["Bokeh"], undefined);
})(this, function(Bokeh, version) {
  var define;
  return (function(modules, entry, aliases, externals) {
    const bokeh = typeof Bokeh !== "undefined" && (version != null ? Bokeh[version] : Bokeh);
    if (bokeh != null) {
      return bokeh.register_plugin(modules, entry, aliases);
    } else {
      throw new Error("Cannot find Bokeh " + version + ". You have to load it prior to loading plugins.");
    }
  })
({
"4e90918c0a": /* index.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const Panel = tslib_1.__importStar(require("c4b9651916") /* ./models */);
    exports.Panel = Panel;
    const base_1 = require("@bokehjs/base");
    base_1.register_models(Panel);
},
"c4b9651916": /* models/index.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    var ace_1 = require("abb1112c2c") /* ./ace */;
    exports.AcePlot = ace_1.AcePlot;
    var audio_1 = require("66d52165db") /* ./audio */;
    exports.Audio = audio_1.Audio;
    var card_1 = require("0106b0a1bf") /* ./card */;
    exports.Card = card_1.Card;
    var comm_manager_1 = require("684c940c17") /* ./comm_manager */;
    exports.CommManager = comm_manager_1.CommManager;
    var deckgl_1 = require("d0d2aafca0") /* ./deckgl */;
    exports.DeckGLPlot = deckgl_1.DeckGLPlot;
    var echarts_1 = require("c6decbe3f5") /* ./echarts */;
    exports.ECharts = echarts_1.ECharts;
    var html_1 = require("ed08037ce5") /* ./html */;
    exports.HTML = html_1.HTML;
    var ipywidget_1 = require("cb7ac8d1fa") /* ./ipywidget */;
    exports.IPyWidget = ipywidget_1.IPyWidget;
    var json_1 = require("284504a0cf") /* ./json */;
    exports.JSON = json_1.JSON;
    var file_download_1 = require("7a99dba4eb") /* ./file_download */;
    exports.FileDownload = file_download_1.FileDownload;
    var katex_1 = require("7b859fb3cf") /* ./katex */;
    exports.KaTeX = katex_1.KaTeX;
    var location_1 = require("aded270681") /* ./location */;
    exports.Location = location_1.Location;
    var mathjax_1 = require("0c21036737") /* ./mathjax */;
    exports.MathJax = mathjax_1.MathJax;
    var player_1 = require("79c41bbf71") /* ./player */;
    exports.Player = player_1.Player;
    var plotly_1 = require("47b5ae5c43") /* ./plotly */;
    exports.PlotlyPlot = plotly_1.PlotlyPlot;
    var progress_1 = require("765e9cea08") /* ./progress */;
    exports.Progress = progress_1.Progress;
    var singleselect_1 = require("ff9dd91f7b") /* ./singleselect */;
    exports.SingleSelect = singleselect_1.SingleSelect;
    var state_1 = require("38b2bc9574") /* ./state */;
    exports.State = state_1.State;
    var vega_1 = require("294adeb985") /* ./vega */;
    exports.VegaPlot = vega_1.VegaPlot;
    var video_1 = require("b0c3e9e9c2") /* ./video */;
    exports.Video = video_1.Video;
    var videostream_1 = require("3c7145a2fa") /* ./videostream */;
    exports.VideoStream = videostream_1.VideoStream;
    tslib_1.__exportStar(require("c51f25e2a7") /* ./vtk */, exports);
},
"abb1112c2c": /* models/ace.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const dom_1 = require("@bokehjs/core/dom");
    const layout_1 = require("7116a7a602") /* ./layout */;
    function ID() {
        // Math.random should be unique because of its seeding algorithm.
        // Convert it to base 36 (numbers + letters), and grab the first 9 characters
        // after the decimal.
        return '_' + Math.random().toString(36).substr(2, 9);
    }
    class AcePlotView extends layout_1.PanelHTMLBoxView {
        initialize() {
            super.initialize();
            this._ace = window.ace;
            this._container = dom_1.div({
                id: ID(),
                style: {
                    width: "100%",
                    height: "100%"
                }
            });
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.code.change, () => this._update_code_from_model());
            this.connect(this.model.properties.theme.change, () => this._update_theme());
            this.connect(this.model.properties.language.change, () => this._update_language());
            this.connect(this.model.properties.filename.change, () => this._update_filename());
            this.connect(this.model.properties.print_margin.change, () => this._update_print_margin());
            this.connect(this.model.properties.annotations.change, () => this._add_annotations());
            this.connect(this.model.properties.readonly.change, () => {
                this._editor.setReadOnly(this.model.readonly);
            });
        }
        render() {
            super.render();
            if (!(this._container === this.el.childNodes[0]))
                this.el.appendChild(this._container);
            this._container.textContent = this.model.code;
            this._editor = this._ace.edit(this._container.id);
            this._langTools = this._ace.require('ace/ext/language_tools');
            this._modelist = this._ace.require("ace/ext/modelist");
            this._editor.setOptions({
                enableBasicAutocompletion: true,
                enableSnippets: true,
                fontFamily: "monospace",
            });
            this._update_theme();
            this._update_filename();
            this._update_language();
            this._editor.setReadOnly(this.model.readonly);
            this._editor.setShowPrintMargin(this.model.print_margin);
            this._editor.on('change', () => this._update_code_from_editor());
        }
        _update_code_from_model() {
            if (this._editor && this._editor.getValue() != this.model.code)
                this._editor.setValue(this.model.code);
        }
        _update_print_margin() {
            this._editor.setShowPrintMargin(this.model.print_margin);
        }
        _update_code_from_editor() {
            if (this._editor.getValue() != this.model.code) {
                this.model.code = this._editor.getValue();
            }
        }
        _update_theme() {
            this._editor.setTheme("ace/theme/" + `${this.model.theme}`);
        }
        _update_filename() {
            if (this.model.filename) {
                const mode = this._modelist.getModeForPath(this.model.filename).mode;
                this.model.language = mode.slice(9);
            }
        }
        _update_language() {
            if (this.model.language != null) {
                this._editor.session.setMode("ace/mode/" + `${this.model.language}`);
            }
        }
        _add_annotations() {
            this._editor.session.setAnnotations(this.model.annotations);
        }
        after_layout() {
            super.after_layout();
            this._editor.resize();
        }
    }
    exports.AcePlotView = AcePlotView;
    AcePlotView.__name__ = "AcePlotView";
    class AcePlot extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_AcePlot() {
            this.prototype.default_view = AcePlotView;
            this.define({
                code: [p.String],
                filename: [p.String],
                language: [p.String],
                theme: [p.String, 'chrome'],
                annotations: [p.Array, []],
                readonly: [p.Boolean, false],
                print_margin: [p.Boolean, false]
            });
            this.override({
                height: 300,
                width: 300
            });
        }
    }
    exports.AcePlot = AcePlot;
    AcePlot.__name__ = "AcePlot";
    AcePlot.__module__ = "panel.models.ace";
    AcePlot.init_AcePlot();
},
"7116a7a602": /* models/layout.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const html_1 = require("@bokehjs/core/layout/html");
    const types_1 = require("@bokehjs/core/layout/types");
    const dom_1 = require("@bokehjs/core/dom");
    const markup_1 = require("@bokehjs/models/widgets/markup");
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    function set_size(el, model) {
        let width_policy = model.width != null ? "fixed" : "fit";
        let height_policy = model.height != null ? "fixed" : "fit";
        const { sizing_mode } = model;
        if (sizing_mode != null) {
            if (sizing_mode == "fixed")
                width_policy = height_policy = "fixed";
            else if (sizing_mode == "stretch_both")
                width_policy = height_policy = "max";
            else if (sizing_mode == "stretch_width")
                width_policy = "max";
            else if (sizing_mode == "stretch_height")
                height_policy = "max";
            else {
                switch (sizing_mode) {
                    case "scale_width":
                        width_policy = "max";
                        height_policy = "min";
                        break;
                    case "scale_height":
                        width_policy = "min";
                        height_policy = "max";
                        break;
                    case "scale_both":
                        width_policy = "max";
                        height_policy = "max";
                        break;
                    default:
                        throw new Error("unreachable");
                }
            }
        }
        if (width_policy == "fixed" && model.width)
            el.style.width = model.width + "px";
        else if (width_policy == "max")
            el.style.width = "100%";
        if (height_policy == "fixed" && model.height)
            el.style.height = model.height + "px";
        else if (height_policy == "max")
            el.style.height = "100%";
    }
    exports.set_size = set_size;
    class CachedVariadicBox extends html_1.VariadicBox {
        constructor(el, sizing_mode, changed) {
            super(el);
            this.el = el;
            this.sizing_mode = sizing_mode;
            this.changed = changed;
            this._cache = new Map();
            this._cache_count = new Map();
        }
        _measure(viewport) {
            const key = [viewport.width, viewport.height, this.sizing_mode];
            const key_str = key.toString();
            // If sizing mode is responsive and has changed since last render
            // we have to wait until second rerender to use cached value
            const min_count = (!this.changed || (this.sizing_mode == 'fixed') || (this.sizing_mode == null)) ? 0 : 1;
            const cached = this._cache.get(key_str);
            const cache_count = this._cache_count.get(key_str);
            if (cached != null && cache_count != null && (cache_count >= min_count)) {
                this._cache_count.set(key_str, cache_count + 1);
                return cached;
            }
            const bounded = new types_1.Sizeable(viewport).bounded_to(this.sizing.size);
            const size = dom_1.sized(this.el, bounded, () => {
                const content = new types_1.Sizeable(dom_1.content_size(this.el));
                const { border, padding } = dom_1.extents(this.el);
                return content.grow_by(border).grow_by(padding).map(Math.ceil);
            });
            this._cache.set(key_str, size);
            this._cache_count.set(key_str, 0);
            return size;
        }
        invalidate_cache() {
        }
    }
    exports.CachedVariadicBox = CachedVariadicBox;
    CachedVariadicBox.__name__ = "CachedVariadicBox";
    class PanelMarkupView extends markup_1.MarkupView {
        _update_layout() {
            let changed = ((this._prev_sizing_mode !== undefined) &&
                (this._prev_sizing_mode !== this.model.sizing_mode));
            this._prev_sizing_mode = this.model.sizing_mode;
            this.layout = new CachedVariadicBox(this.el, this.model.sizing_mode, changed);
            this.layout.set_sizing(this.box_sizing());
        }
        render() {
            super.render();
            set_size(this.markup_el, this.model);
        }
    }
    exports.PanelMarkupView = PanelMarkupView;
    PanelMarkupView.__name__ = "PanelMarkupView";
    class PanelHTMLBoxView extends html_box_1.HTMLBoxView {
        _update_layout() {
            let changed = ((this._prev_sizing_mode !== undefined) &&
                (this._prev_sizing_mode !== this.model.sizing_mode));
            this._prev_sizing_mode = this.model.sizing_mode;
            this.layout = new CachedVariadicBox(this.el, this.model.sizing_mode, changed);
            this.layout.set_sizing(this.box_sizing());
        }
        render() {
            super.render();
            set_size(this.el, this.model);
        }
    }
    exports.PanelHTMLBoxView = PanelHTMLBoxView;
    PanelHTMLBoxView.__name__ = "PanelHTMLBoxView";
},
"66d52165db": /* models/audio.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const layout_1 = require("7116a7a602") /* ./layout */;
    class AudioView extends layout_1.PanelHTMLBoxView {
        initialize() {
            super.initialize();
            this._blocked = false;
            this._setting = false;
            this._time = Date.now();
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.loop.change, () => this.set_loop());
            this.connect(this.model.properties.paused.change, () => this.set_paused());
            this.connect(this.model.properties.time.change, () => this.set_time());
            this.connect(this.model.properties.value.change, () => this.set_value());
            this.connect(this.model.properties.volume.change, () => this.set_volume());
        }
        render() {
            super.render();
            this.audioEl = document.createElement('audio');
            this.audioEl.controls = true;
            this.audioEl.src = this.model.value;
            this.audioEl.currentTime = this.model.time;
            this.audioEl.loop = this.model.loop;
            if (this.model.volume != null)
                this.audioEl.volume = this.model.volume / 100;
            else
                this.model.volume = this.audioEl.volume * 100;
            this.audioEl.onpause = () => this.model.paused = true;
            this.audioEl.onplay = () => this.model.paused = false;
            this.audioEl.ontimeupdate = () => this.update_time(this);
            this.audioEl.onvolumechange = () => this.update_volume(this);
            this.el.appendChild(this.audioEl);
            if (!this.model.paused)
                this.audioEl.play();
        }
        update_time(view) {
            if (view._setting) {
                view._setting = false;
                return;
            }
            if ((Date.now() - view._time) < view.model.throttle)
                return;
            view._blocked = true;
            view.model.time = view.audioEl.currentTime;
            view._time = Date.now();
        }
        update_volume(view) {
            if (view._setting) {
                view._setting = false;
                return;
            }
            view._blocked = true;
            view.model.volume = view.audioEl.volume * 100;
        }
        set_loop() {
            this.audioEl.loop = this.model.loop;
        }
        set_paused() {
            if (!this.audioEl.paused && this.model.paused)
                this.audioEl.pause();
            if (this.audioEl.paused && !this.model.paused)
                this.audioEl.play();
        }
        set_volume() {
            if (this._blocked) {
                this._blocked = false;
                return;
            }
            this._setting = true;
            if (this.model.volume != null) {
                this.audioEl.volume = this.model.volume / 100;
            }
        }
        set_time() {
            if (this._blocked) {
                this._blocked = false;
                return;
            }
            this._setting = true;
            this.audioEl.currentTime = this.model.time;
        }
        set_value() {
            this.audioEl.src = this.model.value;
        }
    }
    exports.AudioView = AudioView;
    AudioView.__name__ = "AudioView";
    class Audio extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_Audio() {
            this.prototype.default_view = AudioView;
            this.define({
                loop: [p.Boolean, false],
                paused: [p.Boolean, true],
                time: [p.Number, 0],
                throttle: [p.Number, 250],
                value: [p.Any, ''],
                volume: [p.Number, null],
            });
        }
    }
    exports.Audio = Audio;
    Audio.__name__ = "Audio";
    Audio.__module__ = "panel.models.widgets";
    Audio.init_Audio();
},
"0106b0a1bf": /* models/card.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const column_1 = require("@bokehjs/models/layouts/column");
    const DOM = tslib_1.__importStar(require("@bokehjs/core/dom"));
    const dom_1 = require("@bokehjs/core/dom");
    const grid_1 = require("@bokehjs/core/layout/grid");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    class CollapseableColumnLayout extends grid_1.Column {
        constructor(items, collapsed = false) {
            super(items);
            this.collapsed = collapsed;
        }
        _measure_totals(row_heights, col_widths) {
            // Do not count height of collapsed height
            const heights = this.collapsed ? row_heights.slice(0, 1) : row_heights;
            const last = heights.length - 1;
            if (!this.collapsed)
                heights[last] = heights[last] + 5;
            return super._measure_totals(heights, col_widths);
        }
    }
    exports.CollapseableColumnLayout = CollapseableColumnLayout;
    CollapseableColumnLayout.__name__ = "CollapseableColumnLayout";
    class CardView extends column_1.ColumnView {
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.collapsed.change, () => this._collapse());
            const { active_header_background, header_background, header_color } = this.model.properties;
            this.on_change([active_header_background, header_background, header_color], () => this.render());
        }
        _update_layout() {
            const items = this.child_views.map((child) => child.layout);
            this.layout = new CollapseableColumnLayout(items, this.model.collapsed);
            this.layout.rows = this.model.rows;
            this.layout.spacing = [this.model.spacing, 0];
            const sizing = this.box_sizing();
            if (this.model.collapsed)
                sizing.height = undefined;
            this.layout.set_sizing(sizing);
        }
        render() {
            dom_1.empty(this.el);
            const { background, button_css_classes, header_color, header_tag, header_css_classes } = this.model;
            this.el.style.backgroundColor = background != null ? background : "";
            dom_1.classes(this.el).clear().add(...this.css_classes());
            let header_background = this.model.header_background;
            if (!this.model.collapsed && this.model.active_header_background != null)
                header_background = this.model.active_header_background;
            const header = this.child_views[0];
            let header_el;
            if (this.model.collapsible) {
                this.button_el = DOM.createElement("button", { type: "button", class: header_css_classes });
                this.button_el.style.backgroundColor = header_background != null ? header_background : "";
                this.button_el.appendChild(header.el);
                const icon = DOM.createElement("p", { class: button_css_classes });
                icon.innerHTML = this.model.collapsed ? "+" : "\u2212";
                this.button_el.appendChild(icon);
                this.button_el.onclick = () => this._toggle_button();
                header_el = this.button_el;
            }
            else {
                header_el = DOM.createElement(header_tag, { class: header_css_classes });
                header_el.style.backgroundColor = header_background != null ? header_background : "";
                header_el.appendChild(header.el);
            }
            header_el.style.color = header_color != null ? header_color : "";
            this.el.appendChild(header_el);
            header.render();
            for (const child_view of this.child_views.slice(1)) {
                if (!this.model.collapsed)
                    this.el.appendChild(child_view.el);
                child_view.render();
            }
        }
        _toggle_button() {
            this.model.collapsed = !this.model.collapsed;
        }
        _collapse() {
            this.invalidate_render();
            this.resize_layout();
        }
        _createElement() {
            return DOM.createElement(this.model.tag, { class: this.css_classes() });
        }
    }
    exports.CardView = CardView;
    CardView.__name__ = "CardView";
    class Card extends column_1.Column {
        constructor(attrs) {
            super(attrs);
        }
        static init_Card() {
            this.prototype.default_view = CardView;
            this.define({
                active_header_background: [p.String, null],
                button_css_classes: [p.Array, []],
                collapsed: [p.Boolean, true],
                collapsible: [p.Boolean, true],
                header_background: [p.String, null],
                header_color: [p.String, null],
                header_css_classes: [p.Array, []],
                header_tag: [p.String, "div"],
                tag: [p.String, "div"],
            });
        }
    }
    exports.Card = Card;
    Card.__name__ = "Card";
    Card.__module__ = "panel.models.layout";
    Card.init_Card();
},
"684c940c17": /* models/comm_manager.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const document_1 = require("@bokehjs/document");
    const view_1 = require("@bokehjs/core/view");
    const model_1 = require("@bokehjs/model");
    const message_1 = require("@bokehjs/protocol/message");
    const receiver_1 = require("@bokehjs/protocol/receiver");
    class CommManagerView extends view_1.View {
        renderTo() {
        }
    }
    exports.CommManagerView = CommManagerView;
    CommManagerView.__name__ = "CommManagerView";
    class CommManager extends model_1.Model {
        constructor(attrs) {
            super(attrs);
            this._document_listener = (event) => this._document_changed(event);
            this._receiver = new receiver_1.Receiver();
            this._event_buffer = [];
            this._blocked = false;
            this._timeout = Date.now();
            if ((window.PyViz == undefined) || (!window.PyViz.comm_manager))
                console.log("Could not find comm manager on window.PyViz, ensure the extension is loaded.");
            else {
                this.ns = window.PyViz;
                this.ns.comm_manager.register_target(this.plot_id, this.comm_id, (msg) => this.msg_handler(msg));
                this._client_comm = this.ns.comm_manager.get_client_comm(this.plot_id, this.client_comm_id, (msg) => this.on_ack(msg));
            }
        }
        _doc_attached() {
            super._doc_attached();
            if (this.document != null)
                this.document.on_change(this._document_listener);
        }
        _document_changed(event) {
            // Filter out events that were initiated by the ClientSession itself
            if (event.setter_id === this.id) // XXX: not all document events define this
                return;
            // Filter out changes to attributes that aren't server-visible
            if (event instanceof document_1.ModelChangedEvent && !(event.attr in event.model.serializable_attributes()))
                return;
            this._event_buffer.push(event);
            if ((!this._blocked || (Date.now() > this._timeout))) {
                setTimeout(() => this.process_events(), this.debounce);
                this._blocked = true;
                this._timeout = Date.now() + this.timeout;
            }
        }
        process_events() {
            if ((this.document == null) || (this._client_comm == null))
                return;
            const patch = this.document.create_json_patch(this._event_buffer);
            this._event_buffer = [];
            const message = message_1.Message.create('PATCH-DOC', {}, patch);
            this._client_comm.send(message);
        }
        on_ack(msg) {
            // Receives acknowledgement from Python, processing event
            // and unblocking Comm if event queue empty
            const metadata = msg.metadata;
            if (this._event_buffer.length) {
                this._blocked = true;
                this._timeout = Date.now() + this.timeout;
                this.process_events();
            }
            else
                this._blocked = false;
            if ((metadata.msg_type == "Ready") && metadata.content)
                console.log("Python callback returned following output:", metadata.content);
            else if (metadata.msg_type == "Error")
                console.log("Python failed with the following traceback:", metadata.traceback);
        }
        msg_handler(msg) {
            const metadata = msg.metadata;
            const buffers = msg.buffers;
            const content = msg.content.data;
            const plot_id = this.plot_id;
            if ((metadata.msg_type == "Ready")) {
                if (metadata.content)
                    console.log("Python callback returned following output:", metadata.content);
                else if (metadata.msg_type == "Error")
                    console.log("Python failed with the following traceback:", metadata.traceback);
            }
            else if (plot_id != null) {
                let plot = null;
                if ((plot_id in this.ns.plot_index) && (this.ns.plot_index[plot_id] != null))
                    plot = this.ns.plot_index[plot_id];
                else if ((window.Bokeh !== undefined) && (plot_id in window.Bokeh.index))
                    plot = window.Bokeh.index[plot_id];
                if (plot == null)
                    return;
                if ((buffers != undefined) && (buffers.length > 0))
                    this._receiver.consume(buffers[0].buffer);
                else
                    this._receiver.consume(content);
                const comm_msg = this._receiver.message;
                if ((comm_msg != null) && (Object.keys(comm_msg.content).length > 0) && this.document != null)
                    this.document.apply_json_patch(comm_msg.content, comm_msg.buffers, this.id);
            }
        }
        static init_CommManager() {
            this.prototype.default_view = CommManagerView;
            this.define({
                plot_id: [p.String, null],
                comm_id: [p.String, null],
                client_comm_id: [p.String, null],
                timeout: [p.Number, 5000],
                debounce: [p.Number, 50],
            });
        }
    }
    exports.CommManager = CommManager;
    CommManager.__name__ = "CommManager";
    CommManager.__module__ = "panel.models.comm_manager";
    CommManager.init_CommManager();
},
"d0d2aafca0": /* models/deckgl.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const dom_1 = require("@bokehjs/core/dom");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const layout_1 = require("7116a7a602") /* ./layout */;
    const tooltips_1 = require("064eac2866") /* ./tooltips */;
    const constants_1 = tslib_1.__importDefault(require("093eb75864") /* @luma.gl/constants */);
    function extractClasses() {
        // Get classes for registration from standalone deck.gl
        const classesDict = {};
        const deck = window.deck;
        const classes = Object.keys(deck).filter(x => x.charAt(0) === x.charAt(0).toUpperCase());
        for (const cls of classes) {
            classesDict[cls] = deck[cls];
        }
        return classesDict;
    }
    class DeckGLPlotView extends layout_1.PanelHTMLBoxView {
        connect_signals() {
            super.connect_signals();
            const { data, mapbox_api_key, tooltip, layers, initialViewState, data_sources } = this.model.properties;
            this.on_change([mapbox_api_key, tooltip], () => this.render());
            this.on_change([data, initialViewState], () => this.updateDeck());
            this.on_change([layers], () => this._update_layers());
            this.on_change([data_sources], () => this._connect_sources(true));
            this._layer_map = {};
            this._connected = [];
            this._connect_sources();
        }
        _update_layers() {
            this._layer_map = {};
            this._update_data(true);
        }
        _connect_sources(render = false) {
            for (const cds of this.model.data_sources) {
                if (this._connected.indexOf(cds) < 0) {
                    this.connect(cds.properties.data.change, () => this._update_data(true));
                    this._connected.push(cds);
                }
            }
            this._update_data(render);
        }
        initialize() {
            super.initialize();
            if (window.deck.JSONConverter) {
                const { CSVLoader, Tile3DLoader } = window.loaders;
                window.loaders.registerLoaders([Tile3DLoader, CSVLoader]);
                const jsonConverterConfiguration = {
                    classes: extractClasses(),
                    // Will be resolved as `<enum-name>.<enum-value>`
                    enumerations: {
                        COORDINATE_SYSTEM: window.deck.COORDINATE_SYSTEM,
                        GL: constants_1.default
                    },
                    // Constants that should be resolved with the provided values by JSON converter
                    constants: {
                        Tile3DLoader
                    }
                };
                this.jsonConverter = new window.deck.JSONConverter({
                    configuration: jsonConverterConfiguration
                });
            }
        }
        _update_data(render = true) {
            let n = 0;
            for (const layer of this.model.layers) {
                let cds;
                n += 1;
                if ((n - 1) in this._layer_map) {
                    cds = this.model.data_sources[this._layer_map[n - 1]];
                }
                else if (typeof layer.data != "number")
                    continue;
                else {
                    this._layer_map[n - 1] = layer.data;
                    cds = this.model.data_sources[layer.data];
                }
                const data = [];
                const columns = cds.columns();
                for (let i = 0; i < cds.get_length(); i++) {
                    const item = {};
                    for (const column of columns) {
                        let array = cds.get_array(column);
                        const shape = array[0].shape == null ? null : array[0].shape;
                        if ((shape != null) && (shape.length > 1) && (typeof shape[0] == "number"))
                            item[column] = array.slice(i * shape[1], i * shape[1] + shape[1]);
                        else
                            item[column] = array[i];
                    }
                    data.push(item);
                }
                layer.data = data;
            }
            if (render)
                this.updateDeck();
        }
        _on_click_event(event) {
            const clickState = {
                coordinate: event.coordinate,
                lngLat: event.lngLat,
                index: event.index
            };
            this.model.clickState = clickState;
        }
        _on_hover_event(event) {
            const hoverState = {
                coordinate: event.coordinate,
                lngLat: event.lngLat,
                index: event.index
            };
            this.model.hoverState = hoverState;
        }
        _on_viewState_event(event) {
            this.model.viewState = event.viewState;
        }
        getData() {
            const data = Object.assign(Object.assign({}, this.model.data), { layers: this.model.layers, initialViewState: this.model.initialViewState, onViewStateChange: (event) => this._on_viewState_event(event), onClick: (event) => this._on_click_event(event), onHover: (event) => this._on_hover_event(event) });
            return data;
        }
        updateDeck() {
            if (!this.deckGL) {
                this.render();
                return;
            }
            const data = this.getData();
            if (window.deck.updateDeck) {
                window.deck.updateDeck(data, this.deckGL);
            }
            else {
                const results = this.jsonConverter.convert(data);
                this.deckGL.setProps(results);
            }
        }
        createDeck({ mapboxApiKey, container, jsonInput, tooltip }) {
            let deckgl;
            try {
                const props = this.jsonConverter.convert(jsonInput);
                const getTooltip = tooltips_1.makeTooltip(tooltip);
                deckgl = new window.deck.DeckGL(Object.assign(Object.assign({}, props), { map: window.mapboxgl, mapboxApiAccessToken: mapboxApiKey, container,
                    getTooltip }));
            }
            catch (err) {
                console.error(err);
            }
            return deckgl;
        }
        render() {
            super.render();
            const container = dom_1.div({ class: "deckgl" });
            layout_1.set_size(container, this.model);
            const MAPBOX_API_KEY = this.model.mapbox_api_key;
            const tooltip = this.model.tooltip;
            const data = this.getData();
            if (window.deck.createDeck) {
                this.deckGL = window.deck.createDeck({
                    mapboxApiKey: MAPBOX_API_KEY,
                    container: container,
                    jsonInput: data,
                    tooltip
                });
            }
            else {
                this.deckGL = this.createDeck({
                    mapboxApiKey: MAPBOX_API_KEY,
                    container: container,
                    jsonInput: data,
                    tooltip
                });
            }
            this.el.appendChild(container);
        }
    }
    exports.DeckGLPlotView = DeckGLPlotView;
    DeckGLPlotView.__name__ = "DeckGLPlotView";
    class DeckGLPlot extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_DeckGLPlot() {
            this.prototype.default_view = DeckGLPlotView;
            this.define({
                data: [p.Any],
                data_sources: [p.Array, []],
                clickState: [p.Any],
                hoverState: [p.Any],
                initialViewState: [p.Any],
                layers: [p.Array, []],
                mapbox_api_key: [p.String],
                tooltip: [p.Any],
                viewState: [p.Any],
            });
            this.override({
                height: 400,
                width: 600
            });
        }
    }
    exports.DeckGLPlot = DeckGLPlot;
    DeckGLPlot.__name__ = "DeckGLPlot";
    DeckGLPlot.__module__ = "panel.models.deckgl";
    DeckGLPlot.init_DeckGLPlot();
},
"064eac2866": /* models/tooltips.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    /*
    This file was adapted from https://github.com/uber/deck.gl/ the LICENSE
    below is preserved to comply with the original license.
    
    Copyright (c) 2015 - 2017 Uber Technologies, Inc.
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
    */
    /* global document */
    let lastPickedObject;
    let lastTooltip;
    const DEFAULT_STYLE = {
        fontFamily: '"Helvetica Neue", Helvetica, Arial, sans-serif',
        display: 'flex',
        flex: 'wrap',
        maxWidth: '500px',
        flexDirection: 'column',
        zIndex: 2
    };
    function getDiv() {
        return document.createElement('div');
    }
    function getTooltipDefault(pickedInfo) {
        if (!pickedInfo.picked) {
            return null;
        }
        if (pickedInfo.object === lastPickedObject) {
            return lastTooltip;
        }
        const tooltip = {
            html: tabularize(pickedInfo.object),
            style: DEFAULT_STYLE
        };
        lastTooltip = tooltip;
        lastPickedObject = pickedInfo.object;
        return tooltip;
    }
    exports.getTooltipDefault = getTooltipDefault;
    const EXCLUDES = new Set(['position', 'index']);
    function tabularize(json) {
        // Turns a JSON object of picked info into HTML for a tooltip
        const dataTable = getDiv();
        // Creates rows of two columns for the tooltip
        for (const key in json) {
            if (EXCLUDES.has(key)) {
                continue; // eslint-disable-line
            }
            const header = getDiv();
            header.className = 'header';
            header.textContent = key;
            const valueElement = getDiv();
            valueElement.className = 'value';
            valueElement.textContent = toText(json[key]);
            const row = getDiv();
            setStyles(row, header, valueElement);
            row.appendChild(header);
            row.appendChild(valueElement);
            dataTable.appendChild(row);
        }
        return dataTable.innerHTML;
    }
    exports.tabularize = tabularize;
    function setStyles(row, header, value) {
        // Set default tooltip style
        Object.assign(header.style, {
            fontWeight: 700,
            marginRight: '10px',
            flex: '1 1 0%'
        });
        Object.assign(value.style, {
            flex: 'none',
            maxWidth: '250px',
            overflow: 'hidden',
            whiteSpace: 'nowrap',
            textOverflow: 'ellipsis'
        });
        Object.assign(row.style, {
            display: 'flex',
            flexDirection: 'row',
            justifyContent: 'space-between',
            alignItems: 'stretch'
        });
    }
    function toText(jsonValue) {
        // Set contents of table value, trimming for certain types of data
        let text;
        if (Array.isArray(jsonValue) && jsonValue.length > 4) {
            text = `Array<${jsonValue.length}>`;
        }
        else if (typeof jsonValue === 'string') {
            text = jsonValue;
        }
        else if (typeof jsonValue === 'number') {
            text = String(jsonValue);
        }
        else {
            try {
                text = JSON.stringify(jsonValue);
            }
            catch (err) {
                text = '<Non-Serializable Object>';
            }
        }
        const MAX_LENGTH = 50;
        if (text.length > MAX_LENGTH) {
            text = text.slice(0, MAX_LENGTH);
        }
        return text;
    }
    exports.toText = toText;
    function substituteIn(template, json) {
        let output = template;
        for (const key in json) {
            output = output.replace(`{${key}}`, json[key]);
        }
        return output;
    }
    exports.substituteIn = substituteIn;
    function makeTooltip(tooltip) {
        /*
         * If explictly no tooltip passed by user, return null
         * If a JSON object passed, return a tooltip based on that object
         *   We expect the user has passed a string template that will take pickedInfo keywords
         * If a boolean passed, return the default tooltip
         */
        if (!tooltip) {
            return null;
        }
        if (tooltip.html || tooltip.text) {
            return (pickedInfo) => {
                if (!pickedInfo.picked) {
                    return null;
                }
                const formattedTooltip = {
                    style: tooltip.style || DEFAULT_STYLE
                };
                if (tooltip.html) {
                    formattedTooltip.html = substituteIn(tooltip.html, pickedInfo.object);
                }
                else {
                    formattedTooltip.text = substituteIn(tooltip.text, pickedInfo.object);
                }
                return formattedTooltip;
            };
        }
        return getTooltipDefault;
    }
    exports.makeTooltip = makeTooltip;
},
"093eb75864": /* @luma.gl/constants/src/index.js */ function _(require, module, exports) {
    // GL constants, copied from Mozilla documentation
    // https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Constants
    // Standard WebGL 1 constants
    // These constants are defined on the WebGLRenderingContext interface.
    /* eslint-disable key-spacing, max-len, no-inline-comments, camelcase */
    // eslint-disable-next-line
    module.exports = {
        // Clearing buffers
        // Constants passed to clear() to clear buffer masks.
        DEPTH_BUFFER_BIT: 0x00000100,
        STENCIL_BUFFER_BIT: 0x00000400,
        COLOR_BUFFER_BIT: 0x00004000,
        // Rendering primitives
        // Constants passed to drawElements() or drawArrays() to specify what kind of primitive to render.
        POINTS: 0x0000,
        LINES: 0x0001,
        LINE_LOOP: 0x0002,
        LINE_STRIP: 0x0003,
        TRIANGLES: 0x0004,
        TRIANGLE_STRIP: 0x0005,
        TRIANGLE_FAN: 0x0006,
        // Blending modes
        // Constants passed to blendFunc() or blendFuncSeparate() to specify the blending mode (for both, RBG and alpha, or separately).
        ZERO: 0,
        ONE: 1,
        SRC_COLOR: 0x0300,
        ONE_MINUS_SRC_COLOR: 0x0301,
        SRC_ALPHA: 0x0302,
        ONE_MINUS_SRC_ALPHA: 0x0303,
        DST_ALPHA: 0x0304,
        ONE_MINUS_DST_ALPHA: 0x0305,
        DST_COLOR: 0x0306,
        ONE_MINUS_DST_COLOR: 0x0307,
        SRC_ALPHA_SATURATE: 0x0308,
        CONSTANT_COLOR: 0x8001,
        ONE_MINUS_CONSTANT_COLOR: 0x8002,
        CONSTANT_ALPHA: 0x8003,
        ONE_MINUS_CONSTANT_ALPHA: 0x8004,
        // Blending equations
        // Constants passed to blendEquation() or blendEquationSeparate() to control
        // how the blending is calculated (for both, RBG and alpha, or separately).
        FUNC_ADD: 0x8006,
        FUNC_SUBTRACT: 0x800a,
        FUNC_REVERSE_SUBTRACT: 0x800b,
        // Getting GL parameter information
        // Constants passed to getParameter() to specify what information to return.
        BLEND_EQUATION: 0x8009,
        BLEND_EQUATION_RGB: 0x8009,
        BLEND_EQUATION_ALPHA: 0x883d,
        BLEND_DST_RGB: 0x80c8,
        BLEND_SRC_RGB: 0x80c9,
        BLEND_DST_ALPHA: 0x80ca,
        BLEND_SRC_ALPHA: 0x80cb,
        BLEND_COLOR: 0x8005,
        ARRAY_BUFFER_BINDING: 0x8894,
        ELEMENT_ARRAY_BUFFER_BINDING: 0x8895,
        LINE_WIDTH: 0x0b21,
        ALIASED_POINT_SIZE_RANGE: 0x846d,
        ALIASED_LINE_WIDTH_RANGE: 0x846e,
        CULL_FACE_MODE: 0x0b45,
        FRONT_FACE: 0x0b46,
        DEPTH_RANGE: 0x0b70,
        DEPTH_WRITEMASK: 0x0b72,
        DEPTH_CLEAR_VALUE: 0x0b73,
        DEPTH_FUNC: 0x0b74,
        STENCIL_CLEAR_VALUE: 0x0b91,
        STENCIL_FUNC: 0x0b92,
        STENCIL_FAIL: 0x0b94,
        STENCIL_PASS_DEPTH_FAIL: 0x0b95,
        STENCIL_PASS_DEPTH_PASS: 0x0b96,
        STENCIL_REF: 0x0b97,
        STENCIL_VALUE_MASK: 0x0b93,
        STENCIL_WRITEMASK: 0x0b98,
        STENCIL_BACK_FUNC: 0x8800,
        STENCIL_BACK_FAIL: 0x8801,
        STENCIL_BACK_PASS_DEPTH_FAIL: 0x8802,
        STENCIL_BACK_PASS_DEPTH_PASS: 0x8803,
        STENCIL_BACK_REF: 0x8ca3,
        STENCIL_BACK_VALUE_MASK: 0x8ca4,
        STENCIL_BACK_WRITEMASK: 0x8ca5,
        VIEWPORT: 0x0ba2,
        SCISSOR_BOX: 0x0c10,
        COLOR_CLEAR_VALUE: 0x0c22,
        COLOR_WRITEMASK: 0x0c23,
        UNPACK_ALIGNMENT: 0x0cf5,
        PACK_ALIGNMENT: 0x0d05,
        MAX_TEXTURE_SIZE: 0x0d33,
        MAX_VIEWPORT_DIMS: 0x0d3a,
        SUBPIXEL_BITS: 0x0d50,
        RED_BITS: 0x0d52,
        GREEN_BITS: 0x0d53,
        BLUE_BITS: 0x0d54,
        ALPHA_BITS: 0x0d55,
        DEPTH_BITS: 0x0d56,
        STENCIL_BITS: 0x0d57,
        POLYGON_OFFSET_UNITS: 0x2a00,
        POLYGON_OFFSET_FACTOR: 0x8038,
        TEXTURE_BINDING_2D: 0x8069,
        SAMPLE_BUFFERS: 0x80a8,
        SAMPLES: 0x80a9,
        SAMPLE_COVERAGE_VALUE: 0x80aa,
        SAMPLE_COVERAGE_INVERT: 0x80ab,
        COMPRESSED_TEXTURE_FORMATS: 0x86a3,
        VENDOR: 0x1f00,
        RENDERER: 0x1f01,
        VERSION: 0x1f02,
        IMPLEMENTATION_COLOR_READ_TYPE: 0x8b9a,
        IMPLEMENTATION_COLOR_READ_FORMAT: 0x8b9b,
        BROWSER_DEFAULT_WEBGL: 0x9244,
        // Buffers
        // Constants passed to bufferData(), bufferSubData(), bindBuffer(), or
        // getBufferParameter().
        STATIC_DRAW: 0x88e4,
        STREAM_DRAW: 0x88e0,
        DYNAMIC_DRAW: 0x88e8,
        ARRAY_BUFFER: 0x8892,
        ELEMENT_ARRAY_BUFFER: 0x8893,
        BUFFER_SIZE: 0x8764,
        BUFFER_USAGE: 0x8765,
        // Vertex attributes
        // Constants passed to getVertexAttrib().
        CURRENT_VERTEX_ATTRIB: 0x8626,
        VERTEX_ATTRIB_ARRAY_ENABLED: 0x8622,
        VERTEX_ATTRIB_ARRAY_SIZE: 0x8623,
        VERTEX_ATTRIB_ARRAY_STRIDE: 0x8624,
        VERTEX_ATTRIB_ARRAY_TYPE: 0x8625,
        VERTEX_ATTRIB_ARRAY_NORMALIZED: 0x886a,
        VERTEX_ATTRIB_ARRAY_POINTER: 0x8645,
        VERTEX_ATTRIB_ARRAY_BUFFER_BINDING: 0x889f,
        // Culling
        // Constants passed to cullFace().
        CULL_FACE: 0x0b44,
        FRONT: 0x0404,
        BACK: 0x0405,
        FRONT_AND_BACK: 0x0408,
        // Enabling and disabling
        // Constants passed to enable() or disable().
        BLEND: 0x0be2,
        DEPTH_TEST: 0x0b71,
        DITHER: 0x0bd0,
        POLYGON_OFFSET_FILL: 0x8037,
        SAMPLE_ALPHA_TO_COVERAGE: 0x809e,
        SAMPLE_COVERAGE: 0x80a0,
        SCISSOR_TEST: 0x0c11,
        STENCIL_TEST: 0x0b90,
        // Errors
        // Constants returned from getError().
        NO_ERROR: 0,
        INVALID_ENUM: 0x0500,
        INVALID_VALUE: 0x0501,
        INVALID_OPERATION: 0x0502,
        OUT_OF_MEMORY: 0x0505,
        CONTEXT_LOST_WEBGL: 0x9242,
        // Front face directions
        // Constants passed to frontFace().
        CW: 0x0900,
        CCW: 0x0901,
        // Hints
        // Constants passed to hint()
        DONT_CARE: 0x1100,
        FASTEST: 0x1101,
        NICEST: 0x1102,
        GENERATE_MIPMAP_HINT: 0x8192,
        // Data types
        BYTE: 0x1400,
        UNSIGNED_BYTE: 0x1401,
        SHORT: 0x1402,
        UNSIGNED_SHORT: 0x1403,
        INT: 0x1404,
        UNSIGNED_INT: 0x1405,
        FLOAT: 0x1406,
        DOUBLE: 0x140a,
        // Pixel formats
        DEPTH_COMPONENT: 0x1902,
        ALPHA: 0x1906,
        RGB: 0x1907,
        RGBA: 0x1908,
        LUMINANCE: 0x1909,
        LUMINANCE_ALPHA: 0x190a,
        // Pixel types
        // UNSIGNED_BYTE: 0x1401,
        UNSIGNED_SHORT_4_4_4_4: 0x8033,
        UNSIGNED_SHORT_5_5_5_1: 0x8034,
        UNSIGNED_SHORT_5_6_5: 0x8363,
        // Shaders
        // Constants passed to createShader() or getShaderParameter()
        FRAGMENT_SHADER: 0x8b30,
        VERTEX_SHADER: 0x8b31,
        COMPILE_STATUS: 0x8b81,
        DELETE_STATUS: 0x8b80,
        LINK_STATUS: 0x8b82,
        VALIDATE_STATUS: 0x8b83,
        ATTACHED_SHADERS: 0x8b85,
        ACTIVE_ATTRIBUTES: 0x8b89,
        ACTIVE_UNIFORMS: 0x8b86,
        MAX_VERTEX_ATTRIBS: 0x8869,
        MAX_VERTEX_UNIFORM_VECTORS: 0x8dfb,
        MAX_VARYING_VECTORS: 0x8dfc,
        MAX_COMBINED_TEXTURE_IMAGE_UNITS: 0x8b4d,
        MAX_VERTEX_TEXTURE_IMAGE_UNITS: 0x8b4c,
        MAX_TEXTURE_IMAGE_UNITS: 0x8872,
        MAX_FRAGMENT_UNIFORM_VECTORS: 0x8dfd,
        SHADER_TYPE: 0x8b4f,
        SHADING_LANGUAGE_VERSION: 0x8b8c,
        CURRENT_PROGRAM: 0x8b8d,
        // Depth or stencil tests
        // Constants passed to depthFunc() or stencilFunc().
        NEVER: 0x0200,
        ALWAYS: 0x0207,
        LESS: 0x0201,
        EQUAL: 0x0202,
        LEQUAL: 0x0203,
        GREATER: 0x0204,
        GEQUAL: 0x0206,
        NOTEQUAL: 0x0205,
        // Stencil actions
        // Constants passed to stencilOp().
        KEEP: 0x1e00,
        REPLACE: 0x1e01,
        INCR: 0x1e02,
        DECR: 0x1e03,
        INVERT: 0x150a,
        INCR_WRAP: 0x8507,
        DECR_WRAP: 0x8508,
        // Textures
        // Constants passed to texParameteri(),
        // texParameterf(), bindTexture(), texImage2D(), and others.
        NEAREST: 0x2600,
        LINEAR: 0x2601,
        NEAREST_MIPMAP_NEAREST: 0x2700,
        LINEAR_MIPMAP_NEAREST: 0x2701,
        NEAREST_MIPMAP_LINEAR: 0x2702,
        LINEAR_MIPMAP_LINEAR: 0x2703,
        TEXTURE_MAG_FILTER: 0x2800,
        TEXTURE_MIN_FILTER: 0x2801,
        TEXTURE_WRAP_S: 0x2802,
        TEXTURE_WRAP_T: 0x2803,
        TEXTURE_2D: 0x0de1,
        TEXTURE: 0x1702,
        TEXTURE_CUBE_MAP: 0x8513,
        TEXTURE_BINDING_CUBE_MAP: 0x8514,
        TEXTURE_CUBE_MAP_POSITIVE_X: 0x8515,
        TEXTURE_CUBE_MAP_NEGATIVE_X: 0x8516,
        TEXTURE_CUBE_MAP_POSITIVE_Y: 0x8517,
        TEXTURE_CUBE_MAP_NEGATIVE_Y: 0x8518,
        TEXTURE_CUBE_MAP_POSITIVE_Z: 0x8519,
        TEXTURE_CUBE_MAP_NEGATIVE_Z: 0x851a,
        MAX_CUBE_MAP_TEXTURE_SIZE: 0x851c,
        // TEXTURE0 - 31 0x84C0 - 0x84DF A texture unit.
        TEXTURE0: 0x84c0,
        ACTIVE_TEXTURE: 0x84e0,
        REPEAT: 0x2901,
        CLAMP_TO_EDGE: 0x812f,
        MIRRORED_REPEAT: 0x8370,
        // Emulation
        TEXTURE_WIDTH: 0x1000,
        TEXTURE_HEIGHT: 0x1001,
        // Uniform types
        FLOAT_VEC2: 0x8b50,
        FLOAT_VEC3: 0x8b51,
        FLOAT_VEC4: 0x8b52,
        INT_VEC2: 0x8b53,
        INT_VEC3: 0x8b54,
        INT_VEC4: 0x8b55,
        BOOL: 0x8b56,
        BOOL_VEC2: 0x8b57,
        BOOL_VEC3: 0x8b58,
        BOOL_VEC4: 0x8b59,
        FLOAT_MAT2: 0x8b5a,
        FLOAT_MAT3: 0x8b5b,
        FLOAT_MAT4: 0x8b5c,
        SAMPLER_2D: 0x8b5e,
        SAMPLER_CUBE: 0x8b60,
        // Shader precision-specified types
        LOW_FLOAT: 0x8df0,
        MEDIUM_FLOAT: 0x8df1,
        HIGH_FLOAT: 0x8df2,
        LOW_INT: 0x8df3,
        MEDIUM_INT: 0x8df4,
        HIGH_INT: 0x8df5,
        // Framebuffers and renderbuffers
        FRAMEBUFFER: 0x8d40,
        RENDERBUFFER: 0x8d41,
        RGBA4: 0x8056,
        RGB5_A1: 0x8057,
        RGB565: 0x8d62,
        DEPTH_COMPONENT16: 0x81a5,
        STENCIL_INDEX: 0x1901,
        STENCIL_INDEX8: 0x8d48,
        DEPTH_STENCIL: 0x84f9,
        RENDERBUFFER_WIDTH: 0x8d42,
        RENDERBUFFER_HEIGHT: 0x8d43,
        RENDERBUFFER_INTERNAL_FORMAT: 0x8d44,
        RENDERBUFFER_RED_SIZE: 0x8d50,
        RENDERBUFFER_GREEN_SIZE: 0x8d51,
        RENDERBUFFER_BLUE_SIZE: 0x8d52,
        RENDERBUFFER_ALPHA_SIZE: 0x8d53,
        RENDERBUFFER_DEPTH_SIZE: 0x8d54,
        RENDERBUFFER_STENCIL_SIZE: 0x8d55,
        FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE: 0x8cd0,
        FRAMEBUFFER_ATTACHMENT_OBJECT_NAME: 0x8cd1,
        FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL: 0x8cd2,
        FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE: 0x8cd3,
        COLOR_ATTACHMENT0: 0x8ce0,
        DEPTH_ATTACHMENT: 0x8d00,
        STENCIL_ATTACHMENT: 0x8d20,
        DEPTH_STENCIL_ATTACHMENT: 0x821a,
        NONE: 0,
        FRAMEBUFFER_COMPLETE: 0x8cd5,
        FRAMEBUFFER_INCOMPLETE_ATTACHMENT: 0x8cd6,
        FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT: 0x8cd7,
        FRAMEBUFFER_INCOMPLETE_DIMENSIONS: 0x8cd9,
        FRAMEBUFFER_UNSUPPORTED: 0x8cdd,
        FRAMEBUFFER_BINDING: 0x8ca6,
        RENDERBUFFER_BINDING: 0x8ca7,
        READ_FRAMEBUFFER: 0x8ca8,
        DRAW_FRAMEBUFFER: 0x8ca9,
        MAX_RENDERBUFFER_SIZE: 0x84e8,
        INVALID_FRAMEBUFFER_OPERATION: 0x0506,
        // Pixel storage modes
        // Constants passed to pixelStorei().
        UNPACK_FLIP_Y_WEBGL: 0x9240,
        UNPACK_PREMULTIPLY_ALPHA_WEBGL: 0x9241,
        UNPACK_COLORSPACE_CONVERSION_WEBGL: 0x9243,
        // /////////////////////////////////////////////////////
        // Additional constants defined WebGL 2
        // These constants are defined on the WebGL2RenderingContext interface.
        // All WebGL 1 constants are also available in a WebGL 2 context.
        // /////////////////////////////////////////////////////
        // Getting GL parameter information
        // Constants passed to getParameter()
        // to specify what information to return.
        READ_BUFFER: 0x0c02,
        UNPACK_ROW_LENGTH: 0x0cf2,
        UNPACK_SKIP_ROWS: 0x0cf3,
        UNPACK_SKIP_PIXELS: 0x0cf4,
        PACK_ROW_LENGTH: 0x0d02,
        PACK_SKIP_ROWS: 0x0d03,
        PACK_SKIP_PIXELS: 0x0d04,
        TEXTURE_BINDING_3D: 0x806a,
        UNPACK_SKIP_IMAGES: 0x806d,
        UNPACK_IMAGE_HEIGHT: 0x806e,
        MAX_3D_TEXTURE_SIZE: 0x8073,
        MAX_ELEMENTS_VERTICES: 0x80e8,
        MAX_ELEMENTS_INDICES: 0x80e9,
        MAX_TEXTURE_LOD_BIAS: 0x84fd,
        MAX_FRAGMENT_UNIFORM_COMPONENTS: 0x8b49,
        MAX_VERTEX_UNIFORM_COMPONENTS: 0x8b4a,
        MAX_ARRAY_TEXTURE_LAYERS: 0x88ff,
        MIN_PROGRAM_TEXEL_OFFSET: 0x8904,
        MAX_PROGRAM_TEXEL_OFFSET: 0x8905,
        MAX_VARYING_COMPONENTS: 0x8b4b,
        FRAGMENT_SHADER_DERIVATIVE_HINT: 0x8b8b,
        RASTERIZER_DISCARD: 0x8c89,
        VERTEX_ARRAY_BINDING: 0x85b5,
        MAX_VERTEX_OUTPUT_COMPONENTS: 0x9122,
        MAX_FRAGMENT_INPUT_COMPONENTS: 0x9125,
        MAX_SERVER_WAIT_TIMEOUT: 0x9111,
        MAX_ELEMENT_INDEX: 0x8d6b,
        // Textures
        // Constants passed to texParameteri(),
        // texParameterf(), bindTexture(), texImage2D(), and others.
        RED: 0x1903,
        RGB8: 0x8051,
        RGBA8: 0x8058,
        RGB10_A2: 0x8059,
        TEXTURE_3D: 0x806f,
        TEXTURE_WRAP_R: 0x8072,
        TEXTURE_MIN_LOD: 0x813a,
        TEXTURE_MAX_LOD: 0x813b,
        TEXTURE_BASE_LEVEL: 0x813c,
        TEXTURE_MAX_LEVEL: 0x813d,
        TEXTURE_COMPARE_MODE: 0x884c,
        TEXTURE_COMPARE_FUNC: 0x884d,
        SRGB: 0x8c40,
        SRGB8: 0x8c41,
        SRGB8_ALPHA8: 0x8c43,
        COMPARE_REF_TO_TEXTURE: 0x884e,
        RGBA32F: 0x8814,
        RGB32F: 0x8815,
        RGBA16F: 0x881a,
        RGB16F: 0x881b,
        TEXTURE_2D_ARRAY: 0x8c1a,
        TEXTURE_BINDING_2D_ARRAY: 0x8c1d,
        R11F_G11F_B10F: 0x8c3a,
        RGB9_E5: 0x8c3d,
        RGBA32UI: 0x8d70,
        RGB32UI: 0x8d71,
        RGBA16UI: 0x8d76,
        RGB16UI: 0x8d77,
        RGBA8UI: 0x8d7c,
        RGB8UI: 0x8d7d,
        RGBA32I: 0x8d82,
        RGB32I: 0x8d83,
        RGBA16I: 0x8d88,
        RGB16I: 0x8d89,
        RGBA8I: 0x8d8e,
        RGB8I: 0x8d8f,
        RED_INTEGER: 0x8d94,
        RGB_INTEGER: 0x8d98,
        RGBA_INTEGER: 0x8d99,
        R8: 0x8229,
        RG8: 0x822b,
        R16F: 0x822d,
        R32F: 0x822e,
        RG16F: 0x822f,
        RG32F: 0x8230,
        R8I: 0x8231,
        R8UI: 0x8232,
        R16I: 0x8233,
        R16UI: 0x8234,
        R32I: 0x8235,
        R32UI: 0x8236,
        RG8I: 0x8237,
        RG8UI: 0x8238,
        RG16I: 0x8239,
        RG16UI: 0x823a,
        RG32I: 0x823b,
        RG32UI: 0x823c,
        R8_SNORM: 0x8f94,
        RG8_SNORM: 0x8f95,
        RGB8_SNORM: 0x8f96,
        RGBA8_SNORM: 0x8f97,
        RGB10_A2UI: 0x906f,
        /* covered by extension
        COMPRESSED_R11_EAC : 0x9270,
        COMPRESSED_SIGNED_R11_EAC: 0x9271,
        COMPRESSED_RG11_EAC: 0x9272,
        COMPRESSED_SIGNED_RG11_EAC : 0x9273,
        COMPRESSED_RGB8_ETC2 : 0x9274,
        COMPRESSED_SRGB8_ETC2: 0x9275,
        COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 : 0x9276,
        COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC : 0x9277,
        COMPRESSED_RGBA8_ETC2_EAC: 0x9278,
        COMPRESSED_SRGB8_ALPHA8_ETC2_EAC : 0x9279,
        */
        TEXTURE_IMMUTABLE_FORMAT: 0x912f,
        TEXTURE_IMMUTABLE_LEVELS: 0x82df,
        // Pixel types
        UNSIGNED_INT_2_10_10_10_REV: 0x8368,
        UNSIGNED_INT_10F_11F_11F_REV: 0x8c3b,
        UNSIGNED_INT_5_9_9_9_REV: 0x8c3e,
        FLOAT_32_UNSIGNED_INT_24_8_REV: 0x8dad,
        UNSIGNED_INT_24_8: 0x84fa,
        HALF_FLOAT: 0x140b,
        RG: 0x8227,
        RG_INTEGER: 0x8228,
        INT_2_10_10_10_REV: 0x8d9f,
        // Queries
        CURRENT_QUERY: 0x8865,
        QUERY_RESULT: 0x8866,
        QUERY_RESULT_AVAILABLE: 0x8867,
        ANY_SAMPLES_PASSED: 0x8c2f,
        ANY_SAMPLES_PASSED_CONSERVATIVE: 0x8d6a,
        // Draw buffers
        MAX_DRAW_BUFFERS: 0x8824,
        DRAW_BUFFER0: 0x8825,
        DRAW_BUFFER1: 0x8826,
        DRAW_BUFFER2: 0x8827,
        DRAW_BUFFER3: 0x8828,
        DRAW_BUFFER4: 0x8829,
        DRAW_BUFFER5: 0x882a,
        DRAW_BUFFER6: 0x882b,
        DRAW_BUFFER7: 0x882c,
        DRAW_BUFFER8: 0x882d,
        DRAW_BUFFER9: 0x882e,
        DRAW_BUFFER10: 0x882f,
        DRAW_BUFFER11: 0x8830,
        DRAW_BUFFER12: 0x8831,
        DRAW_BUFFER13: 0x8832,
        DRAW_BUFFER14: 0x8833,
        DRAW_BUFFER15: 0x8834,
        MAX_COLOR_ATTACHMENTS: 0x8cdf,
        COLOR_ATTACHMENT1: 0x8ce1,
        COLOR_ATTACHMENT2: 0x8ce2,
        COLOR_ATTACHMENT3: 0x8ce3,
        COLOR_ATTACHMENT4: 0x8ce4,
        COLOR_ATTACHMENT5: 0x8ce5,
        COLOR_ATTACHMENT6: 0x8ce6,
        COLOR_ATTACHMENT7: 0x8ce7,
        COLOR_ATTACHMENT8: 0x8ce8,
        COLOR_ATTACHMENT9: 0x8ce9,
        COLOR_ATTACHMENT10: 0x8cea,
        COLOR_ATTACHMENT11: 0x8ceb,
        COLOR_ATTACHMENT12: 0x8cec,
        COLOR_ATTACHMENT13: 0x8ced,
        COLOR_ATTACHMENT14: 0x8cee,
        COLOR_ATTACHMENT15: 0x8cef,
        // Samplers
        SAMPLER_3D: 0x8b5f,
        SAMPLER_2D_SHADOW: 0x8b62,
        SAMPLER_2D_ARRAY: 0x8dc1,
        SAMPLER_2D_ARRAY_SHADOW: 0x8dc4,
        SAMPLER_CUBE_SHADOW: 0x8dc5,
        INT_SAMPLER_2D: 0x8dca,
        INT_SAMPLER_3D: 0x8dcb,
        INT_SAMPLER_CUBE: 0x8dcc,
        INT_SAMPLER_2D_ARRAY: 0x8dcf,
        UNSIGNED_INT_SAMPLER_2D: 0x8dd2,
        UNSIGNED_INT_SAMPLER_3D: 0x8dd3,
        UNSIGNED_INT_SAMPLER_CUBE: 0x8dd4,
        UNSIGNED_INT_SAMPLER_2D_ARRAY: 0x8dd7,
        MAX_SAMPLES: 0x8d57,
        SAMPLER_BINDING: 0x8919,
        // Buffers
        PIXEL_PACK_BUFFER: 0x88eb,
        PIXEL_UNPACK_BUFFER: 0x88ec,
        PIXEL_PACK_BUFFER_BINDING: 0x88ed,
        PIXEL_UNPACK_BUFFER_BINDING: 0x88ef,
        COPY_READ_BUFFER: 0x8f36,
        COPY_WRITE_BUFFER: 0x8f37,
        COPY_READ_BUFFER_BINDING: 0x8f36,
        COPY_WRITE_BUFFER_BINDING: 0x8f37,
        // Data types
        FLOAT_MAT2x3: 0x8b65,
        FLOAT_MAT2x4: 0x8b66,
        FLOAT_MAT3x2: 0x8b67,
        FLOAT_MAT3x4: 0x8b68,
        FLOAT_MAT4x2: 0x8b69,
        FLOAT_MAT4x3: 0x8b6a,
        UNSIGNED_INT_VEC2: 0x8dc6,
        UNSIGNED_INT_VEC3: 0x8dc7,
        UNSIGNED_INT_VEC4: 0x8dc8,
        UNSIGNED_NORMALIZED: 0x8c17,
        SIGNED_NORMALIZED: 0x8f9c,
        // Vertex attributes
        VERTEX_ATTRIB_ARRAY_INTEGER: 0x88fd,
        VERTEX_ATTRIB_ARRAY_DIVISOR: 0x88fe,
        // Transform feedback
        TRANSFORM_FEEDBACK_BUFFER_MODE: 0x8c7f,
        MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS: 0x8c80,
        TRANSFORM_FEEDBACK_VARYINGS: 0x8c83,
        TRANSFORM_FEEDBACK_BUFFER_START: 0x8c84,
        TRANSFORM_FEEDBACK_BUFFER_SIZE: 0x8c85,
        TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN: 0x8c88,
        MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS: 0x8c8a,
        MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS: 0x8c8b,
        INTERLEAVED_ATTRIBS: 0x8c8c,
        SEPARATE_ATTRIBS: 0x8c8d,
        TRANSFORM_FEEDBACK_BUFFER: 0x8c8e,
        TRANSFORM_FEEDBACK_BUFFER_BINDING: 0x8c8f,
        TRANSFORM_FEEDBACK: 0x8e22,
        TRANSFORM_FEEDBACK_PAUSED: 0x8e23,
        TRANSFORM_FEEDBACK_ACTIVE: 0x8e24,
        TRANSFORM_FEEDBACK_BINDING: 0x8e25,
        // Framebuffers and renderbuffers
        FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING: 0x8210,
        FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE: 0x8211,
        FRAMEBUFFER_ATTACHMENT_RED_SIZE: 0x8212,
        FRAMEBUFFER_ATTACHMENT_GREEN_SIZE: 0x8213,
        FRAMEBUFFER_ATTACHMENT_BLUE_SIZE: 0x8214,
        FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE: 0x8215,
        FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE: 0x8216,
        FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE: 0x8217,
        FRAMEBUFFER_DEFAULT: 0x8218,
        // DEPTH_STENCIL_ATTACHMENT : 0x821A,
        // DEPTH_STENCIL: 0x84F9,
        DEPTH24_STENCIL8: 0x88f0,
        DRAW_FRAMEBUFFER_BINDING: 0x8ca6,
        READ_FRAMEBUFFER_BINDING: 0x8caa,
        RENDERBUFFER_SAMPLES: 0x8cab,
        FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER: 0x8cd4,
        FRAMEBUFFER_INCOMPLETE_MULTISAMPLE: 0x8d56,
        // Uniforms
        UNIFORM_BUFFER: 0x8a11,
        UNIFORM_BUFFER_BINDING: 0x8a28,
        UNIFORM_BUFFER_START: 0x8a29,
        UNIFORM_BUFFER_SIZE: 0x8a2a,
        MAX_VERTEX_UNIFORM_BLOCKS: 0x8a2b,
        MAX_FRAGMENT_UNIFORM_BLOCKS: 0x8a2d,
        MAX_COMBINED_UNIFORM_BLOCKS: 0x8a2e,
        MAX_UNIFORM_BUFFER_BINDINGS: 0x8a2f,
        MAX_UNIFORM_BLOCK_SIZE: 0x8a30,
        MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS: 0x8a31,
        MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS: 0x8a33,
        UNIFORM_BUFFER_OFFSET_ALIGNMENT: 0x8a34,
        ACTIVE_UNIFORM_BLOCKS: 0x8a36,
        UNIFORM_TYPE: 0x8a37,
        UNIFORM_SIZE: 0x8a38,
        UNIFORM_BLOCK_INDEX: 0x8a3a,
        UNIFORM_OFFSET: 0x8a3b,
        UNIFORM_ARRAY_STRIDE: 0x8a3c,
        UNIFORM_MATRIX_STRIDE: 0x8a3d,
        UNIFORM_IS_ROW_MAJOR: 0x8a3e,
        UNIFORM_BLOCK_BINDING: 0x8a3f,
        UNIFORM_BLOCK_DATA_SIZE: 0x8a40,
        UNIFORM_BLOCK_ACTIVE_UNIFORMS: 0x8a42,
        UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES: 0x8a43,
        UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER: 0x8a44,
        UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER: 0x8a46,
        // Sync objects
        OBJECT_TYPE: 0x9112,
        SYNC_CONDITION: 0x9113,
        SYNC_STATUS: 0x9114,
        SYNC_FLAGS: 0x9115,
        SYNC_FENCE: 0x9116,
        SYNC_GPU_COMMANDS_COMPLETE: 0x9117,
        UNSIGNALED: 0x9118,
        SIGNALED: 0x9119,
        ALREADY_SIGNALED: 0x911a,
        TIMEOUT_EXPIRED: 0x911b,
        CONDITION_SATISFIED: 0x911c,
        WAIT_FAILED: 0x911d,
        SYNC_FLUSH_COMMANDS_BIT: 0x00000001,
        // Miscellaneous constants
        COLOR: 0x1800,
        DEPTH: 0x1801,
        STENCIL: 0x1802,
        MIN: 0x8007,
        MAX: 0x8008,
        DEPTH_COMPONENT24: 0x81a6,
        STREAM_READ: 0x88e1,
        STREAM_COPY: 0x88e2,
        STATIC_READ: 0x88e5,
        STATIC_COPY: 0x88e6,
        DYNAMIC_READ: 0x88e9,
        DYNAMIC_COPY: 0x88ea,
        DEPTH_COMPONENT32F: 0x8cac,
        DEPTH32F_STENCIL8: 0x8cad,
        INVALID_INDEX: 0xffffffff,
        TIMEOUT_IGNORED: -1,
        MAX_CLIENT_WAIT_TIMEOUT_WEBGL: 0x9247,
        // Constants defined in WebGL extensions
        // ANGLE_instanced_arrays
        VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE: 0x88fe,
        // WEBGL_debug_renderer_info
        UNMASKED_VENDOR_WEBGL: 0x9245,
        UNMASKED_RENDERER_WEBGL: 0x9246,
        // EXT_texture_filter_anisotropic
        MAX_TEXTURE_MAX_ANISOTROPY_EXT: 0x84ff,
        TEXTURE_MAX_ANISOTROPY_EXT: 0x84fe,
        // WEBGL_compressed_texture_s3tc
        COMPRESSED_RGB_S3TC_DXT1_EXT: 0x83f0,
        COMPRESSED_RGBA_S3TC_DXT1_EXT: 0x83f1,
        COMPRESSED_RGBA_S3TC_DXT3_EXT: 0x83f2,
        COMPRESSED_RGBA_S3TC_DXT5_EXT: 0x83f3,
        // WEBGL_compressed_texture_es3
        COMPRESSED_R11_EAC: 0x9270,
        COMPRESSED_SIGNED_R11_EAC: 0x9271,
        COMPRESSED_RG11_EAC: 0x9272,
        COMPRESSED_SIGNED_RG11_EAC: 0x9273,
        COMPRESSED_RGB8_ETC2: 0x9274,
        COMPRESSED_RGBA8_ETC2_EAC: 0x9275,
        COMPRESSED_SRGB8_ETC2: 0x9276,
        COMPRESSED_SRGB8_ALPHA8_ETC2_EAC: 0x9277,
        COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2: 0x9278,
        COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2: 0x9279,
        // WEBGL_compressed_texture_pvrtc
        COMPRESSED_RGB_PVRTC_4BPPV1_IMG: 0x8c00,
        COMPRESSED_RGBA_PVRTC_4BPPV1_IMG: 0x8c02,
        COMPRESSED_RGB_PVRTC_2BPPV1_IMG: 0x8c01,
        COMPRESSED_RGBA_PVRTC_2BPPV1_IMG: 0x8c03,
        // WEBGL_compressed_texture_etc1
        COMPRESSED_RGB_ETC1_WEBGL: 0x8d64,
        // WEBGL_compressed_texture_atc
        COMPRESSED_RGB_ATC_WEBGL: 0x8c92,
        COMPRESSED_RGBA_ATC_EXPLICIT_ALPHA_WEBGL: 0x8c92,
        COMPRESSED_RGBA_ATC_INTERPOLATED_ALPHA_WEBGL: 0x87ee,
        // WEBGL_depth_texture
        UNSIGNED_INT_24_8_WEBGL: 0x84fa,
        // OES_texture_half_float
        HALF_FLOAT_OES: 0x8d61,
        // WEBGL_color_buffer_float
        RGBA32F_EXT: 0x8814,
        RGB32F_EXT: 0x8815,
        FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT: 0x8211,
        UNSIGNED_NORMALIZED_EXT: 0x8c17,
        // EXT_blend_minmax
        MIN_EXT: 0x8007,
        MAX_EXT: 0x8008,
        // EXT_sRGB
        SRGB_EXT: 0x8c40,
        SRGB_ALPHA_EXT: 0x8c42,
        SRGB8_ALPHA8_EXT: 0x8c43,
        FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT: 0x8210,
        // OES_standard_derivatives
        FRAGMENT_SHADER_DERIVATIVE_HINT_OES: 0x8b8b,
        // WEBGL_draw_buffers
        COLOR_ATTACHMENT0_WEBGL: 0x8ce0,
        COLOR_ATTACHMENT1_WEBGL: 0x8ce1,
        COLOR_ATTACHMENT2_WEBGL: 0x8ce2,
        COLOR_ATTACHMENT3_WEBGL: 0x8ce3,
        COLOR_ATTACHMENT4_WEBGL: 0x8ce4,
        COLOR_ATTACHMENT5_WEBGL: 0x8ce5,
        COLOR_ATTACHMENT6_WEBGL: 0x8ce6,
        COLOR_ATTACHMENT7_WEBGL: 0x8ce7,
        COLOR_ATTACHMENT8_WEBGL: 0x8ce8,
        COLOR_ATTACHMENT9_WEBGL: 0x8ce9,
        COLOR_ATTACHMENT10_WEBGL: 0x8cea,
        COLOR_ATTACHMENT11_WEBGL: 0x8ceb,
        COLOR_ATTACHMENT12_WEBGL: 0x8cec,
        COLOR_ATTACHMENT13_WEBGL: 0x8ced,
        COLOR_ATTACHMENT14_WEBGL: 0x8cee,
        COLOR_ATTACHMENT15_WEBGL: 0x8cef,
        DRAW_BUFFER0_WEBGL: 0x8825,
        DRAW_BUFFER1_WEBGL: 0x8826,
        DRAW_BUFFER2_WEBGL: 0x8827,
        DRAW_BUFFER3_WEBGL: 0x8828,
        DRAW_BUFFER4_WEBGL: 0x8829,
        DRAW_BUFFER5_WEBGL: 0x882a,
        DRAW_BUFFER6_WEBGL: 0x882b,
        DRAW_BUFFER7_WEBGL: 0x882c,
        DRAW_BUFFER8_WEBGL: 0x882d,
        DRAW_BUFFER9_WEBGL: 0x882e,
        DRAW_BUFFER10_WEBGL: 0x882f,
        DRAW_BUFFER11_WEBGL: 0x8830,
        DRAW_BUFFER12_WEBGL: 0x8831,
        DRAW_BUFFER13_WEBGL: 0x8832,
        DRAW_BUFFER14_WEBGL: 0x8833,
        DRAW_BUFFER15_WEBGL: 0x8834,
        MAX_COLOR_ATTACHMENTS_WEBGL: 0x8cdf,
        MAX_DRAW_BUFFERS_WEBGL: 0x8824,
        // OES_vertex_array_object
        VERTEX_ARRAY_BINDING_OES: 0x85b5,
        // EXT_disjoint_timer_query
        QUERY_COUNTER_BITS_EXT: 0x8864,
        CURRENT_QUERY_EXT: 0x8865,
        QUERY_RESULT_EXT: 0x8866,
        QUERY_RESULT_AVAILABLE_EXT: 0x8867,
        TIME_ELAPSED_EXT: 0x88bf,
        TIMESTAMP_EXT: 0x8e28,
        GPU_DISJOINT_EXT: 0x8fbb // A Boolean indicating whether or not the GPU performed any disjoint operation.
    };
},
"c6decbe3f5": /* models/echarts.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    class EChartsView extends html_box_1.HTMLBoxView {
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.data.change, () => this._plot());
            const { width, height, renderer, theme } = this.model.properties;
            this.on_change([width, height], () => this._resize());
            this.on_change([theme, renderer], () => this.render());
        }
        render() {
            super.render();
            const config = { width: this.model.width, height: this.model.height, renderer: this.model.renderer };
            if (this._chart != null)
                window.echarts.dispose(this._chart);
            this._chart = window.echarts.init(this.el, this.model.theme, config);
            this._plot();
        }
        after_layout() {
            super.after_layout();
            this._chart.resize();
        }
        _plot() {
            if (window.echarts == null)
                return;
            this._chart.setOption(this.model.data);
        }
        _resize() {
            this._chart.resize({ width: this.model.width, height: this.model.height });
        }
    }
    exports.EChartsView = EChartsView;
    EChartsView.__name__ = "EChartsView";
    class ECharts extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_ECharts() {
            this.prototype.default_view = EChartsView;
            this.define({
                data: [p.Any],
                theme: [p.String, "default"],
                renderer: [p.String, "canvas"]
            });
        }
    }
    exports.ECharts = ECharts;
    ECharts.__name__ = "ECharts";
    ECharts.__module__ = "panel.models.echarts";
    ECharts.init_ECharts();
},
"ed08037ce5": /* models/html.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const markup_1 = require("@bokehjs/models/widgets/markup");
    const layout_1 = require("7116a7a602") /* ./layout */;
    function htmlDecode(input) {
        var doc = new DOMParser().parseFromString(input, "text/html");
        return doc.documentElement.textContent;
    }
    exports.htmlDecode = htmlDecode;
    class HTMLView extends layout_1.PanelMarkupView {
        render() {
            super.render();
            const decoded = htmlDecode(this.model.text);
            const html = decoded || this.model.text;
            if (!html) {
                this.markup_el.innerHTML = '';
                return;
            }
            this.markup_el.innerHTML = html;
            Array.from(this.markup_el.querySelectorAll("script")).forEach(oldScript => {
                const newScript = document.createElement("script");
                Array.from(oldScript.attributes)
                    .forEach(attr => newScript.setAttribute(attr.name, attr.value));
                newScript.appendChild(document.createTextNode(oldScript.innerHTML));
                if (oldScript.parentNode)
                    oldScript.parentNode.replaceChild(newScript, oldScript);
            });
        }
    }
    exports.HTMLView = HTMLView;
    HTMLView.__name__ = "HTMLView";
    class HTML extends markup_1.Markup {
        constructor(attrs) {
            super(attrs);
        }
        static init_HTML() {
            this.prototype.default_view = HTMLView;
        }
    }
    exports.HTML = HTML;
    HTML.__name__ = "HTML";
    HTML.__module__ = "panel.models.markup";
    HTML.init_HTML();
},
"cb7ac8d1fa": /* models/ipywidget.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const layout_1 = require("7116a7a602") /* ./layout */;
    const Jupyter = window.Jupyter;
    class IPyWidgetView extends layout_1.PanelHTMLBoxView {
        constructor() {
            super(...arguments);
            this.rendered = false;
        }
        render() {
            super.render();
            this._render().then(() => {
                this.rendered = true;
                this.invalidate_layout();
                this.notify_finished();
            });
        }
        has_finished() {
            return this.rendered && super.has_finished();
        }
        async _render() {
            const { spec, state } = this.model.bundle;
            let manager;
            if ((Jupyter != null) && (Jupyter.notebook != null))
                manager = Jupyter.notebook.kernel.widget_manager;
            else if (window.PyViz.widget_manager != null)
                manager = window.PyViz.widget_manager;
            if (!manager) {
                console.log("Panel IPyWidget model could not find a WidgetManager");
                return;
            }
            if (this.ipyview == null) {
                const models = await manager.set_state(state);
                const model = models.find((item) => item.model_id == spec.model_id);
                if (model != null) {
                    const view = await manager.create_view(model, { el: this.el });
                    this.ipyview = view;
                    if (view.children_views) {
                        for (const child of view.children_views.views)
                            await child;
                    }
                    this.el.appendChild(view.el);
                    view.trigger('displayed', view);
                }
            }
            else
                this.el.appendChild(this.ipyview.el);
        }
    }
    exports.IPyWidgetView = IPyWidgetView;
    IPyWidgetView.__name__ = "IPyWidgetView";
    class IPyWidget extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_IPyWidget() {
            this.prototype.default_view = IPyWidgetView;
            this.define({
                bundle: [p.Any, {}],
            });
        }
    }
    exports.IPyWidget = IPyWidget;
    IPyWidget.__name__ = "IPyWidget";
    IPyWidget.__module__ = "panel.models.ipywidget";
    IPyWidget.init_IPyWidget();
},
"284504a0cf": /* models/json.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const markup_1 = require("@bokehjs/models/widgets/markup");
    const json_formatter_js_1 = tslib_1.__importDefault(require("18bba7b7e1") /* json-formatter-js */);
    const layout_1 = require("7116a7a602") /* ./layout */;
    class JSONView extends layout_1.PanelMarkupView {
        connect_signals() {
            super.connect_signals();
            const { depth, hover_preview, theme } = this.model.properties;
            this.on_change([depth, hover_preview, theme], () => this.render());
        }
        render() {
            super.render();
            const text = this.model.text.replace(/(\r\n|\n|\r)/gm, "").replace("'", '"');
            let json;
            try {
                json = window.JSON.parse(text);
            }
            catch (err) {
                this.markup_el.innerHTML = "<b>Invalid JSON:</b> " + err.toString();
                return;
            }
            const config = { hoverPreviewEnabled: this.model.hover_preview, theme: this.model.theme };
            const depth = this.model.depth == null ? Infinity : this.model.depth;
            const formatter = new json_formatter_js_1.default(json, depth, config);
            const rendered = formatter.render();
            let style = "border-radius: 5px; padding: 10px;";
            if (this.model.theme == "dark")
                rendered.style.cssText = "background-color: rgb(30, 30, 30);" + style;
            else
                rendered.style.cssText = style;
            this.markup_el.append(rendered);
        }
    }
    exports.JSONView = JSONView;
    JSONView.__name__ = "JSONView";
    const Theme = ["dark", "light"];
    class JSON extends markup_1.Markup {
        constructor(attrs) {
            super(attrs);
        }
        static init_JSON() {
            this.prototype.default_view = JSONView;
            this.define({
                depth: [p.Number, 1],
                hover_preview: [p.Boolean, false],
                theme: [p.Enum(Theme), "dark"],
            });
        }
    }
    exports.JSON = JSON;
    JSON.__name__ = "JSON";
    JSON.__module__ = "panel.models.markup";
    JSON.init_JSON();
},
"18bba7b7e1": /* json-formatter-js/dist/json-formatter.esm.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    function t(t) { return null === t ? "null" : typeof t; }
    function e(t) { return !!t && "object" == typeof t; }
    function r(t) {
        if (void 0 === t)
            return "";
        if (null === t)
            return "Object";
        if ("object" == typeof t && !t.constructor)
            return "Object";
        var e = /function ([^(]*)/.exec(t.constructor.toString());
        return e && e.length > 1 ? e[1] : "";
    }
    function n(t, e, r) { return "null" === t || "undefined" === t ? t : ("string" !== t && "stringifiable" !== t || (r = '"' + r.replace(/"/g, '\\"') + '"'), "function" === t ? e.toString().replace(/[\r\n]/g, "").replace(/\{.*\}/, "") + "{…}" : r); }
    function o(o) { var i = ""; return e(o) ? (i = r(o), Array.isArray(o) && (i += "[" + o.length + "]")) : i = n(t(o), o, o), i; }
    function i(t) { return "json-formatter-" + t; }
    function s(t, e, r) { var n = document.createElement(t); return e && n.classList.add(i(e)), void 0 !== r && (r instanceof Node ? n.appendChild(r) : n.appendChild(document.createTextNode(String(r)))), n; }
    !function (t) {
        if (t && "undefined" != typeof window) {
            var e = document.createElement("style");
            e.setAttribute("media", "screen"), e.innerHTML = t, document.head.appendChild(e);
        }
    }('.json-formatter-row {\n  font-family: monospace;\n}\n.json-formatter-row,\n.json-formatter-row a,\n.json-formatter-row a:hover {\n  color: black;\n  text-decoration: none;\n}\n.json-formatter-row .json-formatter-row {\n  margin-left: 1rem;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty {\n  opacity: 0.5;\n  margin-left: 1rem;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty:after {\n  display: none;\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-object:after {\n  content: "No properties";\n}\n.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-array:after {\n  content: "[]";\n}\n.json-formatter-row .json-formatter-string,\n.json-formatter-row .json-formatter-stringifiable {\n  color: green;\n  white-space: pre;\n  word-wrap: break-word;\n}\n.json-formatter-row .json-formatter-number {\n  color: blue;\n}\n.json-formatter-row .json-formatter-boolean {\n  color: red;\n}\n.json-formatter-row .json-formatter-null {\n  color: #855A00;\n}\n.json-formatter-row .json-formatter-undefined {\n  color: #ca0b69;\n}\n.json-formatter-row .json-formatter-function {\n  color: #FF20ED;\n}\n.json-formatter-row .json-formatter-date {\n  background-color: rgba(0, 0, 0, 0.05);\n}\n.json-formatter-row .json-formatter-url {\n  text-decoration: underline;\n  color: blue;\n  cursor: pointer;\n}\n.json-formatter-row .json-formatter-bracket {\n  color: blue;\n}\n.json-formatter-row .json-formatter-key {\n  color: #00008B;\n  padding-right: 0.2rem;\n}\n.json-formatter-row .json-formatter-toggler-link {\n  cursor: pointer;\n}\n.json-formatter-row .json-formatter-toggler {\n  line-height: 1.2rem;\n  font-size: 0.7rem;\n  vertical-align: middle;\n  opacity: 0.6;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-row .json-formatter-toggler:after {\n  display: inline-block;\n  transition: transform 100ms ease-in;\n  content: "►";\n}\n.json-formatter-row > a > .json-formatter-preview-text {\n  opacity: 0;\n  transition: opacity 0.15s ease-in;\n  font-style: italic;\n}\n.json-formatter-row:hover > a > .json-formatter-preview-text {\n  opacity: 0.6;\n}\n.json-formatter-row.json-formatter-open > .json-formatter-toggler-link .json-formatter-toggler:after {\n  transform: rotate(90deg);\n}\n.json-formatter-row.json-formatter-open > .json-formatter-children:after {\n  display: inline-block;\n}\n.json-formatter-row.json-formatter-open > a > .json-formatter-preview-text {\n  display: none;\n}\n.json-formatter-row.json-formatter-open.json-formatter-empty:after {\n  display: block;\n}\n.json-formatter-dark.json-formatter-row {\n  font-family: monospace;\n}\n.json-formatter-dark.json-formatter-row,\n.json-formatter-dark.json-formatter-row a,\n.json-formatter-dark.json-formatter-row a:hover {\n  color: white;\n  text-decoration: none;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-row {\n  margin-left: 1rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty {\n  opacity: 0.5;\n  margin-left: 1rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty:after {\n  display: none;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-object:after {\n  content: "No properties";\n}\n.json-formatter-dark.json-formatter-row .json-formatter-children.json-formatter-empty.json-formatter-array:after {\n  content: "[]";\n}\n.json-formatter-dark.json-formatter-row .json-formatter-string,\n.json-formatter-dark.json-formatter-row .json-formatter-stringifiable {\n  color: #31F031;\n  white-space: pre;\n  word-wrap: break-word;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-number {\n  color: #66C2FF;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-boolean {\n  color: #EC4242;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-null {\n  color: #EEC97D;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-undefined {\n  color: #ef8fbe;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-function {\n  color: #FD48CB;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-date {\n  background-color: rgba(255, 255, 255, 0.05);\n}\n.json-formatter-dark.json-formatter-row .json-formatter-url {\n  text-decoration: underline;\n  color: #027BFF;\n  cursor: pointer;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-bracket {\n  color: #9494FF;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-key {\n  color: #23A0DB;\n  padding-right: 0.2rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-toggler-link {\n  cursor: pointer;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-toggler {\n  line-height: 1.2rem;\n  font-size: 0.7rem;\n  vertical-align: middle;\n  opacity: 0.6;\n  cursor: pointer;\n  padding-right: 0.2rem;\n}\n.json-formatter-dark.json-formatter-row .json-formatter-toggler:after {\n  display: inline-block;\n  transition: transform 100ms ease-in;\n  content: "►";\n}\n.json-formatter-dark.json-formatter-row > a > .json-formatter-preview-text {\n  opacity: 0;\n  transition: opacity 0.15s ease-in;\n  font-style: italic;\n}\n.json-formatter-dark.json-formatter-row:hover > a > .json-formatter-preview-text {\n  opacity: 0.6;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > .json-formatter-toggler-link .json-formatter-toggler:after {\n  transform: rotate(90deg);\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > .json-formatter-children:after {\n  display: inline-block;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open > a > .json-formatter-preview-text {\n  display: none;\n}\n.json-formatter-dark.json-formatter-row.json-formatter-open.json-formatter-empty:after {\n  display: block;\n}\n');
    var a = /(^\d{1,4}[\.|\\/|-]\d{1,2}[\.|\\/|-]\d{1,4})(\s*(?:0?[1-9]:[0-5]|1(?=[012])\d:[0-5])\d\s*[ap]m)?$/, f = /\d{2}:\d{2}:\d{2} GMT-\d{4}/, m = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z/, l = window.requestAnimationFrame || function (t) { return t(), 0; }, d = { hoverPreviewEnabled: !1, hoverPreviewArrayCount: 100, hoverPreviewFieldCount: 5, animateOpen: !0, animateClose: !0, theme: null, useToJSON: !0, sortPropertiesBy: null }, c = function () {
        function c(t, e, r, n) { void 0 === e && (e = 1), void 0 === r && (r = d), this.json = t, this.open = e, this.config = r, this.key = n, this._isOpen = null, void 0 === this.config.hoverPreviewEnabled && (this.config.hoverPreviewEnabled = d.hoverPreviewEnabled), void 0 === this.config.hoverPreviewArrayCount && (this.config.hoverPreviewArrayCount = d.hoverPreviewArrayCount), void 0 === this.config.hoverPreviewFieldCount && (this.config.hoverPreviewFieldCount = d.hoverPreviewFieldCount), void 0 === this.config.useToJSON && (this.config.useToJSON = d.useToJSON), "" === this.key && (this.key = '""'); }
        return Object.defineProperty(c.prototype, "isOpen", { get: function () { return null !== this._isOpen ? this._isOpen : this.open > 0; }, set: function (t) { this._isOpen = t; }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "isDate", { get: function () { return this.json instanceof Date || "string" === this.type && (a.test(this.json) || m.test(this.json) || f.test(this.json)); }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "isUrl", { get: function () { return "string" === this.type && 0 === this.json.indexOf("http"); }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "isArray", { get: function () { return Array.isArray(this.json); }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "isObject", { get: function () { return e(this.json); }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "isEmptyObject", { get: function () { return !this.keys.length && !this.isArray; }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "isEmpty", { get: function () { return this.isEmptyObject || this.keys && !this.keys.length && this.isArray; }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "useToJSON", { get: function () { return this.config.useToJSON && "stringifiable" === this.type; }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "hasKey", { get: function () { return void 0 !== this.key; }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "constructorName", { get: function () { return r(this.json); }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "type", { get: function () { return this.config.useToJSON && this.json && this.json.toJSON ? "stringifiable" : t(this.json); }, enumerable: !0, configurable: !0 }), Object.defineProperty(c.prototype, "keys", { get: function () {
                if (this.isObject) {
                    var t = Object.keys(this.json);
                    return !this.isArray && this.config.sortPropertiesBy ? t.sort(this.config.sortPropertiesBy) : t;
                }
                return [];
            }, enumerable: !0, configurable: !0 }), c.prototype.toggleOpen = function () { this.isOpen = !this.isOpen, this.element && (this.isOpen ? this.appendChildren(this.config.animateOpen) : this.removeChildren(this.config.animateClose), this.element.classList.toggle(i("open"))); }, c.prototype.openAtDepth = function (t) { void 0 === t && (t = 1), t < 0 || (this.open = t, this.isOpen = 0 !== t, this.element && (this.removeChildren(!1), 0 === t ? this.element.classList.remove(i("open")) : (this.appendChildren(this.config.animateOpen), this.element.classList.add(i("open"))))); }, c.prototype.getInlinepreview = function () {
            var t = this;
            if (this.isArray)
                return this.json.length > this.config.hoverPreviewArrayCount ? "Array[" + this.json.length + "]" : "[" + this.json.map(o).join(", ") + "]";
            var e = this.keys, r = e.slice(0, this.config.hoverPreviewFieldCount).map((function (e) { return e + ":" + o(t.json[e]); })), n = e.length >= this.config.hoverPreviewFieldCount ? "…" : "";
            return "{" + r.join(", ") + n + "}";
        }, c.prototype.render = function () {
            this.element = s("div", "row");
            var t = this.isObject ? s("a", "toggler-link") : s("span");
            if (this.isObject && !this.useToJSON && t.appendChild(s("span", "toggler")), this.hasKey && t.appendChild(s("span", "key", this.key + ":")), this.isObject && !this.useToJSON) {
                var e = s("span", "value"), r = s("span"), o = s("span", "constructor-name", this.constructorName);
                if (r.appendChild(o), this.isArray) {
                    var a = s("span");
                    a.appendChild(s("span", "bracket", "[")), a.appendChild(s("span", "number", this.json.length)), a.appendChild(s("span", "bracket", "]")), r.appendChild(a);
                }
                e.appendChild(r), t.appendChild(e);
            }
            else {
                (e = this.isUrl ? s("a") : s("span")).classList.add(i(this.type)), this.isDate && e.classList.add(i("date")), this.isUrl && (e.classList.add(i("url")), e.setAttribute("href", this.json));
                var f = n(this.type, this.json, this.useToJSON ? this.json.toJSON() : this.json);
                e.appendChild(document.createTextNode(f)), t.appendChild(e);
            }
            if (this.isObject && this.config.hoverPreviewEnabled) {
                var m = s("span", "preview-text");
                m.appendChild(document.createTextNode(this.getInlinepreview())), t.appendChild(m);
            }
            var l = s("div", "children");
            return this.isObject && l.classList.add(i("object")), this.isArray && l.classList.add(i("array")), this.isEmpty && l.classList.add(i("empty")), this.config && this.config.theme && this.element.classList.add(i(this.config.theme)), this.isOpen && this.element.classList.add(i("open")), this.element.appendChild(t), this.element.appendChild(l), this.isObject && this.isOpen && this.appendChildren(), this.isObject && !this.useToJSON && t.addEventListener("click", this.toggleOpen.bind(this)), this.element;
        }, c.prototype.appendChildren = function (t) {
            var e = this;
            void 0 === t && (t = !1);
            var r = this.element.querySelector("div." + i("children"));
            if (r && !this.isEmpty)
                if (t) {
                    var n = 0, o = function () { var t = e.keys[n], i = new c(e.json[t], e.open - 1, e.config, t); r.appendChild(i.render()), (n += 1) < e.keys.length && (n > 10 ? o() : l(o)); };
                    l(o);
                }
                else
                    this.keys.forEach((function (t) { var n = new c(e.json[t], e.open - 1, e.config, t); r.appendChild(n.render()); }));
        }, c.prototype.removeChildren = function (t) {
            void 0 === t && (t = !1);
            var e = this.element.querySelector("div." + i("children"));
            if (t) {
                var r = 0, n = function () { e && e.children.length && (e.removeChild(e.children[0]), (r += 1) > 10 ? n() : l(n)); };
                l(n);
            }
            else
                e && (e.innerHTML = "");
        }, c;
    }();
    exports.default = c;
},
"7a99dba4eb": /* models/file_download.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const input_widget_1 = require("@bokehjs/models/widgets/input_widget");
    const buttons_1 = require("@bokehjs/styles/buttons");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    function dataURItoBlob(dataURI) {
        // convert base64 to raw binary data held in a string
        const byteString = atob(dataURI.split(',')[1]);
        // separate out the mime component
        const mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
        // write the bytes of the string to an ArrayBuffer
        const ab = new ArrayBuffer(byteString.length);
        const ia = new Uint8Array(ab);
        for (let i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }
        // write the ArrayBuffer to a blob, and you're done
        var bb = new Blob([ab], { type: mimeString });
        return bb;
    }
    class FileDownloadView extends input_widget_1.InputWidgetView {
        constructor() {
            super(...arguments);
            this._downloadable = false;
            this._embed = false;
            this._prev_href = "";
            this._prev_download = "";
        }
        initialize() {
            super.initialize();
            if (this.model.data && this.model.filename) {
                this._embed = true;
            }
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.button_type.change, () => this._update_button_style());
            this.connect(this.model.properties.filename.change, () => this._update_download());
            this.connect(this.model.properties._transfers.change, () => this._handle_click());
            this.connect(this.model.properties.label.change, () => this._update_label());
        }
        render() {
            super.render();
            this.group_el.style.display = "flex";
            this.group_el.style.alignItems = "stretch";
            // Create an anchor HTML element that is styled as a bokeh button.
            // When its 'href' and 'download' attributes are set, it's a downloadable link:
            // * A click triggers a download
            // * A right click allows to "Save as" the file
            // There are three main cases:
            // 1. embed=True: The widget is a download link
            // 2. auto=False: The widget is first a button and becomes a download link after the first click
            // 3. auto=True: The widget is a button, i.e right click to "Save as..." won't work
            this.anchor_el = document.createElement('a');
            this._update_button_style();
            this._update_label();
            // Changing the disabled property calls render() so it needs to be handled here.
            // This callback is inherited from ControlView in bokehjs.
            if (this.model.disabled) {
                this.anchor_el.setAttribute("disabled", "");
                this._downloadable = false;
            }
            else {
                this.anchor_el.removeAttribute("disabled");
                // auto=False + toggle Disabled ==> Needs to reset the link as it was.
                if (this._prev_download) {
                    this.anchor_el.download = this._prev_download;
                }
                if (this._prev_href) {
                    this.anchor_el.href = this._prev_href;
                }
                if (this.anchor_el.download && this.anchor_el.download) {
                    this._downloadable = true;
                }
            }
            // If embedded the button is just a download link.
            // Otherwise clicks will be handled by the code itself, allowing for more interactivity.
            if (this._embed) {
                this._make_link_downloadable();
            }
            else {
                // Add a "click" listener, note that it's not going to
                // handle right clicks (they won't increment 'clicks')
                this._click_listener = this._increment_clicks.bind(this);
                this.anchor_el.addEventListener("click", this._click_listener);
            }
            this.group_el.appendChild(this.anchor_el);
        }
        _increment_clicks() {
            this.model.clicks = this.model.clicks + 1;
        }
        _handle_click() {
            // When auto=False the button becomes a link which no longer
            // requires being updated.
            if (!this.model.auto && this._downloadable) {
                return;
            }
            this._make_link_downloadable();
            if (!this._embed && this.model.auto) {
                // Temporarily removing the event listener to emulate a click
                // event on the anchor link which will trigger a download.
                this.anchor_el.removeEventListener("click", this._click_listener);
                this.anchor_el.click();
                // In this case #3 the widget is not a link so these attributes are removed.
                this.anchor_el.removeAttribute("href");
                this.anchor_el.removeAttribute("download");
                this.anchor_el.addEventListener("click", this._click_listener);
            }
            // Store the current state for handling changes of the disabled property.
            this._prev_href = this.anchor_el.getAttribute("href");
            this._prev_download = this.anchor_el.getAttribute("download");
        }
        _make_link_downloadable() {
            this._update_href();
            this._update_download();
            if (this.anchor_el.download && this.anchor_el.href) {
                this._downloadable = true;
            }
        }
        _update_href() {
            if (this.model.data) {
                const blob = dataURItoBlob(this.model.data);
                this.anchor_el.href = URL.createObjectURL(blob);
            }
        }
        _update_download() {
            if (this.model.filename) {
                this.anchor_el.download = this.model.filename;
            }
        }
        _update_label() {
            this.anchor_el.textContent = this.model.label;
        }
        _update_button_style() {
            if (!this.anchor_el.hasAttribute("class")) { // When the widget is rendered.
                this.anchor_el.classList.add(buttons_1.bk_btn);
                this.anchor_el.classList.add(buttons_1.bk_btn_type(this.model.button_type));
            }
            else { // When the button type is changed.
                const prev_button_type = this.anchor_el.classList.item(1);
                if (prev_button_type) {
                    this.anchor_el.classList.replace(prev_button_type, buttons_1.bk_btn_type(this.model.button_type));
                }
            }
        }
    }
    exports.FileDownloadView = FileDownloadView;
    FileDownloadView.__name__ = "FileDownloadView";
    class FileDownload extends input_widget_1.InputWidget {
        constructor(attrs) {
            super(attrs);
        }
        static init_FileDownload() {
            this.prototype.default_view = FileDownloadView;
            this.define({
                auto: [p.Boolean, false],
                clicks: [p.Number, 0],
                data: [p.NullString, null],
                label: [p.String, "Download"],
                filename: [p.String, null],
                button_type: [p.ButtonType, "default"],
                _transfers: [p.Number, 0],
            });
            this.override({
                title: "",
            });
        }
    }
    exports.FileDownload = FileDownload;
    FileDownload.__name__ = "FileDownload";
    FileDownload.__module__ = "panel.models.widgets";
    FileDownload.init_FileDownload();
},
"7b859fb3cf": /* models/katex.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const markup_1 = require("@bokehjs/models/widgets/markup");
    const layout_1 = require("7116a7a602") /* ./layout */;
    class KaTeXView extends layout_1.PanelMarkupView {
        render() {
            super.render();
            this.markup_el.innerHTML = this.model.text;
            if (!window.renderMathInElement) {
                return;
            }
            window.renderMathInElement(this.el, {
                delimiters: [
                    { left: "$$", right: "$$", display: true },
                    { left: "\\[", right: "\\]", display: true },
                    { left: "$", right: "$", display: false },
                    { left: "\\(", right: "\\)", display: false }
                ]
            });
        }
    }
    exports.KaTeXView = KaTeXView;
    KaTeXView.__name__ = "KaTeXView";
    class KaTeX extends markup_1.Markup {
        constructor(attrs) {
            super(attrs);
        }
        static init_KaTeX() {
            this.prototype.default_view = KaTeXView;
        }
    }
    exports.KaTeX = KaTeX;
    KaTeX.__name__ = "KaTeX";
    KaTeX.__module__ = "panel.models.katex";
    KaTeX.init_KaTeX();
},
"aded270681": /* models/location.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const view_1 = require("@bokehjs/core/view");
    const model_1 = require("@bokehjs/model");
    class LocationView extends view_1.View {
        initialize() {
            super.initialize();
            this.model.pathname = window.location.pathname;
            this.model.search = window.location.search;
            this.model.hash = window.location.hash;
            // Readonly parameters on python side
            this.model.href = window.location.href;
            this.model.hostname = window.location.hostname;
            this.model.protocol = window.location.protocol;
            this.model.port = window.location.port;
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.pathname.change, () => this.update('pathname'));
            this.connect(this.model.properties.search.change, () => this.update('search'));
            this.connect(this.model.properties.hash.change, () => this.update('hash'));
            this.connect(this.model.properties.reload.change, () => this.update('reload'));
        }
        update(change) {
            if (!this.model.reload || (change === 'reload')) {
                window.history.pushState({}, '', `${this.model.pathname}${this.model.search}${this.model.hash}`);
                this.model.href = window.location.href;
                if (change === 'reload')
                    window.location.reload();
            }
            else {
                if (change == 'pathname')
                    window.location.pathname = this.model.pathname;
                if (change == 'search')
                    window.location.search = this.model.search;
                if (change == 'hash')
                    window.location.hash = this.model.hash;
            }
        }
    }
    exports.LocationView = LocationView;
    LocationView.__name__ = "LocationView";
    class Location extends model_1.Model {
        constructor(attrs) {
            super(attrs);
        }
        static init_Location() {
            this.prototype.default_view = LocationView;
            this.define({
                href: [p.String, ''],
                hostname: [p.String, ''],
                pathname: [p.String, ''],
                protocol: [p.String, ''],
                port: [p.String, ''],
                search: [p.String, ''],
                hash: [p.String, ''],
                reload: [p.Boolean, false],
            });
        }
    }
    exports.Location = Location;
    Location.__name__ = "Location";
    Location.__module__ = "panel.models.location";
    Location.init_Location();
},
"0c21036737": /* models/mathjax.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const markup_1 = require("@bokehjs/models/widgets/markup");
    const layout_1 = require("7116a7a602") /* ./layout */;
    class MathJaxView extends layout_1.PanelMarkupView {
        initialize() {
            super.initialize();
            this._hub = window.MathJax.Hub;
            this._hub.Config({
                tex2jax: { inlineMath: [['$', '$'], ['\\(', '\\)']] }
            });
        }
        render() {
            super.render();
            if (!this._hub) {
                return;
            }
            this.markup_el.innerHTML = this.model.text;
            this._hub.Queue(["Typeset", this._hub, this.markup_el]);
        }
    }
    exports.MathJaxView = MathJaxView;
    MathJaxView.__name__ = "MathJaxView";
    class MathJax extends markup_1.Markup {
        constructor(attrs) {
            super(attrs);
        }
        static init_MathJax() {
            this.prototype.default_view = MathJaxView;
        }
    }
    exports.MathJax = MathJax;
    MathJax.__name__ = "MathJax";
    MathJax.__module__ = "panel.models.mathjax";
    MathJax.init_MathJax();
},
"79c41bbf71": /* models/player.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const dom_1 = require("@bokehjs/core/dom");
    const widget_1 = require("@bokehjs/models/widgets/widget");
    function press(btn_list) {
        btn_list.forEach((btn) => btn.style.borderStyle = 'inset');
    }
    function unpress(btn_list) {
        btn_list.forEach((btn) => btn.style.borderStyle = 'outset');
    }
    class PlayerView extends widget_1.WidgetView {
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.change, () => this.render());
            this.connect(this.model.properties.value.change, () => this.render());
            this.connect(this.model.properties.loop_policy.change, () => this.set_loop_state(this.model.loop_policy));
            this.connect(this.model.properties.show_loop_controls.change, () => {
                if (this.model.show_loop_controls && this.loop_state.parentNode != this.groupEl)
                    this.groupEl.appendChild(this.loop_state);
                else if (!this.model.show_loop_controls && this.loop_state.parentNode == this.groupEl)
                    this.el.removeChild(this.loop_state);
            });
        }
        get_height() {
            return 250;
        }
        render() {
            if (this.sliderEl == null) {
                super.render();
            }
            else {
                this.sliderEl.min = String(this.model.start);
                this.sliderEl.max = String(this.model.end);
                this.sliderEl.value = String(this.model.value);
                return;
            }
            // Layout to group the elements
            this.groupEl = dom_1.div();
            this.groupEl.style.display = "flex";
            this.groupEl.style.flexDirection = "column";
            this.groupEl.style.alignItems = "center";
            // Slider
            this.sliderEl = document.createElement('input');
            this.sliderEl.style.width = "100%";
            this.sliderEl.setAttribute("type", "range");
            this.sliderEl.value = String(this.model.value);
            this.sliderEl.min = String(this.model.start);
            this.sliderEl.max = String(this.model.end);
            this.sliderEl.onchange = (ev) => this.set_frame(parseInt(ev.target.value));
            // Buttons
            const button_div = dom_1.div();
            button_div.style.cssText = "margin: 0 auto; display: flex; padding: 5px; align-items: stretch; width: 100%;";
            const button_style_small = "text-align: center; min-width: 20px; flex-grow: 1; margin: 2px";
            const button_style = "text-align: center; min-width: 40px; flex-grow: 2; margin: 2px";
            const slower = document.createElement('button');
            slower.style.cssText = button_style_small;
            slower.appendChild(document.createTextNode('–'));
            slower.onclick = () => this.slower();
            button_div.appendChild(slower);
            const first = document.createElement('button');
            first.style.cssText = button_style;
            first.appendChild(document.createTextNode('\u275a\u25c0\u25c0'));
            first.onclick = () => this.first_frame();
            button_div.appendChild(first);
            const previous = document.createElement('button');
            previous.style.cssText = button_style;
            previous.appendChild(document.createTextNode('\u275a\u25c0'));
            previous.onclick = () => this.previous_frame();
            button_div.appendChild(previous);
            const reverse = document.createElement('button');
            reverse.style.cssText = button_style;
            reverse.appendChild(document.createTextNode('\u25c0'));
            reverse.onclick = () => this.reverse_animation();
            button_div.appendChild(reverse);
            const pause = document.createElement('button');
            pause.style.cssText = button_style;
            pause.appendChild(document.createTextNode('\u275a\u275a'));
            pause.onclick = () => this.pause_animation();
            button_div.appendChild(pause);
            const play = document.createElement('button');
            play.style.cssText = button_style;
            play.appendChild(document.createTextNode('\u25b6'));
            play.onclick = () => this.play_animation();
            button_div.appendChild(play);
            const next = document.createElement('button');
            next.style.cssText = button_style;
            next.appendChild(document.createTextNode('\u25b6\u275a'));
            next.onclick = () => this.next_frame();
            button_div.appendChild(next);
            const last = document.createElement('button');
            last.style.cssText = button_style;
            last.appendChild(document.createTextNode('\u25b6\u25b6\u275a'));
            last.onclick = () => this.last_frame();
            button_div.appendChild(last);
            const faster = document.createElement('button');
            faster.style.cssText = button_style_small;
            faster.appendChild(document.createTextNode('+'));
            faster.onclick = () => this.faster();
            button_div.appendChild(faster);
            // toggle
            this._toggle_reverse = () => {
                unpress([pause, play]);
                press([reverse]);
            };
            this._toogle_pause = () => {
                unpress([reverse, play]);
                press([pause]);
            };
            this._toggle_play = () => {
                unpress([reverse, pause]);
                press([play]);
            };
            // Loop control
            this.loop_state = document.createElement('form');
            this.loop_state.style.cssText = "margin: 0 auto; display: table";
            const once = document.createElement('input');
            once.type = "radio";
            once.value = "once";
            once.name = "state";
            const once_label = document.createElement('label');
            once_label.innerHTML = "Once";
            once_label.style.cssText = "padding: 0 10px 0 5px; user-select:none;";
            const loop = document.createElement('input');
            loop.setAttribute("type", "radio");
            loop.setAttribute("value", "loop");
            loop.setAttribute("name", "state");
            const loop_label = document.createElement('label');
            loop_label.innerHTML = "Loop";
            loop_label.style.cssText = "padding: 0 10px 0 5px; user-select:none;";
            const reflect = document.createElement('input');
            reflect.setAttribute("type", "radio");
            reflect.setAttribute("value", "reflect");
            reflect.setAttribute("name", "state");
            const reflect_label = document.createElement('label');
            reflect_label.innerHTML = "Reflect";
            reflect_label.style.cssText = "padding: 0 10px 0 5px; user-select:none;";
            if (this.model.loop_policy == "once")
                once.checked = true;
            else if (this.model.loop_policy == "loop")
                loop.checked = true;
            else
                reflect.checked = true;
            // Compose everything
            this.loop_state.appendChild(once);
            this.loop_state.appendChild(once_label);
            this.loop_state.appendChild(loop);
            this.loop_state.appendChild(loop_label);
            this.loop_state.appendChild(reflect);
            this.loop_state.appendChild(reflect_label);
            this.groupEl.appendChild(this.sliderEl);
            this.groupEl.appendChild(button_div);
            if (this.model.show_loop_controls)
                this.groupEl.appendChild(this.loop_state);
            this.el.appendChild(this.groupEl);
        }
        set_frame(frame) {
            if (this.model.value != frame)
                this.model.value = frame;
            if (this.sliderEl.value != String(frame))
                this.sliderEl.value = String(frame);
        }
        get_loop_state() {
            var button_group = this.loop_state.state;
            for (var i = 0; i < button_group.length; i++) {
                var button = button_group[i];
                if (button.checked)
                    return button.value;
            }
            return "once";
        }
        set_loop_state(state) {
            var button_group = this.loop_state.state;
            for (var i = 0; i < button_group.length; i++) {
                var button = button_group[i];
                if (button.value == state)
                    button.checked = true;
            }
        }
        next_frame() {
            this.set_frame(Math.min(this.model.end, this.model.value + this.model.step));
        }
        previous_frame() {
            this.set_frame(Math.max(this.model.start, this.model.value - this.model.step));
        }
        first_frame() {
            this.set_frame(this.model.start);
        }
        last_frame() {
            this.set_frame(this.model.end);
        }
        slower() {
            this.model.interval = Math.round(this.model.interval / 0.7);
            if (this.model.direction > 0)
                this.play_animation();
            else if (this.model.direction < 0)
                this.reverse_animation();
        }
        faster() {
            this.model.interval = Math.round(this.model.interval * 0.7);
            if (this.model.direction > 0)
                this.play_animation();
            else if (this.model.direction < 0)
                this.reverse_animation();
        }
        anim_step_forward() {
            if (this.model.value < this.model.end) {
                this.next_frame();
            }
            else {
                var loop_state = this.get_loop_state();
                if (loop_state == "loop") {
                    this.first_frame();
                }
                else if (loop_state == "reflect") {
                    this.last_frame();
                    this.reverse_animation();
                }
                else {
                    this.pause_animation();
                    this.last_frame();
                }
            }
        }
        anim_step_reverse() {
            if (this.model.value > this.model.start) {
                this.previous_frame();
            }
            else {
                var loop_state = this.get_loop_state();
                if (loop_state == "loop") {
                    this.last_frame();
                }
                else if (loop_state == "reflect") {
                    this.first_frame();
                    this.play_animation();
                }
                else {
                    this.pause_animation();
                    this.first_frame();
                }
            }
        }
        pause_animation() {
            this._toogle_pause();
            this.model.direction = 0;
            if (this.timer) {
                clearInterval(this.timer);
                this.timer = null;
            }
        }
        play_animation() {
            this.pause_animation();
            this._toggle_play();
            this.model.direction = 1;
            if (!this.timer)
                this.timer = setInterval(() => this.anim_step_forward(), this.model.interval);
        }
        reverse_animation() {
            this.pause_animation();
            this._toggle_reverse();
            this.model.direction = -1;
            if (!this.timer)
                this.timer = setInterval(() => this.anim_step_reverse(), this.model.interval);
        }
    }
    exports.PlayerView = PlayerView;
    PlayerView.__name__ = "PlayerView";
    class Player extends widget_1.Widget {
        constructor(attrs) {
            super(attrs);
        }
        static init_Player() {
            this.prototype.default_view = PlayerView;
            this.define({
                direction: [p.Number, 0],
                interval: [p.Number, 500],
                start: [p.Number,],
                end: [p.Number,],
                step: [p.Number, 1],
                loop_policy: [p.Any, "once"],
                value: [p.Any, 0],
                show_loop_controls: [p.Boolean, true],
            });
            this.override({ width: 400 });
        }
    }
    exports.Player = Player;
    Player.__name__ = "Player";
    Player.__module__ = "panel.models.widgets";
    Player.init_Player();
},
"47b5ae5c43": /* models/plotly.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const dom_1 = require("@bokehjs/core/dom");
    const object_1 = require("@bokehjs/core/util/object");
    const eq_1 = require("@bokehjs/core/util/eq");
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const debounce_1 = require("99a25e6992") /* debounce */;
    const util_1 = require("990b5dd5c7") /* ./util */;
    const layout_1 = require("7116a7a602") /* ./layout */;
    const filterEventData = (gd, eventData, event) => {
        // Ported from dash-core-components/src/components/Graph.react.js
        let filteredEventData = Array.isArray(eventData) ? [] : {};
        if (event === "click" || event === "hover" || event === "selected") {
            const points = [];
            if (eventData === undefined || eventData === null) {
                return null;
            }
            /*
             * remove `data`, `layout`, `xaxis`, etc
             * objects from the event data since they're so big
             * and cause JSON stringify ciricular structure errors.
             *
             * also, pull down the `customdata` point from the data array
             * into the event object
             */
            const data = gd.data;
            for (let i = 0; i < eventData.points.length; i++) {
                const fullPoint = eventData.points[i];
                let pointData = {};
                for (let property in fullPoint) {
                    const val = fullPoint[property];
                    if (fullPoint.hasOwnProperty(property) &&
                        !Array.isArray(val) && !util_1.isPlainObject(val)) {
                        pointData[property] = val;
                    }
                }
                if (fullPoint !== undefined && fullPoint !== null) {
                    if (fullPoint.hasOwnProperty("curveNumber") &&
                        fullPoint.hasOwnProperty("pointNumber") &&
                        data[fullPoint["curveNumber"]].hasOwnProperty("customdata")) {
                        pointData["customdata"] =
                            data[fullPoint["curveNumber"]].customdata[fullPoint["pointNumber"]];
                    }
                    // specific to histogram. see https://github.com/plotly/plotly.js/pull/2113/
                    if (fullPoint.hasOwnProperty('pointNumbers')) {
                        pointData["pointNumbers"] = fullPoint.pointNumbers;
                    }
                }
                points[i] = pointData;
            }
            filteredEventData["points"] = points;
        }
        else if (event === 'relayout' || event === 'restyle') {
            /*
             * relayout shouldn't include any big objects
             * it will usually just contain the ranges of the axes like
             * "xaxis.range[0]": 0.7715822247381828,
             * "xaxis.range[1]": 3.0095292008680063`
             */
            for (let property in eventData) {
                if (eventData.hasOwnProperty(property)) {
                    filteredEventData[property] = eventData[property];
                }
            }
        }
        if (eventData.hasOwnProperty('range')) {
            filteredEventData["range"] = eventData["range"];
        }
        if (eventData.hasOwnProperty('lassoPoints')) {
            filteredEventData["lassoPoints"] = eventData["lassoPoints"];
        }
        return filteredEventData;
    };
    const _isHidden = (gd) => {
        var display = window.getComputedStyle(gd).display;
        return !display || display === 'none';
    };
    class PlotlyPlotView extends layout_1.PanelHTMLBoxView {
        constructor() {
            super(...arguments);
            this._settingViewport = false;
            this._plotInitialized = false;
            this._reacting = false;
            this._relayouting = false;
            this._end_relayouting = debounce_1.debounce(() => {
                this._relayouting = false;
            }, 2000, false);
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.viewport_update_policy.change, this._updateSetViewportFunction);
            this.connect(this.model.properties.viewport_update_throttle.change, this._updateSetViewportFunction);
            this.connect(this.model.properties._render_count.change, this.plot);
            this.connect(this.model.properties.viewport.change, this._updateViewportFromProperty);
        }
        render() {
            super.render();
            this._layout_wrapper = dom_1.div({ style: "height: 100%; width: 100%" });
            this.el.appendChild(this._layout_wrapper);
            if (!window.Plotly) {
                return;
            }
            this.plot();
        }
        plot() {
            if (!window.Plotly) {
                return;
            }
            const data = [];
            for (let i = 0; i < this.model.data.length; i++) {
                data.push(this._get_trace(i, false));
            }
            let newLayout = util_1.deepCopy(this.model.layout);
            if (this._relayouting) {
                const { layout } = this._layout_wrapper;
                // For each xaxis* and yaxis* property of layout, if the value has a 'range'
                // property then use this in newLayout
                Object.keys(layout).reduce((value, key) => {
                    if (key.slice(1, 5) === "axis" && 'range' in value) {
                        newLayout[key].range = value.range;
                    }
                }, {});
            }
            this._reacting = true;
            window.Plotly.react(this._layout_wrapper, data, newLayout, this.model.config).then(() => {
                this._updateSetViewportFunction();
                this._updateViewportProperty();
                if (!this._plotInitialized) {
                    // Install callbacks
                    //  - plotly_relayout
                    this._layout_wrapper.on('plotly_relayout', (eventData) => {
                        if (eventData['_update_from_property'] !== true) {
                            this.model.relayout_data = filterEventData(this._layout_wrapper, eventData, 'relayout');
                            this._updateViewportProperty();
                            this._end_relayouting();
                        }
                    });
                    //  - plotly_relayouting
                    this._layout_wrapper.on('plotly_relayouting', () => {
                        if (this.model.viewport_update_policy !== 'mouseup') {
                            this._relayouting = true;
                            this._updateViewportProperty();
                        }
                    });
                    //  - plotly_restyle
                    this._layout_wrapper.on('plotly_restyle', (eventData) => {
                        this.model.restyle_data = filterEventData(this._layout_wrapper, eventData, 'restyle');
                        this._updateViewportProperty();
                    });
                    //  - plotly_click
                    this._layout_wrapper.on('plotly_click', (eventData) => {
                        this.model.click_data = filterEventData(this._layout_wrapper, eventData, 'click');
                    });
                    //  - plotly_hover
                    this._layout_wrapper.on('plotly_hover', (eventData) => {
                        this.model.hover_data = filterEventData(this._layout_wrapper, eventData, 'hover');
                    });
                    //  - plotly_selected
                    this._layout_wrapper.on('plotly_selected', (eventData) => {
                        this.model.selected_data = filterEventData(this._layout_wrapper, eventData, 'selected');
                    });
                    //  - plotly_clickannotation
                    this._layout_wrapper.on('plotly_clickannotation', (eventData) => {
                        delete eventData["event"];
                        delete eventData["fullAnnotation"];
                        this.model.clickannotation_data = eventData;
                    });
                    //  - plotly_deselect
                    this._layout_wrapper.on('plotly_deselect', () => {
                        this.model.selected_data = null;
                    });
                    //  - plotly_unhover
                    this._layout_wrapper.on('plotly_unhover', () => {
                        this.model.hover_data = null;
                    });
                }
                this._plotInitialized = true;
                this._reacting = false;
                if (!_isHidden(this._layout_wrapper))
                    window.Plotly.Plots.resize(this._layout_wrapper);
            });
        }
        _get_trace(index, update) {
            const trace = object_1.clone(this.model.data[index]);
            const cds = this.model.data_sources[index];
            for (const column of cds.columns()) {
                let array = cds.get_array(column)[0];
                if (array.shape != null && array.shape.length > 1) {
                    const arrays = [];
                    const shape = array.shape;
                    for (let s = 0; s < shape[0]; s++) {
                        arrays.push(array.slice(s * shape[1], (s + 1) * shape[1]));
                    }
                    array = arrays;
                }
                let prop_path = column.split(".");
                let prop = prop_path[prop_path.length - 1];
                let prop_parent = trace;
                for (let k of prop_path.slice(0, -1)) {
                    prop_parent = prop_parent[k];
                }
                if (update && prop_path.length == 1) {
                    prop_parent[prop] = [array];
                }
                else {
                    prop_parent[prop] = array;
                }
            }
            return trace;
        }
        _updateViewportFromProperty() {
            if (!window.Plotly || this._settingViewport || this._reacting || !this.model.viewport) {
                return;
            }
            const fullLayout = this._layout_wrapper._fullLayout;
            // Call relayout if viewport differs from fullLayout
            Object.keys(this.model.viewport).reduce((value, key) => {
                if (!eq_1.isEqual(util_1.get(fullLayout, key), value)) {
                    let clonedViewport = util_1.deepCopy(this.model.viewport);
                    clonedViewport['_update_from_property'] = true;
                    window.Plotly.relayout(this.el, clonedViewport);
                    return false;
                }
                else {
                    return true;
                }
            }, {});
        }
        _updateViewportProperty() {
            const fullLayout = this._layout_wrapper._fullLayout;
            let viewport = {};
            // Get range for all xaxis and yaxis properties
            for (let prop in fullLayout) {
                if (!fullLayout.hasOwnProperty(prop)) {
                    continue;
                }
                let maybe_axis = prop.slice(0, 5);
                if (maybe_axis === 'xaxis' || maybe_axis === 'yaxis') {
                    viewport[prop + '.range'] = util_1.deepCopy(fullLayout[prop].range);
                }
            }
            if (!eq_1.isEqual(viewport, this.model.viewport)) {
                this._setViewport(viewport);
            }
        }
        _updateSetViewportFunction() {
            if (this.model.viewport_update_policy === "continuous" ||
                this.model.viewport_update_policy === "mouseup") {
                this._setViewport = (viewport) => {
                    if (!this._settingViewport) {
                        this._settingViewport = true;
                        this.model.viewport = viewport;
                        this._settingViewport = false;
                    }
                };
            }
            else {
                this._setViewport = util_1.throttle((viewport) => {
                    if (!this._settingViewport) {
                        this._settingViewport = true;
                        this.model.viewport = viewport;
                        this._settingViewport = false;
                    }
                }, this.model.viewport_update_throttle);
            }
        }
    }
    exports.PlotlyPlotView = PlotlyPlotView;
    PlotlyPlotView.__name__ = "PlotlyPlotView";
    class PlotlyPlot extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_PlotlyPlot() {
            this.prototype.default_view = PlotlyPlotView;
            this.define({
                data: [p.Array, []],
                layout: [p.Any, {}],
                config: [p.Any, {}],
                data_sources: [p.Array, []],
                relayout_data: [p.Any, {}],
                restyle_data: [p.Array, []],
                click_data: [p.Any, {}],
                hover_data: [p.Any, {}],
                clickannotation_data: [p.Any, {}],
                selected_data: [p.Any, {}],
                viewport: [p.Any, {}],
                viewport_update_policy: [p.String, "mouseup"],
                viewport_update_throttle: [p.Number, 200],
                _render_count: [p.Number, 0],
            });
        }
    }
    exports.PlotlyPlot = PlotlyPlot;
    PlotlyPlot.__name__ = "PlotlyPlot";
    PlotlyPlot.__module__ = "panel.models.plotly";
    PlotlyPlot.init_PlotlyPlot();
},
"99a25e6992": /* debounce/index.js */ function _(require, module, exports) {
    /**
     * Returns a function, that, as long as it continues to be invoked, will not
     * be triggered. The function will be called after it stops being called for
     * N milliseconds. If `immediate` is passed, trigger the function on the
     * leading edge, instead of the trailing. The function also has a property 'clear'
     * that is a function which will clear the timer to prevent previously scheduled executions.
     *
     * @source underscore.js
     * @see http://unscriptable.com/2009/03/20/debouncing-javascript-methods/
     * @param {Function} function to wrap
     * @param {Number} timeout in ms (`100`)
     * @param {Boolean} whether to execute at the beginning (`false`)
     * @api public
     */
    function debounce(func, wait, immediate) {
        var timeout, args, context, timestamp, result;
        if (null == wait)
            wait = 100;
        function later() {
            var last = Date.now() - timestamp;
            if (last < wait && last >= 0) {
                timeout = setTimeout(later, wait - last);
            }
            else {
                timeout = null;
                if (!immediate) {
                    result = func.apply(context, args);
                    context = args = null;
                }
            }
        }
        ;
        var debounced = function () {
            context = this;
            args = arguments;
            timestamp = Date.now();
            var callNow = immediate && !timeout;
            if (!timeout)
                timeout = setTimeout(later, wait);
            if (callNow) {
                result = func.apply(context, args);
                context = args = null;
            }
            return result;
        };
        debounced.clear = function () {
            if (timeout) {
                clearTimeout(timeout);
                timeout = null;
            }
        };
        debounced.flush = function () {
            if (timeout) {
                result = func.apply(context, args);
                context = args = null;
                clearTimeout(timeout);
                timeout = null;
            }
        };
        return debounced;
    }
    ;
    // Adds compatibility for ES modules
    debounce.debounce = debounce;
    module.exports = debounce;
},
"990b5dd5c7": /* models/util.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.get = (obj, path, defaultValue = undefined) => {
        const travel = (regexp) => String.prototype.split
            .call(path, regexp)
            .filter(Boolean)
            .reduce((res, key) => (res !== null && res !== undefined ? res[key] : res), obj);
        const result = travel(/[,[\]]+?/) || travel(/[,[\].]+?/);
        return result === undefined || result === obj ? defaultValue : result;
    };
    function throttle(func, timeFrame) {
        var lastTime = 0;
        return function () {
            var now = Number(new Date());
            if (now - lastTime >= timeFrame) {
                func();
                lastTime = now;
            }
        };
    }
    exports.throttle = throttle;
    function deepCopy(obj) {
        var copy;
        // Handle the 3 simple types, and null or undefined
        if (null == obj || "object" != typeof obj)
            return obj;
        // Handle Array
        if (obj instanceof Array) {
            copy = [];
            for (var i = 0, len = obj.length; i < len; i++) {
                copy[i] = deepCopy(obj[i]);
            }
            return copy;
        }
        // Handle Object
        if (obj instanceof Object) {
            const copy = {};
            for (const attr in obj) {
                const key = attr;
                if (obj.hasOwnProperty(key))
                    copy[key] = deepCopy(obj[key]);
            }
            return copy;
        }
        throw new Error("Unable to copy obj! Its type isn't supported.");
    }
    exports.deepCopy = deepCopy;
    function isPlainObject(obj) {
        return Object.prototype.toString.call(obj) === '[object Object]';
    }
    exports.isPlainObject = isPlainObject;
},
"765e9cea08": /* models/progress.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const layout_1 = require("7116a7a602") /* ./layout */;
    class ProgressView extends html_box_1.HTMLBoxView {
        connect_signals() {
            super.connect_signals();
            const resize = () => {
                this.render();
                this.root.compute_layout(); // XXX: invalidate_layout?
            };
            this.connect(this.model.properties.height.change, resize);
            this.connect(this.model.properties.width.change, resize);
            this.connect(this.model.properties.height_policy.change, resize);
            this.connect(this.model.properties.width_policy.change, resize);
            this.connect(this.model.properties.sizing_mode.change, resize);
            this.connect(this.model.properties.active.change, () => this.setCSS());
            this.connect(this.model.properties.bar_color.change, () => this.setCSS());
            this.connect(this.model.properties.css_classes.change, () => this.setCSS());
            this.connect(this.model.properties.value.change, () => this.setValue());
            this.connect(this.model.properties.max.change, () => this.setMax());
        }
        render() {
            super.render();
            const style = Object.assign(Object.assign({}, this.model.style), { display: "inline-block" });
            this.progressEl = document.createElement('progress');
            this.setValue();
            this.setMax();
            layout_1.set_size(this.progressEl, this.model);
            // Set styling
            this.setCSS();
            for (const prop in style)
                this.progressEl.style.setProperty(prop, style[prop]);
            this.el.appendChild(this.progressEl);
        }
        setCSS() {
            let css = this.model.css_classes.join(" ") + " " + this.model.bar_color;
            if (this.model.active)
                css = css + " active";
            this.progressEl.className = css;
        }
        setValue() {
            if (this.model.value != null)
                this.progressEl.value = this.model.value;
        }
        setMax() {
            if (this.model.max != null)
                this.progressEl.max = this.model.max;
        }
        _update_layout() {
            let changed = ((this._prev_sizing_mode !== undefined) &&
                (this._prev_sizing_mode !== this.model.sizing_mode));
            this._prev_sizing_mode = this.model.sizing_mode;
            this.layout = new layout_1.CachedVariadicBox(this.el, this.model.sizing_mode, changed);
            this.layout.set_sizing(this.box_sizing());
        }
    }
    exports.ProgressView = ProgressView;
    ProgressView.__name__ = "ProgressView";
    class Progress extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_Progress() {
            this.prototype.default_view = ProgressView;
            this.define({
                active: [p.Boolean, true],
                bar_color: [p.String, 'primary'],
                style: [p.Any, {}],
                max: [p.Number, 100],
                value: [p.Any, null],
            });
        }
    }
    exports.Progress = Progress;
    Progress.__name__ = "Progress";
    Progress.__module__ = "panel.models.widgets";
    Progress.init_Progress();
},
"ff9dd91f7b": /* models/singleselect.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const dom_1 = require("@bokehjs/core/dom");
    const types_1 = require("@bokehjs/core/util/types");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const input_widget_1 = require("@bokehjs/models/widgets/input_widget");
    const inputs_1 = require("@bokehjs/styles/widgets/inputs");
    class SingleSelectView extends input_widget_1.InputWidgetView {
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.value.change, () => this.render_selection());
            this.connect(this.model.properties.options.change, () => this.render());
            this.connect(this.model.properties.name.change, () => this.render());
            this.connect(this.model.properties.title.change, () => this.render());
            this.connect(this.model.properties.size.change, () => this.render());
            this.connect(this.model.properties.disabled.change, () => this.render());
        }
        render() {
            super.render();
            const options = this.model.options.map((opt) => {
                let value, _label;
                if (types_1.isString(opt))
                    value = _label = opt;
                else
                    [value, _label] = opt;
                return dom_1.option({ value }, _label);
            });
            this.select_el = dom_1.select({
                multiple: false,
                class: inputs_1.bk_input,
                name: this.model.name,
                disabled: this.model.disabled,
            }, options);
            this.select_el.style.backgroundImage = 'none';
            this.select_el.addEventListener("change", () => this.change_input());
            this.group_el.appendChild(this.select_el);
            this.render_selection();
        }
        render_selection() {
            const selected = this.model.value;
            for (const el of this.el.querySelectorAll('option'))
                if (el.value === selected)
                    el.selected = true;
            // Note that some browser implementations might not reduce
            // the number of visible options for size <= 3.
            this.select_el.size = this.model.size;
        }
        change_input() {
            const is_focused = this.el.querySelector('select:focus') != null;
            let value = null;
            for (const el of this.el.querySelectorAll('option')) {
                if (el.selected) {
                    value = el.value;
                    break;
                }
            }
            this.model.value = value;
            super.change_input();
            // Restore focus back to the <select> afterwards,
            // so that even if python on_change callback is invoked,
            // focus remains on <select> and one can seamlessly scroll
            // up/down.
            if (is_focused)
                this.select_el.focus();
        }
    }
    exports.SingleSelectView = SingleSelectView;
    SingleSelectView.__name__ = "SingleSelectView";
    class SingleSelect extends input_widget_1.InputWidget {
        constructor(attrs) {
            super(attrs);
        }
        static init_SingleSelect() {
            this.prototype.default_view = SingleSelectView;
            this.define({
                value: [p.String, ""],
                options: [p.Array, []],
                size: [p.Number, 4],
            });
        }
    }
    exports.SingleSelect = SingleSelect;
    SingleSelect.__name__ = "SingleSelect";
    SingleSelect.__module__ = "panel.models.widgets";
    SingleSelect.init_SingleSelect();
},
"38b2bc9574": /* models/state.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const view_1 = require("@bokehjs/core/view");
    const array_1 = require("@bokehjs/core/util/array");
    const model_1 = require("@bokehjs/model");
    const receiver_1 = require("@bokehjs/protocol/receiver");
    function get_json(file, callback) {
        var xobj = new XMLHttpRequest();
        xobj.overrideMimeType("application/json");
        xobj.open('GET', file, true);
        xobj.onreadystatechange = function () {
            if (xobj.readyState == 4 && xobj.status == 200) {
                callback(xobj.responseText);
            }
        };
        xobj.send(null);
    }
    class StateView extends view_1.View {
        renderTo() {
        }
    }
    exports.StateView = StateView;
    StateView.__name__ = "StateView";
    class State extends model_1.Model {
        constructor(attrs) {
            super(attrs);
            this._receiver = new receiver_1.Receiver();
            this._cache = {};
        }
        apply_state(state) {
            this._receiver.consume(state.header);
            this._receiver.consume(state.metadata);
            this._receiver.consume(state.content);
            if (this._receiver.message && this.document) {
                this.document.apply_json_patch(this._receiver.message.content);
            }
        }
        _receive_json(result, path) {
            const state = JSON.parse(result);
            this._cache[path] = state;
            let current = this.state;
            for (const i of this.values) {
                current = current[i];
            }
            if (current === path)
                this.apply_state(state);
            else if (this._cache[current])
                this.apply_state(this._cache[current]);
        }
        set_state(widget, value) {
            let values = array_1.copy(this.values);
            const index = this.widgets[widget.id];
            values[index] = value;
            let state = this.state;
            for (const i of values) {
                state = state[i];
            }
            this.values = values;
            if (this.json) {
                if (this._cache[state]) {
                    this.apply_state(this._cache[state]);
                }
                else {
                    get_json(state, (result) => this._receive_json(result, state));
                }
            }
            else {
                this.apply_state(state);
            }
        }
        static init_State() {
            this.prototype.default_view = StateView;
            this.define({
                json: [p.Boolean, false],
                state: [p.Any, {}],
                widgets: [p.Any, {}],
                values: [p.Any, []],
            });
        }
    }
    exports.State = State;
    State.__name__ = "State";
    State.__module__ = "panel.models.state";
    State.init_State();
},
"294adeb985": /* models/vega.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const types_1 = require("@bokehjs/core/util/types");
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    class VegaPlotView extends html_box_1.HTMLBoxView {
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.data.change, this._plot);
            this.connect(this.model.properties.data_sources.change, () => this._connect_sources());
            this._connected = [];
            this._connect_sources();
        }
        _connect_sources() {
            for (const ds in this.model.data_sources) {
                const cds = this.model.data_sources[ds];
                if (this._connected.indexOf(ds) < 0) {
                    this.connect(cds.properties.data.change, this._plot);
                    this._connected.push(ds);
                }
            }
        }
        _fetch_datasets() {
            const datasets = {};
            for (const ds in this.model.data_sources) {
                const cds = this.model.data_sources[ds];
                const data = [];
                const columns = cds.columns();
                for (let i = 0; i < cds.get_length(); i++) {
                    const item = {};
                    for (const column of columns) {
                        item[column] = cds.data[column][i];
                    }
                    data.push(item);
                }
                datasets[ds] = data;
            }
            return datasets;
        }
        render() {
            super.render();
            this._plot();
        }
        _plot() {
            const data = this.model.data;
            if ((data == null) || !window.vegaEmbed)
                return;
            if (this.model.data_sources && (Object.keys(this.model.data_sources).length > 0)) {
                const datasets = this._fetch_datasets();
                if ('data' in datasets) {
                    data.data['values'] = datasets['data'];
                    delete datasets['data'];
                }
                if (data.data != null) {
                    const data_objs = types_1.isArray(data.data) ? data.data : [data.data];
                    for (const d of data_objs) {
                        if (d.name in datasets) {
                            d['values'] = datasets[d.name];
                            delete datasets[d.name];
                        }
                    }
                }
                this.model.data['datasets'] = datasets;
            }
            window.vegaEmbed(this.el, this.model.data, { actions: false });
        }
    }
    exports.VegaPlotView = VegaPlotView;
    VegaPlotView.__name__ = "VegaPlotView";
    class VegaPlot extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_VegaPlot() {
            this.prototype.default_view = VegaPlotView;
            this.define({
                data: [p.Any],
                data_sources: [p.Any],
            });
        }
    }
    exports.VegaPlot = VegaPlot;
    VegaPlot.__name__ = "VegaPlot";
    VegaPlot.__module__ = "panel.models.vega";
    VegaPlot.init_VegaPlot();
},
"b0c3e9e9c2": /* models/video.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const layout_1 = require("7116a7a602") /* ./layout */;
    class VideoView extends layout_1.PanelHTMLBoxView {
        initialize() {
            super.initialize();
            this._blocked = false;
            this._setting = false;
            this._time = Date.now();
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.loop.change, () => this.set_loop());
            this.connect(this.model.properties.paused.change, () => this.set_paused());
            this.connect(this.model.properties.time.change, () => this.set_time());
            this.connect(this.model.properties.value.change, () => this.set_value());
            this.connect(this.model.properties.volume.change, () => this.set_volume());
        }
        render() {
            super.render();
            this.videoEl = document.createElement('video');
            if (!this.model.sizing_mode || this.model.sizing_mode === 'fixed') {
                if (this.model.height)
                    this.videoEl.height = this.model.height;
                if (this.model.width)
                    this.videoEl.width = this.model.width;
            }
            this.videoEl.style.objectFit = 'fill';
            this.videoEl.style.minWidth = '100%';
            this.videoEl.style.minHeight = '100%';
            this.videoEl.controls = true;
            this.videoEl.src = this.model.value;
            this.videoEl.currentTime = this.model.time;
            this.videoEl.loop = this.model.loop;
            if (this.model.volume != null)
                this.videoEl.volume = this.model.volume / 100;
            else
                this.model.volume = this.videoEl.volume * 100;
            this.videoEl.onpause = () => this.model.paused = true;
            this.videoEl.onplay = () => this.model.paused = false;
            this.videoEl.ontimeupdate = () => this.update_time(this);
            this.videoEl.onvolumechange = () => this.update_volume(this);
            this.el.appendChild(this.videoEl);
            if (!this.model.paused)
                this.videoEl.play();
        }
        update_time(view) {
            if (view._setting) {
                view._setting = false;
                return;
            }
            if ((Date.now() - view._time) < view.model.throttle)
                return;
            view._blocked = true;
            view.model.time = view.videoEl.currentTime;
            view._time = Date.now();
        }
        update_volume(view) {
            if (view._setting) {
                view._setting = false;
                return;
            }
            view._blocked = true;
            view.model.volume = view.videoEl.volume * 100;
        }
        set_loop() {
            this.videoEl.loop = this.model.loop;
        }
        set_paused() {
            if (!this.videoEl.paused && this.model.paused)
                this.videoEl.pause();
            if (this.videoEl.paused && !this.model.paused)
                this.videoEl.play();
        }
        set_volume() {
            if (this._blocked) {
                this._blocked = false;
                return;
            }
            this._setting = true;
            if (this.model.volume != null)
                this.videoEl.volume = this.model.volume / 100;
        }
        set_time() {
            if (this._blocked) {
                this._blocked = false;
                return;
            }
            this._setting = true;
            this.videoEl.currentTime = this.model.time;
        }
        set_value() {
            this.videoEl.src = this.model.value;
        }
    }
    exports.VideoView = VideoView;
    VideoView.__name__ = "VideoView";
    class Video extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_Video() {
            this.prototype.default_view = VideoView;
            this.define({
                loop: [p.Boolean, false],
                paused: [p.Boolean, true],
                time: [p.Number, 0],
                throttle: [p.Number, 250],
                value: [p.Any, ''],
                volume: [p.Number, null],
            });
        }
    }
    exports.Video = Video;
    Video.__name__ = "Video";
    Video.__module__ = "panel.models.widgets";
    Video.init_Video();
},
"3c7145a2fa": /* models/videostream.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const layout_1 = require("7116a7a602") /* ./layout */;
    class VideoStreamView extends layout_1.PanelHTMLBoxView {
        constructor() {
            super(...arguments);
            this.constraints = {
                'audio': false,
                'video': true
            };
        }
        initialize() {
            super.initialize();
            if (this.model.timeout !== null)
                this.set_timeout();
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.timeout.change, () => this.set_timeout());
            this.connect(this.model.properties.snapshot.change, () => this.snapshot());
            this.connect(this.model.properties.paused.change, () => this.pause());
        }
        pause() {
            if (this.model.paused) {
                if (this.timer != null) {
                    clearInterval(this.timer);
                    this.timer = null;
                }
                this.videoEl.pause();
            }
            this.set_timeout();
        }
        set_timeout() {
            if (this.timer) {
                clearInterval(this.timer);
                this.timer = null;
            }
            if (this.model.timeout > 0)
                this.timer = setInterval(() => this.snapshot(), this.model.timeout);
        }
        snapshot() {
            this.canvasEl.width = this.videoEl.videoWidth;
            this.canvasEl.height = this.videoEl.videoHeight;
            const context = this.canvasEl.getContext('2d');
            if (context)
                context.drawImage(this.videoEl, 0, 0, this.canvasEl.width, this.canvasEl.height);
            this.model.value = this.canvasEl.toDataURL("image/" + this.model.format, 0.95);
        }
        remove() {
            super.remove();
            if (this.timer) {
                clearInterval(this.timer);
                this.timer = null;
            }
        }
        render() {
            super.render();
            if (this.videoEl)
                return;
            this.videoEl = document.createElement('video');
            if (!this.model.sizing_mode || this.model.sizing_mode === 'fixed') {
                if (this.model.height)
                    this.videoEl.height = this.model.height;
                if (this.model.width)
                    this.videoEl.width = this.model.width;
            }
            this.videoEl.style.objectFit = 'fill';
            this.videoEl.style.minWidth = '100%';
            this.videoEl.style.minHeight = '100%';
            this.canvasEl = document.createElement('canvas');
            this.el.appendChild(this.videoEl);
            if (navigator.mediaDevices.getUserMedia) {
                navigator.mediaDevices.getUserMedia(this.constraints)
                    .then(stream => {
                    this.videoEl.srcObject = stream;
                    if (!this.model.paused) {
                        this.videoEl.play();
                    }
                })
                    .catch(console.error);
            }
        }
    }
    exports.VideoStreamView = VideoStreamView;
    VideoStreamView.__name__ = "VideoStreamView";
    class VideoStream extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        static init_VideoStream() {
            this.prototype.default_view = VideoStreamView;
            this.define({
                format: [p.String, 'png'],
                paused: [p.Boolean, false],
                snapshot: [p.Boolean, false],
                timeout: [p.Number, 0],
                value: [p.Any,]
            });
            this.override({
                height: 240,
                width: 320
            });
        }
    }
    exports.VideoStream = VideoStream;
    VideoStream.__name__ = "VideoStream";
    VideoStream.__module__ = "panel.models.widgets";
    VideoStream.init_VideoStream();
},
"c51f25e2a7": /* models/vtk/index.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    var vtkjs_1 = require("6ed30646d7") /* ./vtkjs */;
    exports.VTKJSPlot = vtkjs_1.VTKJSPlot;
    var vtkvolume_1 = require("087f1e0be6") /* ./vtkvolume */;
    exports.VTKVolumePlot = vtkvolume_1.VTKVolumePlot;
    var vtkaxes_1 = require("3ae7537200") /* ./vtkaxes */;
    exports.VTKAxes = vtkaxes_1.VTKAxes;
    var vtksynchronized_1 = require("4baab0b7ce") /* ./vtksynchronized */;
    exports.VTKSynchronizedPlot = vtksynchronized_1.VTKSynchronizedPlot;
},
"6ed30646d7": /* models/vtk/vtkjs.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const vtklayout_1 = require("021b2a3929") /* ./vtklayout */;
    const util_1 = require("6c442cdcb4") /* ./util */;
    class VTKJSPlotView extends vtklayout_1.AbstractVTKView {
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.data.change, () => {
                this.invalidate_render();
            });
        }
        render() {
            super.render();
            this._create_orientation_widget();
            this._set_axes();
        }
        invalidate_render() {
            this._vtk_renwin = null;
            super.invalidate_render();
        }
        init_vtk_renwin() {
            this._vtk_renwin = util_1.vtkns.FullScreenRenderWindow.newInstance({
                rootContainer: this.el,
                container: this._vtk_container,
            });
        }
        plot() {
            if (!this.model.data) {
                this._vtk_renwin.getRenderWindow().render();
                return;
            }
            const dataAccessHelper = util_1.vtkns.DataAccessHelper.get("zip", {
                zipContent: atob(this.model.data),
                callback: (_zip) => {
                    const sceneImporter = util_1.vtkns.HttpSceneLoader.newInstance({
                        renderer: this._vtk_renwin.getRenderer(),
                        dataAccessHelper,
                    });
                    const fn = util_1.vtk.macro.debounce(() => setTimeout(() => {
                        if (this._axes == null && this.model.axes)
                            this._set_axes();
                        this._set_camera_state();
                        this._get_camera_state();
                    }, 100), 100);
                    sceneImporter.setUrl("index.json");
                    sceneImporter.onReady(fn);
                },
            });
        }
    }
    exports.VTKJSPlotView = VTKJSPlotView;
    VTKJSPlotView.__name__ = "VTKJSPlotView";
    class VTKJSPlot extends vtklayout_1.AbstractVTKPlot {
        static init_VTKJSPlot() {
            this.prototype.default_view = VTKJSPlotView;
            this.define({
                data: [p.String],
                enable_keybindings: [p.Boolean, false],
            });
        }
    }
    exports.VTKJSPlot = VTKJSPlot;
    VTKJSPlot.__name__ = "VTKJSPlot";
    VTKJSPlot.init_VTKJSPlot();
},
"021b2a3929": /* models/vtk/vtklayout.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const dom_1 = require("@bokehjs/core/dom");
    const html_box_1 = require("@bokehjs/models/layouts/html_box");
    const object_1 = require("@bokehjs/core/util/object");
    const layout_1 = require("7116a7a602") /* ../layout */;
    const util_1 = require("6c442cdcb4") /* ./util */;
    const vtkcolorbar_1 = require("c010237f8b") /* ./vtkcolorbar */;
    const INFO_DIV_STYLE = {
        padding: "0px 2px 0px 2px",
        maxHeight: "150px",
        height: "auto",
        backgroundColor: "rgba(255, 255, 255, 0.4)",
        borderRadius: "10px",
        margin: "2px",
        boxSizing: "border-box",
        overflow: "hidden",
        overflowY: "auto",
        transition: "width 0.1s linear",
        bottom: "0px",
        position: "absolute",
    };
    class AbstractVTKView extends layout_1.PanelHTMLBoxView {
        initialize() {
            super.initialize();
            this._camera_callbacks = [];
            this._renderable = true;
            this._setting_camera = false;
        }
        _add_colorbars() {
            //construct colorbars
            const old_info_div = this.el.querySelector(".vtk_info");
            if (old_info_div)
                this.el.removeChild(old_info_div);
            if (this.model.color_mappers.length < 1)
                return;
            const info_div = document.createElement("div");
            const expand_width = "350px";
            const collapsed_width = "30px";
            info_div.classList.add('vtk_info');
            util_1.applyStyle(info_div, INFO_DIV_STYLE);
            util_1.applyStyle(info_div, { width: expand_width });
            this.el.appendChild(info_div);
            //construct colorbars
            const colorbars = [];
            this.model.color_mappers.forEach((mapper) => {
                const cb = new vtkcolorbar_1.VTKColorBar(info_div, mapper);
                colorbars.push(cb);
            });
            //content when collapsed
            const dots = document.createElement('div');
            util_1.applyStyle(dots, { textAlign: "center", fontSize: "20px" });
            dots.innerText = "...";
            info_div.addEventListener('click', () => {
                if (info_div.style.width === collapsed_width) {
                    info_div.removeChild(dots);
                    util_1.applyStyle(info_div, { height: "auto", width: expand_width });
                    colorbars.forEach((cb) => info_div.appendChild(cb.canvas));
                }
                else {
                    colorbars.forEach((cb) => info_div.removeChild(cb.canvas));
                    util_1.applyStyle(info_div, { height: collapsed_width, width: collapsed_width });
                    info_div.appendChild(dots);
                }
            });
            info_div.click();
        }
        connect_signals() {
            super.connect_signals();
            this.on_change(this.model.properties.orientation_widget, () => {
                this._orientation_widget_visibility(this.model.orientation_widget);
            });
            this.on_change(this.model.properties.camera, () => this._set_camera_state());
            this.on_change(this.model.properties.axes, () => {
                this._delete_axes();
                if (this.model.axes)
                    this._set_axes();
                this._vtk_render();
            });
            this.on_change(this.model.properties.color_mappers, () => this._add_colorbars());
        }
        render() {
            super.render();
            if (!this._vtk_renwin || !this._vtk_container) {
                this._orientationWidget = null;
                this._axes = null;
                this._vtk_container = dom_1.div();
                this.init_vtk_renwin();
                layout_1.set_size(this._vtk_container, this.model);
                this.el.appendChild(this._vtk_container);
                // update camera model state only at the end of the interaction
                // with the scene (avoid bouncing events and large amount of events)
                this._vtk_renwin.getInteractor().onEndAnimation(() => this._get_camera_state());
                this._remove_default_key_binding();
                this._bind_key_events();
                this.plot();
                this._add_colorbars();
                this.model.renderer_el = this._vtk_renwin;
            }
            else {
                layout_1.set_size(this._vtk_container, this.model);
                // warning if _vtk_renwin contain controllers or other elements
                // we must attach them to the new el
                this.el.appendChild(this._vtk_container);
            }
        }
        after_layout() {
            super.after_layout();
            if (this._renderable)
                this._vtk_renwin.resize(); // resize call render method
            this._vtk_render();
        }
        invalidate_render() {
            this._unsubscribe_camera_cb();
            super.invalidate_render();
        }
        remove() {
            this._unsubscribe_camera_cb();
            window.removeEventListener("resize", this._vtk_renwin.resize);
            this._vtk_renwin.delete();
            super.remove();
        }
        get _vtk_camera_state() {
            const vtk_camera = this._vtk_renwin.getRenderer().getActiveCamera();
            let state;
            if (vtk_camera) {
                state = object_1.clone(vtk_camera.get());
                delete state.classHierarchy;
                delete state.vtkObject;
                delete state.vtkCamera;
                delete state.viewPlaneNormal;
                delete state.flattenedDepIds;
                delete state.managedInstanceId;
                delete state.directionOfProjection;
            }
            return state;
        }
        get _axes_canvas() {
            let axes_canvas = this._vtk_container.querySelector(".axes-canvas");
            if (!axes_canvas) {
                axes_canvas = dom_1.canvas({
                    style: {
                        position: "absolute",
                        top: "0",
                        left: "0",
                        width: "100%",
                        height: "100%",
                    },
                });
                axes_canvas.classList.add("axes-canvas");
                this._vtk_container.appendChild(axes_canvas);
                this._vtk_renwin.setResizeCallback(() => {
                    if (this._axes_canvas) {
                        const dims = this._vtk_container.getBoundingClientRect();
                        const width = Math.floor(dims.width * window.devicePixelRatio);
                        const height = Math.floor(dims.height * window.devicePixelRatio);
                        this._axes_canvas.setAttribute("width", width.toFixed());
                        this._axes_canvas.setAttribute("height", height.toFixed());
                    }
                });
            }
            return axes_canvas;
        }
        _bind_key_events() {
            this.el.addEventListener("mouseenter", () => {
                const interactor = this._vtk_renwin.getInteractor();
                if (this.model.enable_keybindings) {
                    document
                        .querySelector("body")
                        .addEventListener("keypress", interactor.handleKeyPress);
                    document
                        .querySelector("body")
                        .addEventListener("keydown", interactor.handleKeyDown);
                    document
                        .querySelector("body")
                        .addEventListener("keyup", interactor.handleKeyUp);
                }
            });
            this.el.addEventListener("mouseleave", () => {
                const interactor = this._vtk_renwin.getInteractor();
                document
                    .querySelector("body")
                    .removeEventListener("keypress", interactor.handleKeyPress);
                document
                    .querySelector("body")
                    .removeEventListener("keydown", interactor.handleKeyDown);
                document
                    .querySelector("body")
                    .removeEventListener("keyup", interactor.handleKeyUp);
            });
        }
        _create_orientation_widget() {
            const axes = util_1.vtkns.AxesActor.newInstance();
            // add orientation widget
            this._orientationWidget = util_1.vtkns.OrientationMarkerWidget.newInstance({
                actor: axes,
                interactor: this._vtk_renwin.getInteractor(),
            });
            this._orientationWidget.setEnabled(true);
            this._orientationWidget.setViewportCorner(util_1.vtkns.OrientationMarkerWidget.Corners.BOTTOM_RIGHT);
            this._orientationWidget.setViewportSize(0.15);
            this._orientationWidget.setMinPixelSize(75);
            this._orientationWidget.setMaxPixelSize(300);
            if (this.model.interactive_orientation_widget)
                this._make_orientation_widget_interactive();
            this._orientation_widget_visibility(this.model.orientation_widget);
        }
        _make_orientation_widget_interactive() {
            this._widgetManager = util_1.vtkns.WidgetManager.newInstance();
            this._widgetManager.setRenderer(this._orientationWidget.getRenderer());
            const axes = this._orientationWidget.getActor();
            const widget = util_1.vtkns.InteractiveOrientationWidget.newInstance();
            widget.placeWidget(axes.getBounds());
            widget.setBounds(axes.getBounds());
            widget.setPlaceFactor(1);
            const vw = this._widgetManager.addWidget(widget);
            // Manage user interaction
            vw.onOrientationChange(({ direction }) => {
                const camera = this._vtk_renwin.getRenderer().getActiveCamera();
                const focalPoint = camera.getFocalPoint();
                const position = camera.getPosition();
                const viewUp = camera.getViewUp();
                const distance = Math.sqrt(Math.pow(position[0] - focalPoint[0], 2) +
                    Math.pow(position[1] - focalPoint[1], 2) +
                    Math.pow(position[2] - focalPoint[2], 2));
                camera.setPosition(focalPoint[0] + direction[0] * distance, focalPoint[1] + direction[1] * distance, focalPoint[2] + direction[2] * distance);
                if (direction[0])
                    camera.setViewUp(util_1.majorAxis(viewUp, 1, 2));
                if (direction[1])
                    camera.setViewUp(util_1.majorAxis(viewUp, 0, 2));
                if (direction[2])
                    camera.setViewUp(util_1.majorAxis(viewUp, 0, 1));
                this._vtk_renwin.getRenderer().resetCameraClippingRange();
                this._vtk_render();
                this._get_camera_state();
            });
        }
        _delete_axes() {
            if (this._axes) {
                Object.keys(this._axes).forEach((key) => this._vtk_renwin.getRenderer().removeActor(this._axes[key]));
                this._axes = null;
                const textCtx = this._axes_canvas.getContext("2d");
                if (textCtx)
                    textCtx.clearRect(0, 0, this._axes_canvas.clientWidth * window.devicePixelRatio, this._axes_canvas.clientHeight * window.devicePixelRatio);
            }
        }
        _get_camera_state() {
            if (!this._setting_camera) {
                this._setting_camera = true;
                this.model.camera = this._vtk_camera_state;
                this._setting_camera = false;
            }
        }
        _orientation_widget_visibility(visibility) {
            this._orientationWidget.setEnabled(visibility);
            if (this._widgetManager != null) {
                if (visibility)
                    this._widgetManager.enablePicking();
                else
                    this._widgetManager.disablePicking();
            }
            this._vtk_render();
        }
        _remove_default_key_binding() {
            const interactor = this._vtk_renwin.getInteractor();
            document
                .querySelector("body")
                .removeEventListener("keypress", interactor.handleKeyPress);
            document
                .querySelector("body")
                .removeEventListener("keydown", interactor.handleKeyDown);
            document
                .querySelector("body")
                .removeEventListener("keyup", interactor.handleKeyUp);
        }
        _set_axes() {
            if (this.model.axes && this._vtk_renwin.getRenderer()) {
                const { psActor, axesActor, gridActor } = this.model.axes.create_axes(this._axes_canvas);
                this._axes = { psActor, axesActor, gridActor };
                this._vtk_renwin.getRenderer().addActor(psActor);
                this._vtk_renwin.getRenderer().addActor(axesActor);
                this._vtk_renwin.getRenderer().addActor(gridActor);
            }
        }
        _set_camera_state() {
            if (!this._setting_camera && this._vtk_renwin.getRenderer() !== undefined) {
                this._setting_camera = true;
                if (this.model.camera &&
                    JSON.stringify(this.model.camera) != JSON.stringify(this._vtk_camera_state))
                    this._vtk_renwin
                        .getRenderer()
                        .getActiveCamera()
                        .set(this.model.camera);
                this._vtk_renwin.getRenderer().resetCameraClippingRange();
                this._vtk_render();
                this._setting_camera = false;
            }
        }
        _unsubscribe_camera_cb() {
            this._camera_callbacks
                .splice(0, this._camera_callbacks.length)
                .map((cb) => cb.unsubscribe());
        }
        _vtk_render() {
            if (this._renderable) {
                if (this._orientationWidget)
                    this._orientationWidget.updateMarkerOrientation();
                this._vtk_renwin.getRenderWindow().render();
            }
        }
    }
    exports.AbstractVTKView = AbstractVTKView;
    AbstractVTKView.__name__ = "AbstractVTKView";
    class AbstractVTKPlot extends html_box_1.HTMLBox {
        constructor(attrs) {
            super(attrs);
        }
        getActors() {
            return this.renderer_el.getRenderer().getActors();
        }
        static init_AbstractVTKPlot() {
            this.define({
                axes: [p.Instance],
                camera: [p.Instance],
                color_mappers: [p.Array, []],
                orientation_widget: [p.Boolean, false],
                interactive_orientation_widget: [p.Boolean, false],
            });
            this.override({
                height: 300,
                width: 300,
            });
        }
    }
    exports.AbstractVTKPlot = AbstractVTKPlot;
    AbstractVTKPlot.__name__ = "AbstractVTKPlot";
    AbstractVTKPlot.__module__ = "panel.models.vtk";
    AbstractVTKPlot.init_AbstractVTKPlot();
},
"6c442cdcb4": /* models/vtk/util.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const array_1 = require("@bokehjs/core/util/array");
    exports.ARRAY_TYPES = {
        uint8: Uint8Array,
        int8: Int8Array,
        uint16: Uint16Array,
        int16: Int16Array,
        uint32: Uint32Array,
        int32: Int32Array,
        float32: Float32Array,
        float64: Float64Array,
    };
    exports.vtk = window.vtk;
    exports.vtkns = {};
    if (exports.vtk) {
        exports.vtkns["Actor"] = exports.vtk.Rendering.Core.vtkActor;
        exports.vtkns["AxesActor"] = exports.vtk.Rendering.Core.vtkAxesActor;
        exports.vtkns["Base64"] = exports.vtk.Common.Core.vtkBase64;
        exports.vtkns["BoundingBox"] = exports.vtk.Common.DataModel.vtkBoundingBox;
        exports.vtkns["Camera"] = exports.vtk.Rendering.Core.vtkCamera;
        exports.vtkns["ColorTransferFunction"] = exports.vtk.Rendering.Core.vtkColorTransferFunction;
        exports.vtkns["CubeSource"] = exports.vtk.Filters.Sources.vtkCubeSource;
        exports.vtkns["DataAccessHelper"] = exports.vtk.IO.Core.DataAccessHelper;
        exports.vtkns["DataArray"] = exports.vtk.Common.Core.vtkDataArray;
        exports.vtkns["Follower"] = exports.vtk.Rendering.Core.vtkFollower;
        exports.vtkns["FullScreenRenderWindow"] = exports.vtk.Rendering.Misc.vtkFullScreenRenderWindow;
        exports.vtkns["Glyph3DMapper"] = exports.vtk.Rendering.Core.vtkGlyph3DMapper;
        exports.vtkns["HttpSceneLoader"] = exports.vtk.IO.Core.vtkHttpSceneLoader;
        exports.vtkns["ImageData"] = exports.vtk.Common.DataModel.vtkImageData;
        exports.vtkns["ImageMapper"] = exports.vtk.Rendering.Core.vtkImageMapper;
        exports.vtkns["ImageProperty"] = exports.vtk.Rendering.Core.vtkImageProperty;
        exports.vtkns["ImageSlice"] = exports.vtk.Rendering.Core.vtkImageSlice;
        exports.vtkns["InteractiveOrientationWidget"] =
            exports.vtk.Widgets.Widgets3D.vtkInteractiveOrientationWidget;
        exports.vtkns["InteractorStyleTrackballCamera"] =
            exports.vtk.Interaction.Style.vtkInteractorStyleTrackballCamera;
        exports.vtkns["Light"] = exports.vtk.Rendering.Core.vtkLight;
        exports.vtkns["LineSource"] = exports.vtk.Filters.Sources.vtkLineSource;
        exports.vtkns["LookupTable"] = exports.vtk.Common.Core.vtkLookupTable;
        exports.vtkns["macro"] = exports.vtk.macro;
        exports.vtkns["Mapper"] = exports.vtk.Rendering.Core.vtkMapper;
        exports.vtkns["OpenGLRenderWindow"] = exports.vtk.Rendering.OpenGL.vtkRenderWindow;
        exports.vtkns["OrientationMarkerWidget"] =
            exports.vtk.Interaction.Widgets.vtkOrientationMarkerWidget;
        exports.vtkns["OutlineFilter"] = exports.vtk.Filters.General.vtkOutlineFilter;
        exports.vtkns["PiecewiseFunction"] = exports.vtk.Common.DataModel.vtkPiecewiseFunction;
        exports.vtkns["PixelSpaceCallbackMapper"] =
            exports.vtk.Rendering.Core.vtkPixelSpaceCallbackMapper;
        exports.vtkns["PlaneSource"] = exports.vtk.Filters.Sources.vtkPlaneSource;
        exports.vtkns["PointSource"] = exports.vtk.Filters.Sources.vtkPointSource;
        exports.vtkns["PolyData"] = exports.vtk.Common.DataModel.vtkPolyData;
        exports.vtkns["Property"] = exports.vtk.Rendering.Core.vtkProperty;
        exports.vtkns["Renderer"] = exports.vtk.Rendering.Core.vtkRenderer;
        exports.vtkns["RenderWindow"] = exports.vtk.Rendering.Core.vtkRenderWindow;
        exports.vtkns["RenderWindowInteractor"] = exports.vtk.Rendering.Core.vtkRenderWindowInteractor;
        exports.vtkns["SphereMapper"] = exports.vtk.Rendering.Core.vtkSphereMapper;
        exports.vtkns["SynchronizableRenderWindow"] =
            exports.vtk.Rendering.Misc.vtkSynchronizableRenderWindow;
        exports.vtkns["ThirdParty"] = exports.vtk.ThirdParty;
        exports.vtkns["Texture"] = exports.vtk.Rendering.Core.vtkTexture;
        exports.vtkns["Volume"] = exports.vtk.Rendering.Core.vtkVolume;
        exports.vtkns["VolumeController"] = exports.vtk.Interaction.UI.vtkVolumeController;
        exports.vtkns["VolumeMapper"] = exports.vtk.Rendering.Core.vtkVolumeMapper;
        exports.vtkns["VolumeProperty"] = exports.vtk.Rendering.Core.vtkVolumeProperty;
        exports.vtkns["WidgetManager"] = exports.vtk.Widgets.Core.vtkWidgetManager;
        const { vtkObjectManager } = exports.vtkns.SynchronizableRenderWindow;
        vtkObjectManager.setTypeMapping("vtkVolumeMapper", exports.vtkns.VolumeMapper.newInstance, vtkObjectManager.oneTimeGenericUpdater);
        vtkObjectManager.setTypeMapping("vtkSmartVolumeMapper", exports.vtkns.VolumeMapper.newInstance, vtkObjectManager.oneTimeGenericUpdater);
        vtkObjectManager.setTypeMapping("vtkFollower", exports.vtkns.Follower.newInstance, vtkObjectManager.genericUpdater);
    }
    function applyStyle(el, style) {
        Object.keys(style).forEach((key) => {
            el.style[key] = style[key];
        });
    }
    exports.applyStyle = applyStyle;
    function hexToRGB(color) {
        return [
            parseInt(color.slice(1, 3), 16) / 255,
            parseInt(color.slice(3, 5), 16) / 255,
            parseInt(color.slice(5, 7), 16) / 255,
        ];
    }
    exports.hexToRGB = hexToRGB;
    function valToHex(val) {
        const hex = Math.min(Math.max(Math.round(val), 0), 255).toString(16);
        return hex.length == 2 ? hex : "0" + hex;
    }
    function rgbToHex(r, g, b) {
        return "#" + valToHex(r) + valToHex(g) + valToHex(b);
    }
    exports.rgbToHex = rgbToHex;
    function vtkLutToMapper(vtk_lut) {
        //For the moment only linear colormapper are handle
        const { scale, nodes } = vtk_lut.get("scale", "nodes");
        if (scale !== exports.vtkns.ColorTransferFunction.Scale.LINEAR)
            throw "Error transfer function scale not handle";
        const x = nodes.map((a) => a.x);
        const low = Math.min(...x);
        const high = Math.max(...x);
        const vals = array_1.linspace(low, high, 255);
        const rgb = [0, 0, 0];
        const palette = vals.map((val) => {
            vtk_lut.getColor(val, rgb);
            return rgbToHex(rgb[0] * 255, rgb[1] * 255, rgb[2] * 255);
        });
        return { low, high, palette };
    }
    exports.vtkLutToMapper = vtkLutToMapper;
    function utf8ToAB(utf8_str) {
        var buf = new ArrayBuffer(utf8_str.length); // 2 bytes for each char
        var bufView = new Uint8Array(buf);
        for (var i = 0, strLen = utf8_str.length; i < strLen; i++) {
            bufView[i] = utf8_str.charCodeAt(i);
        }
        return buf;
    }
    function data2VTKImageData(data) {
        const source = exports.vtkns.ImageData.newInstance({
            spacing: data.spacing,
        });
        source.setDimensions(data.dims);
        source.setOrigin(data.origin != null ? data.origin : data.dims.map((v) => v / 2));
        const dataArray = exports.vtkns.DataArray.newInstance({
            name: "scalars",
            numberOfComponents: 1,
            values: new exports.ARRAY_TYPES[data.dtype](utf8ToAB(atob(data.buffer))),
        });
        source.getPointData().setScalars(dataArray);
        return source;
    }
    exports.data2VTKImageData = data2VTKImageData;
    function majorAxis(vec3, idxA, idxB) {
        const axis = [0, 0, 0];
        const idx = Math.abs(vec3[idxA]) > Math.abs(vec3[idxB]) ? idxA : idxB;
        const value = vec3[idx] > 0 ? 1 : -1;
        axis[idx] = value;
        return axis;
    }
    exports.majorAxis = majorAxis;
    function cartesian_product(...arrays) {
        return arrays.reduce((acc, curr) => acc.flatMap((c) => curr.map((n) => [].concat(c, n))));
    }
    exports.cartesian_product = cartesian_product;
},
"c010237f8b": /* models/vtk/vtkcolorbar.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const mappers_1 = require("@bokehjs/models/mappers");
    const array_1 = require("@bokehjs/core/util/array");
    class VTKColorBar {
        constructor(parent, mapper, options = {}) {
            this.parent = parent;
            this.mapper = mapper;
            this.options = options;
            if (!options.ticksNum)
                options.ticksNum = 5;
            if (!options.fontFamily)
                options.fontFamily = "Arial";
            if (!options.fontSize)
                options.fontSize = "12px";
            if (!options.ticksSize)
                options.ticksSize = 2;
            this.canvas = document.createElement("canvas");
            this.canvas.style.width = "100%";
            this.parent.appendChild(this.canvas);
            this.ctx = this.canvas.getContext("2d");
            this.ctx.font = `${this.options.fontSize} ${this.options.fontFamily}`;
            this.ctx.lineWidth = options.ticksSize;
            if (!options.height)
                options.height = `${(this.font_height + 1) * 4}px`; //title/ticks/colorbar
            this.canvas.style.height = options.height;
            this.draw_colorbar();
        }
        get values() {
            const { min, max } = this.mapper.metrics;
            return array_1.linspace(min, max, this.options.ticksNum);
        }
        get ticks() {
            return this.values.map((v) => v.toExponential(3));
        }
        get title() {
            return this.mapper.name ? this.mapper.name : "scalars";
        }
        get font_height() {
            let font_height = 0;
            this.values.forEach((val) => {
                const { actualBoundingBoxAscent, actualBoundingBoxDescent, } = this.ctx.measureText(`${val}`);
                const height = actualBoundingBoxAscent + actualBoundingBoxDescent;
                if (font_height < height)
                    font_height = height;
            });
            return font_height;
        }
        draw_colorbar() {
            this.canvas.width = this.canvas.clientWidth;
            this.canvas.height = this.canvas.clientHeight;
            const { palette } = this.mapper;
            this.ctx.font = `${this.options.fontSize} ${this.options.fontFamily}`;
            const font_height = this.font_height;
            this.ctx.save();
            //colorbar
            const image = document.createElement("canvas");
            const h = 1;
            const w = palette.length;
            image.width = w;
            image.height = h;
            const image_ctx = image.getContext("2d");
            const image_data = image_ctx.getImageData(0, 0, w, h);
            const cmap = new mappers_1.LinearColorMapper({ palette }).rgba_mapper;
            const buf8 = cmap.v_compute(array_1.range(0, palette.length));
            image_data.data.set(buf8);
            image_ctx.putImageData(image_data, 0, 0);
            this.ctx.drawImage(image, 0, 2 * (this.font_height + 1) + 1, this.canvas.width, this.canvas.height);
            this.ctx.restore();
            this.ctx.save();
            //title
            this.ctx.textAlign = 'center';
            this.ctx.fillText(this.title, this.canvas.width / 2, font_height + 1);
            this.ctx.restore();
            this.ctx.save();
            //ticks
            const tick_x_positions = array_1.linspace(0, this.canvas.width, 5);
            tick_x_positions.forEach((xpos, idx) => {
                let xpos_tick = xpos;
                if (idx == 0) {
                    xpos_tick = xpos + Math.ceil(this.ctx.lineWidth / 2);
                    this.ctx.textAlign = "left";
                }
                else if (idx == tick_x_positions.length - 1) {
                    xpos_tick = xpos - Math.ceil(this.ctx.lineWidth / 2);
                    this.ctx.textAlign = "right";
                }
                else {
                    this.ctx.textAlign = "center";
                }
                this.ctx.moveTo(xpos_tick, 2 * (font_height + 1));
                this.ctx.lineTo(xpos_tick, 2 * (font_height + 1) + 5);
                this.ctx.stroke();
                this.ctx.fillText(`${this.ticks[idx]}`, xpos, 2 * (font_height + 1));
            });
            this.ctx.restore();
        }
    }
    exports.VTKColorBar = VTKColorBar;
    VTKColorBar.__name__ = "VTKColorBar";
},
"087f1e0be6": /* models/vtk/vtkvolume.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const vtklayout_1 = require("021b2a3929") /* ./vtklayout */;
    const util_1 = require("6c442cdcb4") /* ./util */;
    class VTKVolumePlotView extends vtklayout_1.AbstractVTKView {
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.data.change, () => {
                this._vtk_image_data = util_1.data2VTKImageData(this.model.data);
                this.invalidate_render();
            });
            this.connect(this.model.properties.colormap.change, () => {
                this.colormap_selector.value = this.model.colormap;
                const event = new Event("change");
                this.colormap_selector.dispatchEvent(event);
            });
            this.connect(this.model.properties.shadow.change, () => {
                this.shadow_selector.value = this.model.shadow ? "1" : "0";
                const event = new Event("change");
                this.shadow_selector.dispatchEvent(event);
            });
            this.connect(this.model.properties.sampling.change, () => {
                this.sampling_slider.value = this.model.sampling.toFixed(2);
                const event = new Event("input");
                this.sampling_slider.dispatchEvent(event);
            });
            this.connect(this.model.properties.edge_gradient.change, () => {
                this.edge_gradient_slider.value = this.model.edge_gradient.toFixed(2);
                const event = new Event("input");
                this.edge_gradient_slider.dispatchEvent(event);
            });
            this.connect(this.model.properties.rescale.change, () => {
                this._controllerWidget.setRescaleColorMap(this.model.rescale);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.ambient.change, () => {
                this.volume.getProperty().setAmbient(this.model.ambient);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.diffuse.change, () => {
                this.volume.getProperty().setDiffuse(this.model.diffuse);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.specular.change, () => {
                this.volume.getProperty().setSpecular(this.model.specular);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.specular_power.change, () => {
                this.volume.getProperty().setSpecularPower(this.model.specular_power);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.display_volume.change, () => {
                this._set_volume_visibility(this.model.display_volume);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.display_slices.change, () => {
                this._set_slices_visibility(this.model.display_slices);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.slice_i.change, () => {
                if (this.image_actor_i !== undefined) {
                    this.image_actor_i.getMapper().setISlice(this.model.slice_i);
                    this._vtk_renwin.getRenderWindow().render();
                }
            });
            this.connect(this.model.properties.slice_j.change, () => {
                if (this.image_actor_j !== undefined) {
                    this.image_actor_j.getMapper().setJSlice(this.model.slice_j);
                    this._vtk_renwin.getRenderWindow().render();
                }
            });
            this.connect(this.model.properties.slice_k.change, () => {
                if (this.image_actor_k !== undefined) {
                    this.image_actor_k.getMapper().setKSlice(this.model.slice_k);
                    this._vtk_renwin.getRenderWindow().render();
                }
            });
            this.connect(this.model.properties.render_background.change, () => {
                this._vtk_renwin
                    .getRenderer()
                    .setBackground(...util_1.hexToRGB(this.model.render_background));
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.interpolation.change, () => {
                this._set_interpolation(this.model.interpolation);
                this._vtk_renwin.getRenderWindow().render();
            });
            this.connect(this.model.properties.controller_expanded.change, () => {
                if (this._controllerWidget != null)
                    this._controllerWidget.setExpanded(this.model.controller_expanded);
            });
        }
        render() {
            this._vtk_renwin = null;
            this._orientationWidget = null;
            this._axes = null;
            super.render();
            this._create_orientation_widget();
            this._set_axes();
            if (!this.model.camera)
                this._vtk_renwin.getRenderer().resetCamera();
            else
                this._set_camera_state();
            this._get_camera_state();
        }
        invalidate_render() {
            this._vtk_renwin = null;
            super.invalidate_render();
        }
        init_vtk_renwin() {
            this._vtk_renwin = util_1.vtkns.FullScreenRenderWindow.newInstance({
                rootContainer: this.el,
                container: this._vtk_container,
            });
        }
        plot() {
            this._controllerWidget = util_1.vtkns.VolumeController.newInstance({
                size: [400, 150],
                rescaleColorMap: this.model.rescale,
            });
            this._plot_volume();
            this._plot_slices();
            this._controllerWidget.setupContent(this._vtk_renwin.getRenderWindow(), this.volume, true);
            this._controllerWidget.setContainer(this.el);
            this._controllerWidget.setExpanded(this.model.controller_expanded);
            this._connect_js_controls();
            this._vtk_renwin.getRenderWindow().getInteractor();
            this._vtk_renwin.getRenderWindow().getInteractor().setDesiredUpdateRate(45);
            this._set_volume_visibility(this.model.display_volume);
            this._set_slices_visibility(this.model.display_slices);
            this._vtk_renwin
                .getRenderer()
                .setBackground(...util_1.hexToRGB(this.model.render_background));
            this._set_interpolation(this.model.interpolation);
            this._set_camera_state();
        }
        get vtk_image_data() {
            if (!this._vtk_image_data)
                this._vtk_image_data = util_1.data2VTKImageData(this.model.data);
            return this._vtk_image_data;
        }
        get volume() {
            return this._vtk_renwin.getRenderer().getVolumes()[0];
        }
        get image_actor_i() {
            return this._vtk_renwin.getRenderer().getActors()[0];
        }
        get image_actor_j() {
            return this._vtk_renwin.getRenderer().getActors()[1];
        }
        get image_actor_k() {
            return this._vtk_renwin.getRenderer().getActors()[2];
        }
        get shadow_selector() {
            return this.el.querySelector(".js-shadow");
        }
        get edge_gradient_slider() {
            return this.el.querySelector(".js-edge");
        }
        get sampling_slider() {
            return this.el.querySelector(".js-spacing");
        }
        get colormap_selector() {
            return this.el.querySelector(".js-color-preset");
        }
        _connect_js_controls() {
            const { el: controller_el } = this._controllerWidget.get('el');
            if (controller_el !== undefined) {
                const controller_button = controller_el.querySelector('.js-button');
                controller_button.addEventListener('click', () => this.model.controller_expanded = this._controllerWidget.getExpanded());
            }
            // Colormap selector
            this.colormap_selector.addEventListener("change", () => {
                this.model.colormap = this.colormap_selector.value;
            });
            if (!this.model.colormap)
                this.model.colormap = this.colormap_selector.value;
            else
                this.model.properties.colormap.change.emit();
            // Shadow selector
            this.shadow_selector.addEventListener("change", () => {
                this.model.shadow = !!Number(this.shadow_selector.value);
            });
            if ((this.model.shadow = !!Number(this.shadow_selector.value)))
                this.model.properties.shadow.change.emit();
            // Sampling slider
            this.sampling_slider.addEventListener("input", () => {
                const js_sampling_value = Number(this.sampling_slider.value);
                if (Math.abs(this.model.sampling - js_sampling_value) >= 5e-3)
                    this.model.sampling = js_sampling_value;
            });
            if (Math.abs(this.model.sampling - Number(this.shadow_selector.value)) >= 5e-3)
                this.model.properties.sampling.change.emit();
            // Edge Gradient slider
            this.edge_gradient_slider.addEventListener("input", () => {
                const js_edge_gradient_value = Number(this.edge_gradient_slider.value);
                if (Math.abs(this.model.edge_gradient - js_edge_gradient_value) >= 5e-3)
                    this.model.edge_gradient = js_edge_gradient_value;
            });
            if (Math.abs(this.model.edge_gradient - Number(this.edge_gradient_slider.value)) >= 5e-3)
                this.model.properties.edge_gradient.change.emit();
        }
        _plot_slices() {
            const source = this._vtk_image_data;
            const image_actor_i = util_1.vtkns.ImageSlice.newInstance();
            const image_actor_j = util_1.vtkns.ImageSlice.newInstance();
            const image_actor_k = util_1.vtkns.ImageSlice.newInstance();
            const image_mapper_i = util_1.vtkns.ImageMapper.newInstance();
            const image_mapper_j = util_1.vtkns.ImageMapper.newInstance();
            const image_mapper_k = util_1.vtkns.ImageMapper.newInstance();
            image_mapper_i.setInputData(source);
            image_mapper_i.setISlice(this.model.slice_i);
            image_actor_i.setMapper(image_mapper_i);
            image_mapper_j.setInputData(source);
            image_mapper_j.setJSlice(this.model.slice_j);
            image_actor_j.setMapper(image_mapper_j);
            image_mapper_k.setInputData(source);
            image_mapper_k.setKSlice(this.model.slice_k);
            image_actor_k.setMapper(image_mapper_k);
            // set_color and opacity
            const piecewiseFunction = util_1.vtkns.PiecewiseFunction.newInstance();
            piecewiseFunction.removeAllPoints();
            piecewiseFunction.addPoint(0, 1);
            const lookupTable = this.volume.getProperty().getRGBTransferFunction(0);
            const property = image_actor_i.getProperty();
            image_actor_j.setProperty(property);
            image_actor_k.setProperty(property);
            property.setRGBTransferFunction(lookupTable);
            property.setScalarOpacity(piecewiseFunction);
            const renderer = this._vtk_renwin.getRenderer();
            renderer.addActor(image_actor_i);
            renderer.addActor(image_actor_j);
            renderer.addActor(image_actor_k);
        }
        _plot_volume() {
            //Create vtk volume and add it to the scene
            const source = this.vtk_image_data;
            const actor = util_1.vtkns.Volume.newInstance();
            const mapper = util_1.vtkns.VolumeMapper.newInstance();
            actor.setMapper(mapper);
            mapper.setInputData(source);
            const dataArray = source.getPointData().getScalars() || source.getPointData().getArrays()[0];
            const dataRange = dataArray.getRange();
            const lookupTable = util_1.vtkns.ColorTransferFunction.newInstance();
            lookupTable.onModified(() => (this.model.mapper = util_1.vtkLutToMapper(lookupTable)));
            const piecewiseFunction = util_1.vtkns.PiecewiseFunction.newInstance();
            const sampleDistance = 0.7 *
                Math.sqrt(source
                    .getSpacing()
                    .map((v) => v * v)
                    .reduce((a, b) => a + b, 0));
            mapper.setSampleDistance(sampleDistance);
            actor.getProperty().setRGBTransferFunction(0, lookupTable);
            actor.getProperty().setScalarOpacity(0, piecewiseFunction);
            actor.getProperty().setInterpolationTypeToFastLinear();
            // actor.getProperty().setInterpolationTypeToLinear();
            // For better looking volume rendering
            // - distance in world coordinates a scalar opacity of 1.0
            actor
                .getProperty()
                .setScalarOpacityUnitDistance(0, util_1.vtkns.BoundingBox.getDiagonalLength(source.getBounds()) /
                Math.max(...source.getDimensions()));
            // - control how we emphasize surface boundaries
            //  => max should be around the average gradient magnitude for the
            //     volume or maybe average plus one std dev of the gradient magnitude
            //     (adjusted for spacing, this is a world coordinate gradient, not a
            //     pixel gradient)
            //  => max hack: (dataRange[1] - dataRange[0]) * 0.05
            actor.getProperty().setGradientOpacityMinimumValue(0, 0);
            actor
                .getProperty()
                .setGradientOpacityMaximumValue(0, (dataRange[1] - dataRange[0]) * 0.05);
            // - Use shading based on gradient
            actor.getProperty().setShade(this.model.shadow);
            actor.getProperty().setUseGradientOpacity(0, true);
            // - generic good default
            actor.getProperty().setGradientOpacityMinimumOpacity(0, 0.0);
            actor.getProperty().setGradientOpacityMaximumOpacity(0, 1.0);
            actor.getProperty().setAmbient(this.model.ambient);
            actor.getProperty().setDiffuse(this.model.diffuse);
            actor.getProperty().setSpecular(this.model.specular);
            actor.getProperty().setSpecularPower(this.model.specular_power);
            this._vtk_renwin.getRenderer().addVolume(actor);
        }
        _set_interpolation(interpolation) {
            if (interpolation == "fast_linear") {
                this.volume.getProperty().setInterpolationTypeToFastLinear();
                this.image_actor_i.getProperty().setInterpolationTypeToLinear();
            }
            else if (interpolation == "linear") {
                this.volume.getProperty().setInterpolationTypeToLinear();
                this.image_actor_i.getProperty().setInterpolationTypeToLinear();
            }
            else {
                //nearest
                this.volume.getProperty().setInterpolationTypeToNearest();
                this.image_actor_i.getProperty().setInterpolationTypeToNearest();
            }
        }
        _set_slices_visibility(visibility) {
            this._vtk_renwin
                .getRenderer()
                .getActors()
                .map((actor) => actor.setVisibility(visibility));
        }
        _set_volume_visibility(visibility) {
            this.volume.setVisibility(visibility);
        }
    }
    exports.VTKVolumePlotView = VTKVolumePlotView;
    VTKVolumePlotView.__name__ = "VTKVolumePlotView";
    class VTKVolumePlot extends vtklayout_1.AbstractVTKPlot {
        constructor(attrs) {
            super(attrs);
        }
        static init_VTKVolumePlot() {
            this.prototype.default_view = VTKVolumePlotView;
            this.define({
                ambient: [p.Number, 0.2],
                colormap: [p.String],
                data: [p.Instance],
                diffuse: [p.Number, 0.7],
                display_slices: [p.Boolean, false],
                display_volume: [p.Boolean, true],
                edge_gradient: [p.Number, 0.2],
                interpolation: [p.Any, 'fast_linear'],
                mapper: [p.Instance],
                render_background: [p.String, '#52576e'],
                rescale: [p.Boolean, false],
                sampling: [p.Number, 0.4],
                shadow: [p.Boolean, true],
                slice_i: [p.Int, 0],
                slice_j: [p.Int, 0],
                slice_k: [p.Int, 0],
                specular: [p.Number, 0.3],
                specular_power: [p.Number, 8.0],
                controller_expanded: [p.Boolean, true],
            });
        }
    }
    exports.VTKVolumePlot = VTKVolumePlot;
    VTKVolumePlot.__name__ = "VTKVolumePlot";
    VTKVolumePlot.init_VTKVolumePlot();
},
"3ae7537200": /* models/vtk/vtkaxes.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const model_1 = require("@bokehjs/model");
    const gl_matrix_1 = require("2f3fd5db07") /* gl-matrix */;
    const util_1 = require("6c442cdcb4") /* ./util */;
    class VTKAxes extends model_1.Model {
        constructor(attrs) {
            super(attrs);
        }
        static init_VTKAxes() {
            this.define({
                origin: [p.Array],
                xticker: [p.Instance],
                yticker: [p.Instance],
                zticker: [p.Instance],
                digits: [p.Number, 1],
                show_grid: [p.Boolean, true],
                grid_opacity: [p.Number, 0.1],
                axes_opacity: [p.Number, 1],
                fontsize: [p.Number, 12],
            });
        }
        get xticks() {
            return this.xticker.ticks;
        }
        get yticks() {
            return this.yticker.ticks;
        }
        get zticks() {
            return this.zticker.ticks;
        }
        get xlabels() {
            return this.xticker.labels
                ? this.xticker.labels
                : this.xticks.map((elem) => elem.toFixed(this.digits));
        }
        get ylabels() {
            return this.yticker.labels
                ? this.yticker.labels
                : this.yticks.map((elem) => elem.toFixed(this.digits));
        }
        get zlabels() {
            return this.zticker.labels
                ? this.zticker.labels
                : this.zticks.map((elem) => elem.toFixed(this.digits));
        }
        _make_grid_lines(n, m, offset) {
            const out = [];
            for (let i = 0; i < n - 1; i++) {
                for (let j = 0; j < m - 1; j++) {
                    const v0 = i * m + j + offset;
                    const v1 = i * m + j + 1 + offset;
                    const v2 = (i + 1) * m + j + 1 + offset;
                    const v3 = (i + 1) * m + j + offset;
                    const line = [5, v0, v1, v2, v3, v0];
                    out.push(line);
                }
            }
            return out;
        }
        _create_grid_axes() {
            const pts = [];
            pts.push(util_1.cartesian_product(this.xticks, this.yticks, [this.origin[2]])); //xy
            pts.push(util_1.cartesian_product([this.origin[0]], this.yticks, this.zticks)); //yz
            pts.push(util_1.cartesian_product(this.xticks, [this.origin[1]], this.zticks)); //xz
            const polys = [];
            let offset = 0;
            polys.push(this._make_grid_lines(this.xticks.length, this.yticks.length, offset)); //xy
            offset += this.xticks.length * this.yticks.length;
            polys.push(this._make_grid_lines(this.yticks.length, this.zticks.length, offset)); //yz
            offset += this.yticks.length * this.zticks.length;
            polys.push(this._make_grid_lines(this.xticks.length, this.zticks.length, offset)); //xz
            const gridPolyData = util_1.vtk({
                vtkClass: "vtkPolyData",
                points: {
                    vtkClass: "vtkPoints",
                    dataType: "Float32Array",
                    numberOfComponents: 3,
                    values: pts.flat(2),
                },
                lines: {
                    vtkClass: "vtkCellArray",
                    dataType: "Uint32Array",
                    values: polys.flat(2),
                },
            });
            const gridMapper = util_1.vtkns.Mapper.newInstance();
            const gridActor = util_1.vtkns.Actor.newInstance();
            gridMapper.setInputData(gridPolyData);
            gridActor.setMapper(gridMapper);
            gridActor.getProperty().setOpacity(this.grid_opacity);
            gridActor.setVisibility(this.show_grid);
            return gridActor;
        }
        create_axes(canvas) {
            const points = [this.xticks, this.yticks, this.zticks].map((arr, axis) => {
                let coords = null;
                switch (axis) {
                    case 0:
                        coords = util_1.cartesian_product(arr, [this.origin[1]], [this.origin[2]]);
                        break;
                    case 1:
                        coords = util_1.cartesian_product([this.origin[0]], arr, [this.origin[2]]);
                        break;
                    case 2:
                        coords = util_1.cartesian_product([this.origin[0]], [this.origin[1]], arr);
                        break;
                }
                return coords;
            }).flat(2);
            const axesPolyData = util_1.vtk({
                vtkClass: "vtkPolyData",
                points: {
                    vtkClass: "vtkPoints",
                    dataType: "Float32Array",
                    numberOfComponents: 3,
                    values: points,
                },
                lines: {
                    vtkClass: "vtkCellArray",
                    dataType: "Uint32Array",
                    values: [
                        2,
                        0,
                        this.xticks.length - 1,
                        2,
                        this.xticks.length,
                        this.xticks.length + this.yticks.length - 1,
                        2,
                        this.xticks.length + this.yticks.length,
                        this.xticks.length + this.yticks.length + this.zticks.length - 1,
                    ],
                },
            });
            const psMapper = util_1.vtkns.PixelSpaceCallbackMapper.newInstance();
            psMapper.setInputData(axesPolyData);
            psMapper.setUseZValues(true);
            psMapper.setCallback((coordsList, camera, aspect) => {
                const textCtx = canvas.getContext("2d");
                if (textCtx) {
                    const dims = {
                        height: canvas.clientHeight * window.devicePixelRatio,
                        width: canvas.clientWidth * window.devicePixelRatio,
                    };
                    const dataPoints = psMapper.getInputData().getPoints();
                    const viewMatrix = camera.getViewMatrix();
                    gl_matrix_1.mat4.transpose(viewMatrix, viewMatrix);
                    const projMatrix = camera.getProjectionMatrix(aspect, -1, 1);
                    gl_matrix_1.mat4.transpose(projMatrix, projMatrix);
                    textCtx.clearRect(0, 0, dims.width, dims.height);
                    coordsList.forEach((xy, idx) => {
                        const pdPoint = dataPoints.getPoint(idx);
                        const vc = gl_matrix_1.vec3.fromValues(pdPoint[0], pdPoint[1], pdPoint[2]);
                        gl_matrix_1.vec3.transformMat4(vc, vc, viewMatrix);
                        vc[2] += 0.05; // sensibility
                        gl_matrix_1.vec3.transformMat4(vc, vc, projMatrix);
                        if (vc[2] - 0.001 < xy[3]) {
                            textCtx.font = "30px serif";
                            textCtx.textAlign = "center";
                            textCtx.textBaseline = "alphabetic";
                            textCtx.fillText(`.`, xy[0], dims.height - xy[1] + 2);
                            textCtx.font = `${this.fontsize * window.devicePixelRatio}px serif`;
                            textCtx.textAlign = "right";
                            textCtx.textBaseline = "top";
                            let label;
                            if (idx < this.xticks.length)
                                label = this.xlabels[idx];
                            else if (idx >= this.xticks.length &&
                                idx < this.xticks.length + this.yticks.length)
                                label = this.ylabels[idx - this.xticks.length];
                            else
                                label = this.zlabels[idx - (this.xticks.length + this.yticks.length)];
                            textCtx.fillText(`${label}`, xy[0], dims.height - xy[1]);
                        }
                    });
                }
            });
            const psActor = util_1.vtkns.Actor.newInstance(); //PixelSpace
            psActor.setMapper(psMapper);
            const axesMapper = util_1.vtkns.Mapper.newInstance();
            axesMapper.setInputData(axesPolyData);
            const axesActor = util_1.vtkns.Actor.newInstance();
            axesActor.setMapper(axesMapper);
            axesActor.getProperty().setOpacity(this.axes_opacity);
            const gridActor = this._create_grid_axes();
            return { psActor, axesActor, gridActor };
        }
    }
    exports.VTKAxes = VTKAxes;
    VTKAxes.__name__ = "VTKAxes";
    VTKAxes.__module__ = "panel.models.vtk";
    VTKAxes.init_VTKAxes();
},
"2f3fd5db07": /* gl-matrix/esm/index.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    exports.glMatrix = glMatrix;
    const mat2 = tslib_1.__importStar(require("7c0b8e6048") /* ./mat2.js */);
    exports.mat2 = mat2;
    const mat2d = tslib_1.__importStar(require("dc03f0a621") /* ./mat2d.js */);
    exports.mat2d = mat2d;
    const mat3 = tslib_1.__importStar(require("0285c50a7e") /* ./mat3.js */);
    exports.mat3 = mat3;
    const mat4 = tslib_1.__importStar(require("a427635f32") /* ./mat4.js */);
    exports.mat4 = mat4;
    const quat = tslib_1.__importStar(require("eb06fc032a") /* ./quat.js */);
    exports.quat = quat;
    const quat2 = tslib_1.__importStar(require("277615c682") /* ./quat2.js */);
    exports.quat2 = quat2;
    const vec2 = tslib_1.__importStar(require("c56d9ff837") /* ./vec2.js */);
    exports.vec2 = vec2;
    const vec3 = tslib_1.__importStar(require("2c5eb22089") /* ./vec3.js */);
    exports.vec3 = vec3;
    const vec4 = tslib_1.__importStar(require("c1aa33d719") /* ./vec4.js */);
    exports.vec4 = vec4;
},
"68ca94c15c": /* gl-matrix/esm/common.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * Common utilities
     * @module glMatrix
     */
    // Configuration Constants
    exports.EPSILON = 0.000001;
    exports.ARRAY_TYPE = typeof Float32Array !== 'undefined' ? Float32Array : Array;
    exports.RANDOM = Math.random;
    /**
     * Sets the type of array used when creating new vectors and matrices
     *
     * @param {Type} type Array type, such as Float32Array or Array
     */
    function setMatrixArrayType(type) {
        exports.ARRAY_TYPE = type;
    }
    exports.setMatrixArrayType = setMatrixArrayType;
    var degree = Math.PI / 180;
    /**
     * Convert Degree To Radian
     *
     * @param {Number} a Angle in Degrees
     */
    function toRadian(a) {
        return a * degree;
    }
    exports.toRadian = toRadian;
    /**
     * Tests whether or not the arguments have approximately the same value, within an absolute
     * or relative tolerance of glMatrix.EPSILON (an absolute tolerance is used for values less
     * than or equal to 1.0, and a relative tolerance is used for larger values)
     *
     * @param {Number} a The first number to test.
     * @param {Number} b The second number to test.
     * @returns {Boolean} True if the numbers are approximately equal, false otherwise.
     */
    function equals(a, b) {
        return Math.abs(a - b) <= exports.EPSILON * Math.max(1.0, Math.abs(a), Math.abs(b));
    }
    exports.equals = equals;
    if (!Math.hypot)
        Math.hypot = function () {
            var y = 0, i = arguments.length;
            while (i--) {
                y += arguments[i] * arguments[i];
            }
            return Math.sqrt(y);
        };
},
"7c0b8e6048": /* gl-matrix/esm/mat2.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    /**
     * 2x2 Matrix
     * @module mat2
     */
    /**
     * Creates a new identity mat2
     *
     * @returns {mat2} a new 2x2 matrix
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(4);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[1] = 0;
            out[2] = 0;
        }
        out[0] = 1;
        out[3] = 1;
        return out;
    }
    exports.create = create;
    /**
     * Creates a new mat2 initialized with values from an existing matrix
     *
     * @param {mat2} a matrix to clone
     * @returns {mat2} a new 2x2 matrix
     */
    function clone(a) {
        var out = new glMatrix.ARRAY_TYPE(4);
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        return out;
    }
    exports.clone = clone;
    /**
     * Copy the values from one mat2 to another
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the source matrix
     * @returns {mat2} out
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        return out;
    }
    exports.copy = copy;
    /**
     * Set a mat2 to the identity matrix
     *
     * @param {mat2} out the receiving matrix
     * @returns {mat2} out
     */
    function identity(out) {
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 1;
        return out;
    }
    exports.identity = identity;
    /**
     * Create a new mat2 with the given values
     *
     * @param {Number} m00 Component in column 0, row 0 position (index 0)
     * @param {Number} m01 Component in column 0, row 1 position (index 1)
     * @param {Number} m10 Component in column 1, row 0 position (index 2)
     * @param {Number} m11 Component in column 1, row 1 position (index 3)
     * @returns {mat2} out A new 2x2 matrix
     */
    function fromValues(m00, m01, m10, m11) {
        var out = new glMatrix.ARRAY_TYPE(4);
        out[0] = m00;
        out[1] = m01;
        out[2] = m10;
        out[3] = m11;
        return out;
    }
    exports.fromValues = fromValues;
    /**
     * Set the components of a mat2 to the given values
     *
     * @param {mat2} out the receiving matrix
     * @param {Number} m00 Component in column 0, row 0 position (index 0)
     * @param {Number} m01 Component in column 0, row 1 position (index 1)
     * @param {Number} m10 Component in column 1, row 0 position (index 2)
     * @param {Number} m11 Component in column 1, row 1 position (index 3)
     * @returns {mat2} out
     */
    function set(out, m00, m01, m10, m11) {
        out[0] = m00;
        out[1] = m01;
        out[2] = m10;
        out[3] = m11;
        return out;
    }
    exports.set = set;
    /**
     * Transpose the values of a mat2
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the source matrix
     * @returns {mat2} out
     */
    function transpose(out, a) {
        // If we are transposing ourselves we can skip a few steps but have to cache
        // some values
        if (out === a) {
            var a1 = a[1];
            out[1] = a[2];
            out[2] = a1;
        }
        else {
            out[0] = a[0];
            out[1] = a[2];
            out[2] = a[1];
            out[3] = a[3];
        }
        return out;
    }
    exports.transpose = transpose;
    /**
     * Inverts a mat2
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the source matrix
     * @returns {mat2} out
     */
    function invert(out, a) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3]; // Calculate the determinant
        var det = a0 * a3 - a2 * a1;
        if (!det) {
            return null;
        }
        det = 1.0 / det;
        out[0] = a3 * det;
        out[1] = -a1 * det;
        out[2] = -a2 * det;
        out[3] = a0 * det;
        return out;
    }
    exports.invert = invert;
    /**
     * Calculates the adjugate of a mat2
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the source matrix
     * @returns {mat2} out
     */
    function adjoint(out, a) {
        // Caching this value is nessecary if out == a
        var a0 = a[0];
        out[0] = a[3];
        out[1] = -a[1];
        out[2] = -a[2];
        out[3] = a0;
        return out;
    }
    exports.adjoint = adjoint;
    /**
     * Calculates the determinant of a mat2
     *
     * @param {mat2} a the source matrix
     * @returns {Number} determinant of a
     */
    function determinant(a) {
        return a[0] * a[3] - a[2] * a[1];
    }
    exports.determinant = determinant;
    /**
     * Multiplies two mat2's
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the first operand
     * @param {mat2} b the second operand
     * @returns {mat2} out
     */
    function multiply(out, a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3];
        out[0] = a0 * b0 + a2 * b1;
        out[1] = a1 * b0 + a3 * b1;
        out[2] = a0 * b2 + a2 * b3;
        out[3] = a1 * b2 + a3 * b3;
        return out;
    }
    exports.multiply = multiply;
    /**
     * Rotates a mat2 by the given angle
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the matrix to rotate
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat2} out
     */
    function rotate(out, a, rad) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3];
        var s = Math.sin(rad);
        var c = Math.cos(rad);
        out[0] = a0 * c + a2 * s;
        out[1] = a1 * c + a3 * s;
        out[2] = a0 * -s + a2 * c;
        out[3] = a1 * -s + a3 * c;
        return out;
    }
    exports.rotate = rotate;
    /**
     * Scales the mat2 by the dimensions in the given vec2
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the matrix to rotate
     * @param {vec2} v the vec2 to scale the matrix by
     * @returns {mat2} out
     **/
    function scale(out, a, v) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3];
        var v0 = v[0], v1 = v[1];
        out[0] = a0 * v0;
        out[1] = a1 * v0;
        out[2] = a2 * v1;
        out[3] = a3 * v1;
        return out;
    }
    exports.scale = scale;
    /**
     * Creates a matrix from a given angle
     * This is equivalent to (but much faster than):
     *
     *     mat2.identity(dest);
     *     mat2.rotate(dest, dest, rad);
     *
     * @param {mat2} out mat2 receiving operation result
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat2} out
     */
    function fromRotation(out, rad) {
        var s = Math.sin(rad);
        var c = Math.cos(rad);
        out[0] = c;
        out[1] = s;
        out[2] = -s;
        out[3] = c;
        return out;
    }
    exports.fromRotation = fromRotation;
    /**
     * Creates a matrix from a vector scaling
     * This is equivalent to (but much faster than):
     *
     *     mat2.identity(dest);
     *     mat2.scale(dest, dest, vec);
     *
     * @param {mat2} out mat2 receiving operation result
     * @param {vec2} v Scaling vector
     * @returns {mat2} out
     */
    function fromScaling(out, v) {
        out[0] = v[0];
        out[1] = 0;
        out[2] = 0;
        out[3] = v[1];
        return out;
    }
    exports.fromScaling = fromScaling;
    /**
     * Returns a string representation of a mat2
     *
     * @param {mat2} a matrix to represent as a string
     * @returns {String} string representation of the matrix
     */
    function str(a) {
        return "mat2(" + a[0] + ", " + a[1] + ", " + a[2] + ", " + a[3] + ")";
    }
    exports.str = str;
    /**
     * Returns Frobenius norm of a mat2
     *
     * @param {mat2} a the matrix to calculate Frobenius norm of
     * @returns {Number} Frobenius norm
     */
    function frob(a) {
        return Math.hypot(a[0], a[1], a[2], a[3]);
    }
    exports.frob = frob;
    /**
     * Returns L, D and U matrices (Lower triangular, Diagonal and Upper triangular) by factorizing the input matrix
     * @param {mat2} L the lower triangular matrix
     * @param {mat2} D the diagonal matrix
     * @param {mat2} U the upper triangular matrix
     * @param {mat2} a the input matrix to factorize
     */
    function LDU(L, D, U, a) {
        L[2] = a[2] / a[0];
        U[0] = a[0];
        U[1] = a[1];
        U[3] = a[3] - L[2] * U[1];
        return [L, D, U];
    }
    exports.LDU = LDU;
    /**
     * Adds two mat2's
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the first operand
     * @param {mat2} b the second operand
     * @returns {mat2} out
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        out[2] = a[2] + b[2];
        out[3] = a[3] + b[3];
        return out;
    }
    exports.add = add;
    /**
     * Subtracts matrix b from matrix a
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the first operand
     * @param {mat2} b the second operand
     * @returns {mat2} out
     */
    function subtract(out, a, b) {
        out[0] = a[0] - b[0];
        out[1] = a[1] - b[1];
        out[2] = a[2] - b[2];
        out[3] = a[3] - b[3];
        return out;
    }
    exports.subtract = subtract;
    /**
     * Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
     *
     * @param {mat2} a The first matrix.
     * @param {mat2} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1] && a[2] === b[2] && a[3] === b[3];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the matrices have approximately the same elements in the same position.
     *
     * @param {mat2} a The first matrix.
     * @param {mat2} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1)) && Math.abs(a2 - b2) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a2), Math.abs(b2)) && Math.abs(a3 - b3) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a3), Math.abs(b3));
    }
    exports.equals = equals;
    /**
     * Multiply each element of the matrix by a scalar.
     *
     * @param {mat2} out the receiving matrix
     * @param {mat2} a the matrix to scale
     * @param {Number} b amount to scale the matrix's elements by
     * @returns {mat2} out
     */
    function multiplyScalar(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        out[2] = a[2] * b;
        out[3] = a[3] * b;
        return out;
    }
    exports.multiplyScalar = multiplyScalar;
    /**
     * Adds two mat2's after multiplying each element of the second operand by a scalar value.
     *
     * @param {mat2} out the receiving vector
     * @param {mat2} a the first operand
     * @param {mat2} b the second operand
     * @param {Number} scale the amount to scale b's elements by before adding
     * @returns {mat2} out
     */
    function multiplyScalarAndAdd(out, a, b, scale) {
        out[0] = a[0] + b[0] * scale;
        out[1] = a[1] + b[1] * scale;
        out[2] = a[2] + b[2] * scale;
        out[3] = a[3] + b[3] * scale;
        return out;
    }
    exports.multiplyScalarAndAdd = multiplyScalarAndAdd;
    /**
     * Alias for {@link mat2.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Alias for {@link mat2.subtract}
     * @function
     */
    exports.sub = subtract;
},
"dc03f0a621": /* gl-matrix/esm/mat2d.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    /**
     * 2x3 Matrix
     * @module mat2d
     * @description
     * A mat2d contains six elements defined as:
     * <pre>
     * [a, b,
     *  c, d,
     *  tx, ty]
     * </pre>
     * This is a short form for the 3x3 matrix:
     * <pre>
     * [a, b, 0,
     *  c, d, 0,
     *  tx, ty, 1]
     * </pre>
     * The last column is ignored so the array is shorter and operations are faster.
     */
    /**
     * Creates a new identity mat2d
     *
     * @returns {mat2d} a new 2x3 matrix
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(6);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[1] = 0;
            out[2] = 0;
            out[4] = 0;
            out[5] = 0;
        }
        out[0] = 1;
        out[3] = 1;
        return out;
    }
    exports.create = create;
    /**
     * Creates a new mat2d initialized with values from an existing matrix
     *
     * @param {mat2d} a matrix to clone
     * @returns {mat2d} a new 2x3 matrix
     */
    function clone(a) {
        var out = new glMatrix.ARRAY_TYPE(6);
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        out[4] = a[4];
        out[5] = a[5];
        return out;
    }
    exports.clone = clone;
    /**
     * Copy the values from one mat2d to another
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the source matrix
     * @returns {mat2d} out
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        out[4] = a[4];
        out[5] = a[5];
        return out;
    }
    exports.copy = copy;
    /**
     * Set a mat2d to the identity matrix
     *
     * @param {mat2d} out the receiving matrix
     * @returns {mat2d} out
     */
    function identity(out) {
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 1;
        out[4] = 0;
        out[5] = 0;
        return out;
    }
    exports.identity = identity;
    /**
     * Create a new mat2d with the given values
     *
     * @param {Number} a Component A (index 0)
     * @param {Number} b Component B (index 1)
     * @param {Number} c Component C (index 2)
     * @param {Number} d Component D (index 3)
     * @param {Number} tx Component TX (index 4)
     * @param {Number} ty Component TY (index 5)
     * @returns {mat2d} A new mat2d
     */
    function fromValues(a, b, c, d, tx, ty) {
        var out = new glMatrix.ARRAY_TYPE(6);
        out[0] = a;
        out[1] = b;
        out[2] = c;
        out[3] = d;
        out[4] = tx;
        out[5] = ty;
        return out;
    }
    exports.fromValues = fromValues;
    /**
     * Set the components of a mat2d to the given values
     *
     * @param {mat2d} out the receiving matrix
     * @param {Number} a Component A (index 0)
     * @param {Number} b Component B (index 1)
     * @param {Number} c Component C (index 2)
     * @param {Number} d Component D (index 3)
     * @param {Number} tx Component TX (index 4)
     * @param {Number} ty Component TY (index 5)
     * @returns {mat2d} out
     */
    function set(out, a, b, c, d, tx, ty) {
        out[0] = a;
        out[1] = b;
        out[2] = c;
        out[3] = d;
        out[4] = tx;
        out[5] = ty;
        return out;
    }
    exports.set = set;
    /**
     * Inverts a mat2d
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the source matrix
     * @returns {mat2d} out
     */
    function invert(out, a) {
        var aa = a[0], ab = a[1], ac = a[2], ad = a[3];
        var atx = a[4], aty = a[5];
        var det = aa * ad - ab * ac;
        if (!det) {
            return null;
        }
        det = 1.0 / det;
        out[0] = ad * det;
        out[1] = -ab * det;
        out[2] = -ac * det;
        out[3] = aa * det;
        out[4] = (ac * aty - ad * atx) * det;
        out[5] = (ab * atx - aa * aty) * det;
        return out;
    }
    exports.invert = invert;
    /**
     * Calculates the determinant of a mat2d
     *
     * @param {mat2d} a the source matrix
     * @returns {Number} determinant of a
     */
    function determinant(a) {
        return a[0] * a[3] - a[1] * a[2];
    }
    exports.determinant = determinant;
    /**
     * Multiplies two mat2d's
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the first operand
     * @param {mat2d} b the second operand
     * @returns {mat2d} out
     */
    function multiply(out, a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3], a4 = a[4], a5 = a[5];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3], b4 = b[4], b5 = b[5];
        out[0] = a0 * b0 + a2 * b1;
        out[1] = a1 * b0 + a3 * b1;
        out[2] = a0 * b2 + a2 * b3;
        out[3] = a1 * b2 + a3 * b3;
        out[4] = a0 * b4 + a2 * b5 + a4;
        out[5] = a1 * b4 + a3 * b5 + a5;
        return out;
    }
    exports.multiply = multiply;
    /**
     * Rotates a mat2d by the given angle
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the matrix to rotate
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat2d} out
     */
    function rotate(out, a, rad) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3], a4 = a[4], a5 = a[5];
        var s = Math.sin(rad);
        var c = Math.cos(rad);
        out[0] = a0 * c + a2 * s;
        out[1] = a1 * c + a3 * s;
        out[2] = a0 * -s + a2 * c;
        out[3] = a1 * -s + a3 * c;
        out[4] = a4;
        out[5] = a5;
        return out;
    }
    exports.rotate = rotate;
    /**
     * Scales the mat2d by the dimensions in the given vec2
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the matrix to translate
     * @param {vec2} v the vec2 to scale the matrix by
     * @returns {mat2d} out
     **/
    function scale(out, a, v) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3], a4 = a[4], a5 = a[5];
        var v0 = v[0], v1 = v[1];
        out[0] = a0 * v0;
        out[1] = a1 * v0;
        out[2] = a2 * v1;
        out[3] = a3 * v1;
        out[4] = a4;
        out[5] = a5;
        return out;
    }
    exports.scale = scale;
    /**
     * Translates the mat2d by the dimensions in the given vec2
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the matrix to translate
     * @param {vec2} v the vec2 to translate the matrix by
     * @returns {mat2d} out
     **/
    function translate(out, a, v) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3], a4 = a[4], a5 = a[5];
        var v0 = v[0], v1 = v[1];
        out[0] = a0;
        out[1] = a1;
        out[2] = a2;
        out[3] = a3;
        out[4] = a0 * v0 + a2 * v1 + a4;
        out[5] = a1 * v0 + a3 * v1 + a5;
        return out;
    }
    exports.translate = translate;
    /**
     * Creates a matrix from a given angle
     * This is equivalent to (but much faster than):
     *
     *     mat2d.identity(dest);
     *     mat2d.rotate(dest, dest, rad);
     *
     * @param {mat2d} out mat2d receiving operation result
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat2d} out
     */
    function fromRotation(out, rad) {
        var s = Math.sin(rad), c = Math.cos(rad);
        out[0] = c;
        out[1] = s;
        out[2] = -s;
        out[3] = c;
        out[4] = 0;
        out[5] = 0;
        return out;
    }
    exports.fromRotation = fromRotation;
    /**
     * Creates a matrix from a vector scaling
     * This is equivalent to (but much faster than):
     *
     *     mat2d.identity(dest);
     *     mat2d.scale(dest, dest, vec);
     *
     * @param {mat2d} out mat2d receiving operation result
     * @param {vec2} v Scaling vector
     * @returns {mat2d} out
     */
    function fromScaling(out, v) {
        out[0] = v[0];
        out[1] = 0;
        out[2] = 0;
        out[3] = v[1];
        out[4] = 0;
        out[5] = 0;
        return out;
    }
    exports.fromScaling = fromScaling;
    /**
     * Creates a matrix from a vector translation
     * This is equivalent to (but much faster than):
     *
     *     mat2d.identity(dest);
     *     mat2d.translate(dest, dest, vec);
     *
     * @param {mat2d} out mat2d receiving operation result
     * @param {vec2} v Translation vector
     * @returns {mat2d} out
     */
    function fromTranslation(out, v) {
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 1;
        out[4] = v[0];
        out[5] = v[1];
        return out;
    }
    exports.fromTranslation = fromTranslation;
    /**
     * Returns a string representation of a mat2d
     *
     * @param {mat2d} a matrix to represent as a string
     * @returns {String} string representation of the matrix
     */
    function str(a) {
        return "mat2d(" + a[0] + ", " + a[1] + ", " + a[2] + ", " + a[3] + ", " + a[4] + ", " + a[5] + ")";
    }
    exports.str = str;
    /**
     * Returns Frobenius norm of a mat2d
     *
     * @param {mat2d} a the matrix to calculate Frobenius norm of
     * @returns {Number} Frobenius norm
     */
    function frob(a) {
        return Math.hypot(a[0], a[1], a[2], a[3], a[4], a[5], 1);
    }
    exports.frob = frob;
    /**
     * Adds two mat2d's
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the first operand
     * @param {mat2d} b the second operand
     * @returns {mat2d} out
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        out[2] = a[2] + b[2];
        out[3] = a[3] + b[3];
        out[4] = a[4] + b[4];
        out[5] = a[5] + b[5];
        return out;
    }
    exports.add = add;
    /**
     * Subtracts matrix b from matrix a
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the first operand
     * @param {mat2d} b the second operand
     * @returns {mat2d} out
     */
    function subtract(out, a, b) {
        out[0] = a[0] - b[0];
        out[1] = a[1] - b[1];
        out[2] = a[2] - b[2];
        out[3] = a[3] - b[3];
        out[4] = a[4] - b[4];
        out[5] = a[5] - b[5];
        return out;
    }
    exports.subtract = subtract;
    /**
     * Multiply each element of the matrix by a scalar.
     *
     * @param {mat2d} out the receiving matrix
     * @param {mat2d} a the matrix to scale
     * @param {Number} b amount to scale the matrix's elements by
     * @returns {mat2d} out
     */
    function multiplyScalar(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        out[2] = a[2] * b;
        out[3] = a[3] * b;
        out[4] = a[4] * b;
        out[5] = a[5] * b;
        return out;
    }
    exports.multiplyScalar = multiplyScalar;
    /**
     * Adds two mat2d's after multiplying each element of the second operand by a scalar value.
     *
     * @param {mat2d} out the receiving vector
     * @param {mat2d} a the first operand
     * @param {mat2d} b the second operand
     * @param {Number} scale the amount to scale b's elements by before adding
     * @returns {mat2d} out
     */
    function multiplyScalarAndAdd(out, a, b, scale) {
        out[0] = a[0] + b[0] * scale;
        out[1] = a[1] + b[1] * scale;
        out[2] = a[2] + b[2] * scale;
        out[3] = a[3] + b[3] * scale;
        out[4] = a[4] + b[4] * scale;
        out[5] = a[5] + b[5] * scale;
        return out;
    }
    exports.multiplyScalarAndAdd = multiplyScalarAndAdd;
    /**
     * Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
     *
     * @param {mat2d} a The first matrix.
     * @param {mat2d} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1] && a[2] === b[2] && a[3] === b[3] && a[4] === b[4] && a[5] === b[5];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the matrices have approximately the same elements in the same position.
     *
     * @param {mat2d} a The first matrix.
     * @param {mat2d} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3], a4 = a[4], a5 = a[5];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3], b4 = b[4], b5 = b[5];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1)) && Math.abs(a2 - b2) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a2), Math.abs(b2)) && Math.abs(a3 - b3) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a3), Math.abs(b3)) && Math.abs(a4 - b4) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a4), Math.abs(b4)) && Math.abs(a5 - b5) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a5), Math.abs(b5));
    }
    exports.equals = equals;
    /**
     * Alias for {@link mat2d.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Alias for {@link mat2d.subtract}
     * @function
     */
    exports.sub = subtract;
},
"0285c50a7e": /* gl-matrix/esm/mat3.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    /**
     * 3x3 Matrix
     * @module mat3
     */
    /**
     * Creates a new identity mat3
     *
     * @returns {mat3} a new 3x3 matrix
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(9);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[1] = 0;
            out[2] = 0;
            out[3] = 0;
            out[5] = 0;
            out[6] = 0;
            out[7] = 0;
        }
        out[0] = 1;
        out[4] = 1;
        out[8] = 1;
        return out;
    }
    exports.create = create;
    /**
     * Copies the upper-left 3x3 values into the given mat3.
     *
     * @param {mat3} out the receiving 3x3 matrix
     * @param {mat4} a   the source 4x4 matrix
     * @returns {mat3} out
     */
    function fromMat4(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[4];
        out[4] = a[5];
        out[5] = a[6];
        out[6] = a[8];
        out[7] = a[9];
        out[8] = a[10];
        return out;
    }
    exports.fromMat4 = fromMat4;
    /**
     * Creates a new mat3 initialized with values from an existing matrix
     *
     * @param {mat3} a matrix to clone
     * @returns {mat3} a new 3x3 matrix
     */
    function clone(a) {
        var out = new glMatrix.ARRAY_TYPE(9);
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        out[4] = a[4];
        out[5] = a[5];
        out[6] = a[6];
        out[7] = a[7];
        out[8] = a[8];
        return out;
    }
    exports.clone = clone;
    /**
     * Copy the values from one mat3 to another
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the source matrix
     * @returns {mat3} out
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        out[4] = a[4];
        out[5] = a[5];
        out[6] = a[6];
        out[7] = a[7];
        out[8] = a[8];
        return out;
    }
    exports.copy = copy;
    /**
     * Create a new mat3 with the given values
     *
     * @param {Number} m00 Component in column 0, row 0 position (index 0)
     * @param {Number} m01 Component in column 0, row 1 position (index 1)
     * @param {Number} m02 Component in column 0, row 2 position (index 2)
     * @param {Number} m10 Component in column 1, row 0 position (index 3)
     * @param {Number} m11 Component in column 1, row 1 position (index 4)
     * @param {Number} m12 Component in column 1, row 2 position (index 5)
     * @param {Number} m20 Component in column 2, row 0 position (index 6)
     * @param {Number} m21 Component in column 2, row 1 position (index 7)
     * @param {Number} m22 Component in column 2, row 2 position (index 8)
     * @returns {mat3} A new mat3
     */
    function fromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22) {
        var out = new glMatrix.ARRAY_TYPE(9);
        out[0] = m00;
        out[1] = m01;
        out[2] = m02;
        out[3] = m10;
        out[4] = m11;
        out[5] = m12;
        out[6] = m20;
        out[7] = m21;
        out[8] = m22;
        return out;
    }
    exports.fromValues = fromValues;
    /**
     * Set the components of a mat3 to the given values
     *
     * @param {mat3} out the receiving matrix
     * @param {Number} m00 Component in column 0, row 0 position (index 0)
     * @param {Number} m01 Component in column 0, row 1 position (index 1)
     * @param {Number} m02 Component in column 0, row 2 position (index 2)
     * @param {Number} m10 Component in column 1, row 0 position (index 3)
     * @param {Number} m11 Component in column 1, row 1 position (index 4)
     * @param {Number} m12 Component in column 1, row 2 position (index 5)
     * @param {Number} m20 Component in column 2, row 0 position (index 6)
     * @param {Number} m21 Component in column 2, row 1 position (index 7)
     * @param {Number} m22 Component in column 2, row 2 position (index 8)
     * @returns {mat3} out
     */
    function set(out, m00, m01, m02, m10, m11, m12, m20, m21, m22) {
        out[0] = m00;
        out[1] = m01;
        out[2] = m02;
        out[3] = m10;
        out[4] = m11;
        out[5] = m12;
        out[6] = m20;
        out[7] = m21;
        out[8] = m22;
        return out;
    }
    exports.set = set;
    /**
     * Set a mat3 to the identity matrix
     *
     * @param {mat3} out the receiving matrix
     * @returns {mat3} out
     */
    function identity(out) {
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 1;
        out[5] = 0;
        out[6] = 0;
        out[7] = 0;
        out[8] = 1;
        return out;
    }
    exports.identity = identity;
    /**
     * Transpose the values of a mat3
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the source matrix
     * @returns {mat3} out
     */
    function transpose(out, a) {
        // If we are transposing ourselves we can skip a few steps but have to cache some values
        if (out === a) {
            var a01 = a[1], a02 = a[2], a12 = a[5];
            out[1] = a[3];
            out[2] = a[6];
            out[3] = a01;
            out[5] = a[7];
            out[6] = a02;
            out[7] = a12;
        }
        else {
            out[0] = a[0];
            out[1] = a[3];
            out[2] = a[6];
            out[3] = a[1];
            out[4] = a[4];
            out[5] = a[7];
            out[6] = a[2];
            out[7] = a[5];
            out[8] = a[8];
        }
        return out;
    }
    exports.transpose = transpose;
    /**
     * Inverts a mat3
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the source matrix
     * @returns {mat3} out
     */
    function invert(out, a) {
        var a00 = a[0], a01 = a[1], a02 = a[2];
        var a10 = a[3], a11 = a[4], a12 = a[5];
        var a20 = a[6], a21 = a[7], a22 = a[8];
        var b01 = a22 * a11 - a12 * a21;
        var b11 = -a22 * a10 + a12 * a20;
        var b21 = a21 * a10 - a11 * a20; // Calculate the determinant
        var det = a00 * b01 + a01 * b11 + a02 * b21;
        if (!det) {
            return null;
        }
        det = 1.0 / det;
        out[0] = b01 * det;
        out[1] = (-a22 * a01 + a02 * a21) * det;
        out[2] = (a12 * a01 - a02 * a11) * det;
        out[3] = b11 * det;
        out[4] = (a22 * a00 - a02 * a20) * det;
        out[5] = (-a12 * a00 + a02 * a10) * det;
        out[6] = b21 * det;
        out[7] = (-a21 * a00 + a01 * a20) * det;
        out[8] = (a11 * a00 - a01 * a10) * det;
        return out;
    }
    exports.invert = invert;
    /**
     * Calculates the adjugate of a mat3
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the source matrix
     * @returns {mat3} out
     */
    function adjoint(out, a) {
        var a00 = a[0], a01 = a[1], a02 = a[2];
        var a10 = a[3], a11 = a[4], a12 = a[5];
        var a20 = a[6], a21 = a[7], a22 = a[8];
        out[0] = a11 * a22 - a12 * a21;
        out[1] = a02 * a21 - a01 * a22;
        out[2] = a01 * a12 - a02 * a11;
        out[3] = a12 * a20 - a10 * a22;
        out[4] = a00 * a22 - a02 * a20;
        out[5] = a02 * a10 - a00 * a12;
        out[6] = a10 * a21 - a11 * a20;
        out[7] = a01 * a20 - a00 * a21;
        out[8] = a00 * a11 - a01 * a10;
        return out;
    }
    exports.adjoint = adjoint;
    /**
     * Calculates the determinant of a mat3
     *
     * @param {mat3} a the source matrix
     * @returns {Number} determinant of a
     */
    function determinant(a) {
        var a00 = a[0], a01 = a[1], a02 = a[2];
        var a10 = a[3], a11 = a[4], a12 = a[5];
        var a20 = a[6], a21 = a[7], a22 = a[8];
        return a00 * (a22 * a11 - a12 * a21) + a01 * (-a22 * a10 + a12 * a20) + a02 * (a21 * a10 - a11 * a20);
    }
    exports.determinant = determinant;
    /**
     * Multiplies two mat3's
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the first operand
     * @param {mat3} b the second operand
     * @returns {mat3} out
     */
    function multiply(out, a, b) {
        var a00 = a[0], a01 = a[1], a02 = a[2];
        var a10 = a[3], a11 = a[4], a12 = a[5];
        var a20 = a[6], a21 = a[7], a22 = a[8];
        var b00 = b[0], b01 = b[1], b02 = b[2];
        var b10 = b[3], b11 = b[4], b12 = b[5];
        var b20 = b[6], b21 = b[7], b22 = b[8];
        out[0] = b00 * a00 + b01 * a10 + b02 * a20;
        out[1] = b00 * a01 + b01 * a11 + b02 * a21;
        out[2] = b00 * a02 + b01 * a12 + b02 * a22;
        out[3] = b10 * a00 + b11 * a10 + b12 * a20;
        out[4] = b10 * a01 + b11 * a11 + b12 * a21;
        out[5] = b10 * a02 + b11 * a12 + b12 * a22;
        out[6] = b20 * a00 + b21 * a10 + b22 * a20;
        out[7] = b20 * a01 + b21 * a11 + b22 * a21;
        out[8] = b20 * a02 + b21 * a12 + b22 * a22;
        return out;
    }
    exports.multiply = multiply;
    /**
     * Translate a mat3 by the given vector
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the matrix to translate
     * @param {vec2} v vector to translate by
     * @returns {mat3} out
     */
    function translate(out, a, v) {
        var a00 = a[0], a01 = a[1], a02 = a[2], a10 = a[3], a11 = a[4], a12 = a[5], a20 = a[6], a21 = a[7], a22 = a[8], x = v[0], y = v[1];
        out[0] = a00;
        out[1] = a01;
        out[2] = a02;
        out[3] = a10;
        out[4] = a11;
        out[5] = a12;
        out[6] = x * a00 + y * a10 + a20;
        out[7] = x * a01 + y * a11 + a21;
        out[8] = x * a02 + y * a12 + a22;
        return out;
    }
    exports.translate = translate;
    /**
     * Rotates a mat3 by the given angle
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the matrix to rotate
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat3} out
     */
    function rotate(out, a, rad) {
        var a00 = a[0], a01 = a[1], a02 = a[2], a10 = a[3], a11 = a[4], a12 = a[5], a20 = a[6], a21 = a[7], a22 = a[8], s = Math.sin(rad), c = Math.cos(rad);
        out[0] = c * a00 + s * a10;
        out[1] = c * a01 + s * a11;
        out[2] = c * a02 + s * a12;
        out[3] = c * a10 - s * a00;
        out[4] = c * a11 - s * a01;
        out[5] = c * a12 - s * a02;
        out[6] = a20;
        out[7] = a21;
        out[8] = a22;
        return out;
    }
    exports.rotate = rotate;
    /**
     * Scales the mat3 by the dimensions in the given vec2
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the matrix to rotate
     * @param {vec2} v the vec2 to scale the matrix by
     * @returns {mat3} out
     **/
    function scale(out, a, v) {
        var x = v[0], y = v[1];
        out[0] = x * a[0];
        out[1] = x * a[1];
        out[2] = x * a[2];
        out[3] = y * a[3];
        out[4] = y * a[4];
        out[5] = y * a[5];
        out[6] = a[6];
        out[7] = a[7];
        out[8] = a[8];
        return out;
    }
    exports.scale = scale;
    /**
     * Creates a matrix from a vector translation
     * This is equivalent to (but much faster than):
     *
     *     mat3.identity(dest);
     *     mat3.translate(dest, dest, vec);
     *
     * @param {mat3} out mat3 receiving operation result
     * @param {vec2} v Translation vector
     * @returns {mat3} out
     */
    function fromTranslation(out, v) {
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 1;
        out[5] = 0;
        out[6] = v[0];
        out[7] = v[1];
        out[8] = 1;
        return out;
    }
    exports.fromTranslation = fromTranslation;
    /**
     * Creates a matrix from a given angle
     * This is equivalent to (but much faster than):
     *
     *     mat3.identity(dest);
     *     mat3.rotate(dest, dest, rad);
     *
     * @param {mat3} out mat3 receiving operation result
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat3} out
     */
    function fromRotation(out, rad) {
        var s = Math.sin(rad), c = Math.cos(rad);
        out[0] = c;
        out[1] = s;
        out[2] = 0;
        out[3] = -s;
        out[4] = c;
        out[5] = 0;
        out[6] = 0;
        out[7] = 0;
        out[8] = 1;
        return out;
    }
    exports.fromRotation = fromRotation;
    /**
     * Creates a matrix from a vector scaling
     * This is equivalent to (but much faster than):
     *
     *     mat3.identity(dest);
     *     mat3.scale(dest, dest, vec);
     *
     * @param {mat3} out mat3 receiving operation result
     * @param {vec2} v Scaling vector
     * @returns {mat3} out
     */
    function fromScaling(out, v) {
        out[0] = v[0];
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = v[1];
        out[5] = 0;
        out[6] = 0;
        out[7] = 0;
        out[8] = 1;
        return out;
    }
    exports.fromScaling = fromScaling;
    /**
     * Copies the values from a mat2d into a mat3
     *
     * @param {mat3} out the receiving matrix
     * @param {mat2d} a the matrix to copy
     * @returns {mat3} out
     **/
    function fromMat2d(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = 0;
        out[3] = a[2];
        out[4] = a[3];
        out[5] = 0;
        out[6] = a[4];
        out[7] = a[5];
        out[8] = 1;
        return out;
    }
    exports.fromMat2d = fromMat2d;
    /**
     * Calculates a 3x3 matrix from the given quaternion
     *
     * @param {mat3} out mat3 receiving operation result
     * @param {quat} q Quaternion to create matrix from
     *
     * @returns {mat3} out
     */
    function fromQuat(out, q) {
        var x = q[0], y = q[1], z = q[2], w = q[3];
        var x2 = x + x;
        var y2 = y + y;
        var z2 = z + z;
        var xx = x * x2;
        var yx = y * x2;
        var yy = y * y2;
        var zx = z * x2;
        var zy = z * y2;
        var zz = z * z2;
        var wx = w * x2;
        var wy = w * y2;
        var wz = w * z2;
        out[0] = 1 - yy - zz;
        out[3] = yx - wz;
        out[6] = zx + wy;
        out[1] = yx + wz;
        out[4] = 1 - xx - zz;
        out[7] = zy - wx;
        out[2] = zx - wy;
        out[5] = zy + wx;
        out[8] = 1 - xx - yy;
        return out;
    }
    exports.fromQuat = fromQuat;
    /**
     * Calculates a 3x3 normal matrix (transpose inverse) from the 4x4 matrix
     *
     * @param {mat3} out mat3 receiving operation result
     * @param {mat4} a Mat4 to derive the normal matrix from
     *
     * @returns {mat3} out
     */
    function normalFromMat4(out, a) {
        var a00 = a[0], a01 = a[1], a02 = a[2], a03 = a[3];
        var a10 = a[4], a11 = a[5], a12 = a[6], a13 = a[7];
        var a20 = a[8], a21 = a[9], a22 = a[10], a23 = a[11];
        var a30 = a[12], a31 = a[13], a32 = a[14], a33 = a[15];
        var b00 = a00 * a11 - a01 * a10;
        var b01 = a00 * a12 - a02 * a10;
        var b02 = a00 * a13 - a03 * a10;
        var b03 = a01 * a12 - a02 * a11;
        var b04 = a01 * a13 - a03 * a11;
        var b05 = a02 * a13 - a03 * a12;
        var b06 = a20 * a31 - a21 * a30;
        var b07 = a20 * a32 - a22 * a30;
        var b08 = a20 * a33 - a23 * a30;
        var b09 = a21 * a32 - a22 * a31;
        var b10 = a21 * a33 - a23 * a31;
        var b11 = a22 * a33 - a23 * a32; // Calculate the determinant
        var det = b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;
        if (!det) {
            return null;
        }
        det = 1.0 / det;
        out[0] = (a11 * b11 - a12 * b10 + a13 * b09) * det;
        out[1] = (a12 * b08 - a10 * b11 - a13 * b07) * det;
        out[2] = (a10 * b10 - a11 * b08 + a13 * b06) * det;
        out[3] = (a02 * b10 - a01 * b11 - a03 * b09) * det;
        out[4] = (a00 * b11 - a02 * b08 + a03 * b07) * det;
        out[5] = (a01 * b08 - a00 * b10 - a03 * b06) * det;
        out[6] = (a31 * b05 - a32 * b04 + a33 * b03) * det;
        out[7] = (a32 * b02 - a30 * b05 - a33 * b01) * det;
        out[8] = (a30 * b04 - a31 * b02 + a33 * b00) * det;
        return out;
    }
    exports.normalFromMat4 = normalFromMat4;
    /**
     * Generates a 2D projection matrix with the given bounds
     *
     * @param {mat3} out mat3 frustum matrix will be written into
     * @param {number} width Width of your gl context
     * @param {number} height Height of gl context
     * @returns {mat3} out
     */
    function projection(out, width, height) {
        out[0] = 2 / width;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = -2 / height;
        out[5] = 0;
        out[6] = -1;
        out[7] = 1;
        out[8] = 1;
        return out;
    }
    exports.projection = projection;
    /**
     * Returns a string representation of a mat3
     *
     * @param {mat3} a matrix to represent as a string
     * @returns {String} string representation of the matrix
     */
    function str(a) {
        return "mat3(" + a[0] + ", " + a[1] + ", " + a[2] + ", " + a[3] + ", " + a[4] + ", " + a[5] + ", " + a[6] + ", " + a[7] + ", " + a[8] + ")";
    }
    exports.str = str;
    /**
     * Returns Frobenius norm of a mat3
     *
     * @param {mat3} a the matrix to calculate Frobenius norm of
     * @returns {Number} Frobenius norm
     */
    function frob(a) {
        return Math.hypot(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
    }
    exports.frob = frob;
    /**
     * Adds two mat3's
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the first operand
     * @param {mat3} b the second operand
     * @returns {mat3} out
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        out[2] = a[2] + b[2];
        out[3] = a[3] + b[3];
        out[4] = a[4] + b[4];
        out[5] = a[5] + b[5];
        out[6] = a[6] + b[6];
        out[7] = a[7] + b[7];
        out[8] = a[8] + b[8];
        return out;
    }
    exports.add = add;
    /**
     * Subtracts matrix b from matrix a
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the first operand
     * @param {mat3} b the second operand
     * @returns {mat3} out
     */
    function subtract(out, a, b) {
        out[0] = a[0] - b[0];
        out[1] = a[1] - b[1];
        out[2] = a[2] - b[2];
        out[3] = a[3] - b[3];
        out[4] = a[4] - b[4];
        out[5] = a[5] - b[5];
        out[6] = a[6] - b[6];
        out[7] = a[7] - b[7];
        out[8] = a[8] - b[8];
        return out;
    }
    exports.subtract = subtract;
    /**
     * Multiply each element of the matrix by a scalar.
     *
     * @param {mat3} out the receiving matrix
     * @param {mat3} a the matrix to scale
     * @param {Number} b amount to scale the matrix's elements by
     * @returns {mat3} out
     */
    function multiplyScalar(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        out[2] = a[2] * b;
        out[3] = a[3] * b;
        out[4] = a[4] * b;
        out[5] = a[5] * b;
        out[6] = a[6] * b;
        out[7] = a[7] * b;
        out[8] = a[8] * b;
        return out;
    }
    exports.multiplyScalar = multiplyScalar;
    /**
     * Adds two mat3's after multiplying each element of the second operand by a scalar value.
     *
     * @param {mat3} out the receiving vector
     * @param {mat3} a the first operand
     * @param {mat3} b the second operand
     * @param {Number} scale the amount to scale b's elements by before adding
     * @returns {mat3} out
     */
    function multiplyScalarAndAdd(out, a, b, scale) {
        out[0] = a[0] + b[0] * scale;
        out[1] = a[1] + b[1] * scale;
        out[2] = a[2] + b[2] * scale;
        out[3] = a[3] + b[3] * scale;
        out[4] = a[4] + b[4] * scale;
        out[5] = a[5] + b[5] * scale;
        out[6] = a[6] + b[6] * scale;
        out[7] = a[7] + b[7] * scale;
        out[8] = a[8] + b[8] * scale;
        return out;
    }
    exports.multiplyScalarAndAdd = multiplyScalarAndAdd;
    /**
     * Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
     *
     * @param {mat3} a The first matrix.
     * @param {mat3} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1] && a[2] === b[2] && a[3] === b[3] && a[4] === b[4] && a[5] === b[5] && a[6] === b[6] && a[7] === b[7] && a[8] === b[8];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the matrices have approximately the same elements in the same position.
     *
     * @param {mat3} a The first matrix.
     * @param {mat3} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3], a4 = a[4], a5 = a[5], a6 = a[6], a7 = a[7], a8 = a[8];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3], b4 = b[4], b5 = b[5], b6 = b[6], b7 = b[7], b8 = b[8];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1)) && Math.abs(a2 - b2) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a2), Math.abs(b2)) && Math.abs(a3 - b3) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a3), Math.abs(b3)) && Math.abs(a4 - b4) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a4), Math.abs(b4)) && Math.abs(a5 - b5) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a5), Math.abs(b5)) && Math.abs(a6 - b6) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a6), Math.abs(b6)) && Math.abs(a7 - b7) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a7), Math.abs(b7)) && Math.abs(a8 - b8) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a8), Math.abs(b8));
    }
    exports.equals = equals;
    /**
     * Alias for {@link mat3.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Alias for {@link mat3.subtract}
     * @function
     */
    exports.sub = subtract;
},
"a427635f32": /* gl-matrix/esm/mat4.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    /**
     * 4x4 Matrix<br>Format: column-major, when typed out it looks like row-major<br>The matrices are being post multiplied.
     * @module mat4
     */
    /**
     * Creates a new identity mat4
     *
     * @returns {mat4} a new 4x4 matrix
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(16);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[1] = 0;
            out[2] = 0;
            out[3] = 0;
            out[4] = 0;
            out[6] = 0;
            out[7] = 0;
            out[8] = 0;
            out[9] = 0;
            out[11] = 0;
            out[12] = 0;
            out[13] = 0;
            out[14] = 0;
        }
        out[0] = 1;
        out[5] = 1;
        out[10] = 1;
        out[15] = 1;
        return out;
    }
    exports.create = create;
    /**
     * Creates a new mat4 initialized with values from an existing matrix
     *
     * @param {mat4} a matrix to clone
     * @returns {mat4} a new 4x4 matrix
     */
    function clone(a) {
        var out = new glMatrix.ARRAY_TYPE(16);
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        out[4] = a[4];
        out[5] = a[5];
        out[6] = a[6];
        out[7] = a[7];
        out[8] = a[8];
        out[9] = a[9];
        out[10] = a[10];
        out[11] = a[11];
        out[12] = a[12];
        out[13] = a[13];
        out[14] = a[14];
        out[15] = a[15];
        return out;
    }
    exports.clone = clone;
    /**
     * Copy the values from one mat4 to another
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the source matrix
     * @returns {mat4} out
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        out[4] = a[4];
        out[5] = a[5];
        out[6] = a[6];
        out[7] = a[7];
        out[8] = a[8];
        out[9] = a[9];
        out[10] = a[10];
        out[11] = a[11];
        out[12] = a[12];
        out[13] = a[13];
        out[14] = a[14];
        out[15] = a[15];
        return out;
    }
    exports.copy = copy;
    /**
     * Create a new mat4 with the given values
     *
     * @param {Number} m00 Component in column 0, row 0 position (index 0)
     * @param {Number} m01 Component in column 0, row 1 position (index 1)
     * @param {Number} m02 Component in column 0, row 2 position (index 2)
     * @param {Number} m03 Component in column 0, row 3 position (index 3)
     * @param {Number} m10 Component in column 1, row 0 position (index 4)
     * @param {Number} m11 Component in column 1, row 1 position (index 5)
     * @param {Number} m12 Component in column 1, row 2 position (index 6)
     * @param {Number} m13 Component in column 1, row 3 position (index 7)
     * @param {Number} m20 Component in column 2, row 0 position (index 8)
     * @param {Number} m21 Component in column 2, row 1 position (index 9)
     * @param {Number} m22 Component in column 2, row 2 position (index 10)
     * @param {Number} m23 Component in column 2, row 3 position (index 11)
     * @param {Number} m30 Component in column 3, row 0 position (index 12)
     * @param {Number} m31 Component in column 3, row 1 position (index 13)
     * @param {Number} m32 Component in column 3, row 2 position (index 14)
     * @param {Number} m33 Component in column 3, row 3 position (index 15)
     * @returns {mat4} A new mat4
     */
    function fromValues(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33) {
        var out = new glMatrix.ARRAY_TYPE(16);
        out[0] = m00;
        out[1] = m01;
        out[2] = m02;
        out[3] = m03;
        out[4] = m10;
        out[5] = m11;
        out[6] = m12;
        out[7] = m13;
        out[8] = m20;
        out[9] = m21;
        out[10] = m22;
        out[11] = m23;
        out[12] = m30;
        out[13] = m31;
        out[14] = m32;
        out[15] = m33;
        return out;
    }
    exports.fromValues = fromValues;
    /**
     * Set the components of a mat4 to the given values
     *
     * @param {mat4} out the receiving matrix
     * @param {Number} m00 Component in column 0, row 0 position (index 0)
     * @param {Number} m01 Component in column 0, row 1 position (index 1)
     * @param {Number} m02 Component in column 0, row 2 position (index 2)
     * @param {Number} m03 Component in column 0, row 3 position (index 3)
     * @param {Number} m10 Component in column 1, row 0 position (index 4)
     * @param {Number} m11 Component in column 1, row 1 position (index 5)
     * @param {Number} m12 Component in column 1, row 2 position (index 6)
     * @param {Number} m13 Component in column 1, row 3 position (index 7)
     * @param {Number} m20 Component in column 2, row 0 position (index 8)
     * @param {Number} m21 Component in column 2, row 1 position (index 9)
     * @param {Number} m22 Component in column 2, row 2 position (index 10)
     * @param {Number} m23 Component in column 2, row 3 position (index 11)
     * @param {Number} m30 Component in column 3, row 0 position (index 12)
     * @param {Number} m31 Component in column 3, row 1 position (index 13)
     * @param {Number} m32 Component in column 3, row 2 position (index 14)
     * @param {Number} m33 Component in column 3, row 3 position (index 15)
     * @returns {mat4} out
     */
    function set(out, m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33) {
        out[0] = m00;
        out[1] = m01;
        out[2] = m02;
        out[3] = m03;
        out[4] = m10;
        out[5] = m11;
        out[6] = m12;
        out[7] = m13;
        out[8] = m20;
        out[9] = m21;
        out[10] = m22;
        out[11] = m23;
        out[12] = m30;
        out[13] = m31;
        out[14] = m32;
        out[15] = m33;
        return out;
    }
    exports.set = set;
    /**
     * Set a mat4 to the identity matrix
     *
     * @param {mat4} out the receiving matrix
     * @returns {mat4} out
     */
    function identity(out) {
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 0;
        out[5] = 1;
        out[6] = 0;
        out[7] = 0;
        out[8] = 0;
        out[9] = 0;
        out[10] = 1;
        out[11] = 0;
        out[12] = 0;
        out[13] = 0;
        out[14] = 0;
        out[15] = 1;
        return out;
    }
    exports.identity = identity;
    /**
     * Transpose the values of a mat4
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the source matrix
     * @returns {mat4} out
     */
    function transpose(out, a) {
        // If we are transposing ourselves we can skip a few steps but have to cache some values
        if (out === a) {
            var a01 = a[1], a02 = a[2], a03 = a[3];
            var a12 = a[6], a13 = a[7];
            var a23 = a[11];
            out[1] = a[4];
            out[2] = a[8];
            out[3] = a[12];
            out[4] = a01;
            out[6] = a[9];
            out[7] = a[13];
            out[8] = a02;
            out[9] = a12;
            out[11] = a[14];
            out[12] = a03;
            out[13] = a13;
            out[14] = a23;
        }
        else {
            out[0] = a[0];
            out[1] = a[4];
            out[2] = a[8];
            out[3] = a[12];
            out[4] = a[1];
            out[5] = a[5];
            out[6] = a[9];
            out[7] = a[13];
            out[8] = a[2];
            out[9] = a[6];
            out[10] = a[10];
            out[11] = a[14];
            out[12] = a[3];
            out[13] = a[7];
            out[14] = a[11];
            out[15] = a[15];
        }
        return out;
    }
    exports.transpose = transpose;
    /**
     * Inverts a mat4
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the source matrix
     * @returns {mat4} out
     */
    function invert(out, a) {
        var a00 = a[0], a01 = a[1], a02 = a[2], a03 = a[3];
        var a10 = a[4], a11 = a[5], a12 = a[6], a13 = a[7];
        var a20 = a[8], a21 = a[9], a22 = a[10], a23 = a[11];
        var a30 = a[12], a31 = a[13], a32 = a[14], a33 = a[15];
        var b00 = a00 * a11 - a01 * a10;
        var b01 = a00 * a12 - a02 * a10;
        var b02 = a00 * a13 - a03 * a10;
        var b03 = a01 * a12 - a02 * a11;
        var b04 = a01 * a13 - a03 * a11;
        var b05 = a02 * a13 - a03 * a12;
        var b06 = a20 * a31 - a21 * a30;
        var b07 = a20 * a32 - a22 * a30;
        var b08 = a20 * a33 - a23 * a30;
        var b09 = a21 * a32 - a22 * a31;
        var b10 = a21 * a33 - a23 * a31;
        var b11 = a22 * a33 - a23 * a32; // Calculate the determinant
        var det = b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;
        if (!det) {
            return null;
        }
        det = 1.0 / det;
        out[0] = (a11 * b11 - a12 * b10 + a13 * b09) * det;
        out[1] = (a02 * b10 - a01 * b11 - a03 * b09) * det;
        out[2] = (a31 * b05 - a32 * b04 + a33 * b03) * det;
        out[3] = (a22 * b04 - a21 * b05 - a23 * b03) * det;
        out[4] = (a12 * b08 - a10 * b11 - a13 * b07) * det;
        out[5] = (a00 * b11 - a02 * b08 + a03 * b07) * det;
        out[6] = (a32 * b02 - a30 * b05 - a33 * b01) * det;
        out[7] = (a20 * b05 - a22 * b02 + a23 * b01) * det;
        out[8] = (a10 * b10 - a11 * b08 + a13 * b06) * det;
        out[9] = (a01 * b08 - a00 * b10 - a03 * b06) * det;
        out[10] = (a30 * b04 - a31 * b02 + a33 * b00) * det;
        out[11] = (a21 * b02 - a20 * b04 - a23 * b00) * det;
        out[12] = (a11 * b07 - a10 * b09 - a12 * b06) * det;
        out[13] = (a00 * b09 - a01 * b07 + a02 * b06) * det;
        out[14] = (a31 * b01 - a30 * b03 - a32 * b00) * det;
        out[15] = (a20 * b03 - a21 * b01 + a22 * b00) * det;
        return out;
    }
    exports.invert = invert;
    /**
     * Calculates the adjugate of a mat4
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the source matrix
     * @returns {mat4} out
     */
    function adjoint(out, a) {
        var a00 = a[0], a01 = a[1], a02 = a[2], a03 = a[3];
        var a10 = a[4], a11 = a[5], a12 = a[6], a13 = a[7];
        var a20 = a[8], a21 = a[9], a22 = a[10], a23 = a[11];
        var a30 = a[12], a31 = a[13], a32 = a[14], a33 = a[15];
        out[0] = a11 * (a22 * a33 - a23 * a32) - a21 * (a12 * a33 - a13 * a32) + a31 * (a12 * a23 - a13 * a22);
        out[1] = -(a01 * (a22 * a33 - a23 * a32) - a21 * (a02 * a33 - a03 * a32) + a31 * (a02 * a23 - a03 * a22));
        out[2] = a01 * (a12 * a33 - a13 * a32) - a11 * (a02 * a33 - a03 * a32) + a31 * (a02 * a13 - a03 * a12);
        out[3] = -(a01 * (a12 * a23 - a13 * a22) - a11 * (a02 * a23 - a03 * a22) + a21 * (a02 * a13 - a03 * a12));
        out[4] = -(a10 * (a22 * a33 - a23 * a32) - a20 * (a12 * a33 - a13 * a32) + a30 * (a12 * a23 - a13 * a22));
        out[5] = a00 * (a22 * a33 - a23 * a32) - a20 * (a02 * a33 - a03 * a32) + a30 * (a02 * a23 - a03 * a22);
        out[6] = -(a00 * (a12 * a33 - a13 * a32) - a10 * (a02 * a33 - a03 * a32) + a30 * (a02 * a13 - a03 * a12));
        out[7] = a00 * (a12 * a23 - a13 * a22) - a10 * (a02 * a23 - a03 * a22) + a20 * (a02 * a13 - a03 * a12);
        out[8] = a10 * (a21 * a33 - a23 * a31) - a20 * (a11 * a33 - a13 * a31) + a30 * (a11 * a23 - a13 * a21);
        out[9] = -(a00 * (a21 * a33 - a23 * a31) - a20 * (a01 * a33 - a03 * a31) + a30 * (a01 * a23 - a03 * a21));
        out[10] = a00 * (a11 * a33 - a13 * a31) - a10 * (a01 * a33 - a03 * a31) + a30 * (a01 * a13 - a03 * a11);
        out[11] = -(a00 * (a11 * a23 - a13 * a21) - a10 * (a01 * a23 - a03 * a21) + a20 * (a01 * a13 - a03 * a11));
        out[12] = -(a10 * (a21 * a32 - a22 * a31) - a20 * (a11 * a32 - a12 * a31) + a30 * (a11 * a22 - a12 * a21));
        out[13] = a00 * (a21 * a32 - a22 * a31) - a20 * (a01 * a32 - a02 * a31) + a30 * (a01 * a22 - a02 * a21);
        out[14] = -(a00 * (a11 * a32 - a12 * a31) - a10 * (a01 * a32 - a02 * a31) + a30 * (a01 * a12 - a02 * a11));
        out[15] = a00 * (a11 * a22 - a12 * a21) - a10 * (a01 * a22 - a02 * a21) + a20 * (a01 * a12 - a02 * a11);
        return out;
    }
    exports.adjoint = adjoint;
    /**
     * Calculates the determinant of a mat4
     *
     * @param {mat4} a the source matrix
     * @returns {Number} determinant of a
     */
    function determinant(a) {
        var a00 = a[0], a01 = a[1], a02 = a[2], a03 = a[3];
        var a10 = a[4], a11 = a[5], a12 = a[6], a13 = a[7];
        var a20 = a[8], a21 = a[9], a22 = a[10], a23 = a[11];
        var a30 = a[12], a31 = a[13], a32 = a[14], a33 = a[15];
        var b00 = a00 * a11 - a01 * a10;
        var b01 = a00 * a12 - a02 * a10;
        var b02 = a00 * a13 - a03 * a10;
        var b03 = a01 * a12 - a02 * a11;
        var b04 = a01 * a13 - a03 * a11;
        var b05 = a02 * a13 - a03 * a12;
        var b06 = a20 * a31 - a21 * a30;
        var b07 = a20 * a32 - a22 * a30;
        var b08 = a20 * a33 - a23 * a30;
        var b09 = a21 * a32 - a22 * a31;
        var b10 = a21 * a33 - a23 * a31;
        var b11 = a22 * a33 - a23 * a32; // Calculate the determinant
        return b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;
    }
    exports.determinant = determinant;
    /**
     * Multiplies two mat4s
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the first operand
     * @param {mat4} b the second operand
     * @returns {mat4} out
     */
    function multiply(out, a, b) {
        var a00 = a[0], a01 = a[1], a02 = a[2], a03 = a[3];
        var a10 = a[4], a11 = a[5], a12 = a[6], a13 = a[7];
        var a20 = a[8], a21 = a[9], a22 = a[10], a23 = a[11];
        var a30 = a[12], a31 = a[13], a32 = a[14], a33 = a[15]; // Cache only the current line of the second matrix
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3];
        out[0] = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30;
        out[1] = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31;
        out[2] = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32;
        out[3] = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33;
        b0 = b[4];
        b1 = b[5];
        b2 = b[6];
        b3 = b[7];
        out[4] = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30;
        out[5] = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31;
        out[6] = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32;
        out[7] = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33;
        b0 = b[8];
        b1 = b[9];
        b2 = b[10];
        b3 = b[11];
        out[8] = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30;
        out[9] = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31;
        out[10] = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32;
        out[11] = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33;
        b0 = b[12];
        b1 = b[13];
        b2 = b[14];
        b3 = b[15];
        out[12] = b0 * a00 + b1 * a10 + b2 * a20 + b3 * a30;
        out[13] = b0 * a01 + b1 * a11 + b2 * a21 + b3 * a31;
        out[14] = b0 * a02 + b1 * a12 + b2 * a22 + b3 * a32;
        out[15] = b0 * a03 + b1 * a13 + b2 * a23 + b3 * a33;
        return out;
    }
    exports.multiply = multiply;
    /**
     * Translate a mat4 by the given vector
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the matrix to translate
     * @param {vec3} v vector to translate by
     * @returns {mat4} out
     */
    function translate(out, a, v) {
        var x = v[0], y = v[1], z = v[2];
        var a00, a01, a02, a03;
        var a10, a11, a12, a13;
        var a20, a21, a22, a23;
        if (a === out) {
            out[12] = a[0] * x + a[4] * y + a[8] * z + a[12];
            out[13] = a[1] * x + a[5] * y + a[9] * z + a[13];
            out[14] = a[2] * x + a[6] * y + a[10] * z + a[14];
            out[15] = a[3] * x + a[7] * y + a[11] * z + a[15];
        }
        else {
            a00 = a[0];
            a01 = a[1];
            a02 = a[2];
            a03 = a[3];
            a10 = a[4];
            a11 = a[5];
            a12 = a[6];
            a13 = a[7];
            a20 = a[8];
            a21 = a[9];
            a22 = a[10];
            a23 = a[11];
            out[0] = a00;
            out[1] = a01;
            out[2] = a02;
            out[3] = a03;
            out[4] = a10;
            out[5] = a11;
            out[6] = a12;
            out[7] = a13;
            out[8] = a20;
            out[9] = a21;
            out[10] = a22;
            out[11] = a23;
            out[12] = a00 * x + a10 * y + a20 * z + a[12];
            out[13] = a01 * x + a11 * y + a21 * z + a[13];
            out[14] = a02 * x + a12 * y + a22 * z + a[14];
            out[15] = a03 * x + a13 * y + a23 * z + a[15];
        }
        return out;
    }
    exports.translate = translate;
    /**
     * Scales the mat4 by the dimensions in the given vec3 not using vectorization
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the matrix to scale
     * @param {vec3} v the vec3 to scale the matrix by
     * @returns {mat4} out
     **/
    function scale(out, a, v) {
        var x = v[0], y = v[1], z = v[2];
        out[0] = a[0] * x;
        out[1] = a[1] * x;
        out[2] = a[2] * x;
        out[3] = a[3] * x;
        out[4] = a[4] * y;
        out[5] = a[5] * y;
        out[6] = a[6] * y;
        out[7] = a[7] * y;
        out[8] = a[8] * z;
        out[9] = a[9] * z;
        out[10] = a[10] * z;
        out[11] = a[11] * z;
        out[12] = a[12];
        out[13] = a[13];
        out[14] = a[14];
        out[15] = a[15];
        return out;
    }
    exports.scale = scale;
    /**
     * Rotates a mat4 by the given angle around the given axis
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the matrix to rotate
     * @param {Number} rad the angle to rotate the matrix by
     * @param {vec3} axis the axis to rotate around
     * @returns {mat4} out
     */
    function rotate(out, a, rad, axis) {
        var x = axis[0], y = axis[1], z = axis[2];
        var len = Math.hypot(x, y, z);
        var s, c, t;
        var a00, a01, a02, a03;
        var a10, a11, a12, a13;
        var a20, a21, a22, a23;
        var b00, b01, b02;
        var b10, b11, b12;
        var b20, b21, b22;
        if (len < glMatrix.EPSILON) {
            return null;
        }
        len = 1 / len;
        x *= len;
        y *= len;
        z *= len;
        s = Math.sin(rad);
        c = Math.cos(rad);
        t = 1 - c;
        a00 = a[0];
        a01 = a[1];
        a02 = a[2];
        a03 = a[3];
        a10 = a[4];
        a11 = a[5];
        a12 = a[6];
        a13 = a[7];
        a20 = a[8];
        a21 = a[9];
        a22 = a[10];
        a23 = a[11]; // Construct the elements of the rotation matrix
        b00 = x * x * t + c;
        b01 = y * x * t + z * s;
        b02 = z * x * t - y * s;
        b10 = x * y * t - z * s;
        b11 = y * y * t + c;
        b12 = z * y * t + x * s;
        b20 = x * z * t + y * s;
        b21 = y * z * t - x * s;
        b22 = z * z * t + c; // Perform rotation-specific matrix multiplication
        out[0] = a00 * b00 + a10 * b01 + a20 * b02;
        out[1] = a01 * b00 + a11 * b01 + a21 * b02;
        out[2] = a02 * b00 + a12 * b01 + a22 * b02;
        out[3] = a03 * b00 + a13 * b01 + a23 * b02;
        out[4] = a00 * b10 + a10 * b11 + a20 * b12;
        out[5] = a01 * b10 + a11 * b11 + a21 * b12;
        out[6] = a02 * b10 + a12 * b11 + a22 * b12;
        out[7] = a03 * b10 + a13 * b11 + a23 * b12;
        out[8] = a00 * b20 + a10 * b21 + a20 * b22;
        out[9] = a01 * b20 + a11 * b21 + a21 * b22;
        out[10] = a02 * b20 + a12 * b21 + a22 * b22;
        out[11] = a03 * b20 + a13 * b21 + a23 * b22;
        if (a !== out) {
            // If the source and destination differ, copy the unchanged last row
            out[12] = a[12];
            out[13] = a[13];
            out[14] = a[14];
            out[15] = a[15];
        }
        return out;
    }
    exports.rotate = rotate;
    /**
     * Rotates a matrix by the given angle around the X axis
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the matrix to rotate
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat4} out
     */
    function rotateX(out, a, rad) {
        var s = Math.sin(rad);
        var c = Math.cos(rad);
        var a10 = a[4];
        var a11 = a[5];
        var a12 = a[6];
        var a13 = a[7];
        var a20 = a[8];
        var a21 = a[9];
        var a22 = a[10];
        var a23 = a[11];
        if (a !== out) {
            // If the source and destination differ, copy the unchanged rows
            out[0] = a[0];
            out[1] = a[1];
            out[2] = a[2];
            out[3] = a[3];
            out[12] = a[12];
            out[13] = a[13];
            out[14] = a[14];
            out[15] = a[15];
        } // Perform axis-specific matrix multiplication
        out[4] = a10 * c + a20 * s;
        out[5] = a11 * c + a21 * s;
        out[6] = a12 * c + a22 * s;
        out[7] = a13 * c + a23 * s;
        out[8] = a20 * c - a10 * s;
        out[9] = a21 * c - a11 * s;
        out[10] = a22 * c - a12 * s;
        out[11] = a23 * c - a13 * s;
        return out;
    }
    exports.rotateX = rotateX;
    /**
     * Rotates a matrix by the given angle around the Y axis
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the matrix to rotate
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat4} out
     */
    function rotateY(out, a, rad) {
        var s = Math.sin(rad);
        var c = Math.cos(rad);
        var a00 = a[0];
        var a01 = a[1];
        var a02 = a[2];
        var a03 = a[3];
        var a20 = a[8];
        var a21 = a[9];
        var a22 = a[10];
        var a23 = a[11];
        if (a !== out) {
            // If the source and destination differ, copy the unchanged rows
            out[4] = a[4];
            out[5] = a[5];
            out[6] = a[6];
            out[7] = a[7];
            out[12] = a[12];
            out[13] = a[13];
            out[14] = a[14];
            out[15] = a[15];
        } // Perform axis-specific matrix multiplication
        out[0] = a00 * c - a20 * s;
        out[1] = a01 * c - a21 * s;
        out[2] = a02 * c - a22 * s;
        out[3] = a03 * c - a23 * s;
        out[8] = a00 * s + a20 * c;
        out[9] = a01 * s + a21 * c;
        out[10] = a02 * s + a22 * c;
        out[11] = a03 * s + a23 * c;
        return out;
    }
    exports.rotateY = rotateY;
    /**
     * Rotates a matrix by the given angle around the Z axis
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the matrix to rotate
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat4} out
     */
    function rotateZ(out, a, rad) {
        var s = Math.sin(rad);
        var c = Math.cos(rad);
        var a00 = a[0];
        var a01 = a[1];
        var a02 = a[2];
        var a03 = a[3];
        var a10 = a[4];
        var a11 = a[5];
        var a12 = a[6];
        var a13 = a[7];
        if (a !== out) {
            // If the source and destination differ, copy the unchanged last row
            out[8] = a[8];
            out[9] = a[9];
            out[10] = a[10];
            out[11] = a[11];
            out[12] = a[12];
            out[13] = a[13];
            out[14] = a[14];
            out[15] = a[15];
        } // Perform axis-specific matrix multiplication
        out[0] = a00 * c + a10 * s;
        out[1] = a01 * c + a11 * s;
        out[2] = a02 * c + a12 * s;
        out[3] = a03 * c + a13 * s;
        out[4] = a10 * c - a00 * s;
        out[5] = a11 * c - a01 * s;
        out[6] = a12 * c - a02 * s;
        out[7] = a13 * c - a03 * s;
        return out;
    }
    exports.rotateZ = rotateZ;
    /**
     * Creates a matrix from a vector translation
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.translate(dest, dest, vec);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {vec3} v Translation vector
     * @returns {mat4} out
     */
    function fromTranslation(out, v) {
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 0;
        out[5] = 1;
        out[6] = 0;
        out[7] = 0;
        out[8] = 0;
        out[9] = 0;
        out[10] = 1;
        out[11] = 0;
        out[12] = v[0];
        out[13] = v[1];
        out[14] = v[2];
        out[15] = 1;
        return out;
    }
    exports.fromTranslation = fromTranslation;
    /**
     * Creates a matrix from a vector scaling
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.scale(dest, dest, vec);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {vec3} v Scaling vector
     * @returns {mat4} out
     */
    function fromScaling(out, v) {
        out[0] = v[0];
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 0;
        out[5] = v[1];
        out[6] = 0;
        out[7] = 0;
        out[8] = 0;
        out[9] = 0;
        out[10] = v[2];
        out[11] = 0;
        out[12] = 0;
        out[13] = 0;
        out[14] = 0;
        out[15] = 1;
        return out;
    }
    exports.fromScaling = fromScaling;
    /**
     * Creates a matrix from a given angle around a given axis
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.rotate(dest, dest, rad, axis);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {Number} rad the angle to rotate the matrix by
     * @param {vec3} axis the axis to rotate around
     * @returns {mat4} out
     */
    function fromRotation(out, rad, axis) {
        var x = axis[0], y = axis[1], z = axis[2];
        var len = Math.hypot(x, y, z);
        var s, c, t;
        if (len < glMatrix.EPSILON) {
            return null;
        }
        len = 1 / len;
        x *= len;
        y *= len;
        z *= len;
        s = Math.sin(rad);
        c = Math.cos(rad);
        t = 1 - c; // Perform rotation-specific matrix multiplication
        out[0] = x * x * t + c;
        out[1] = y * x * t + z * s;
        out[2] = z * x * t - y * s;
        out[3] = 0;
        out[4] = x * y * t - z * s;
        out[5] = y * y * t + c;
        out[6] = z * y * t + x * s;
        out[7] = 0;
        out[8] = x * z * t + y * s;
        out[9] = y * z * t - x * s;
        out[10] = z * z * t + c;
        out[11] = 0;
        out[12] = 0;
        out[13] = 0;
        out[14] = 0;
        out[15] = 1;
        return out;
    }
    exports.fromRotation = fromRotation;
    /**
     * Creates a matrix from the given angle around the X axis
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.rotateX(dest, dest, rad);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat4} out
     */
    function fromXRotation(out, rad) {
        var s = Math.sin(rad);
        var c = Math.cos(rad); // Perform axis-specific matrix multiplication
        out[0] = 1;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 0;
        out[5] = c;
        out[6] = s;
        out[7] = 0;
        out[8] = 0;
        out[9] = -s;
        out[10] = c;
        out[11] = 0;
        out[12] = 0;
        out[13] = 0;
        out[14] = 0;
        out[15] = 1;
        return out;
    }
    exports.fromXRotation = fromXRotation;
    /**
     * Creates a matrix from the given angle around the Y axis
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.rotateY(dest, dest, rad);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat4} out
     */
    function fromYRotation(out, rad) {
        var s = Math.sin(rad);
        var c = Math.cos(rad); // Perform axis-specific matrix multiplication
        out[0] = c;
        out[1] = 0;
        out[2] = -s;
        out[3] = 0;
        out[4] = 0;
        out[5] = 1;
        out[6] = 0;
        out[7] = 0;
        out[8] = s;
        out[9] = 0;
        out[10] = c;
        out[11] = 0;
        out[12] = 0;
        out[13] = 0;
        out[14] = 0;
        out[15] = 1;
        return out;
    }
    exports.fromYRotation = fromYRotation;
    /**
     * Creates a matrix from the given angle around the Z axis
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.rotateZ(dest, dest, rad);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {Number} rad the angle to rotate the matrix by
     * @returns {mat4} out
     */
    function fromZRotation(out, rad) {
        var s = Math.sin(rad);
        var c = Math.cos(rad); // Perform axis-specific matrix multiplication
        out[0] = c;
        out[1] = s;
        out[2] = 0;
        out[3] = 0;
        out[4] = -s;
        out[5] = c;
        out[6] = 0;
        out[7] = 0;
        out[8] = 0;
        out[9] = 0;
        out[10] = 1;
        out[11] = 0;
        out[12] = 0;
        out[13] = 0;
        out[14] = 0;
        out[15] = 1;
        return out;
    }
    exports.fromZRotation = fromZRotation;
    /**
     * Creates a matrix from a quaternion rotation and vector translation
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.translate(dest, vec);
     *     let quatMat = mat4.create();
     *     quat4.toMat4(quat, quatMat);
     *     mat4.multiply(dest, quatMat);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {quat4} q Rotation quaternion
     * @param {vec3} v Translation vector
     * @returns {mat4} out
     */
    function fromRotationTranslation(out, q, v) {
        // Quaternion math
        var x = q[0], y = q[1], z = q[2], w = q[3];
        var x2 = x + x;
        var y2 = y + y;
        var z2 = z + z;
        var xx = x * x2;
        var xy = x * y2;
        var xz = x * z2;
        var yy = y * y2;
        var yz = y * z2;
        var zz = z * z2;
        var wx = w * x2;
        var wy = w * y2;
        var wz = w * z2;
        out[0] = 1 - (yy + zz);
        out[1] = xy + wz;
        out[2] = xz - wy;
        out[3] = 0;
        out[4] = xy - wz;
        out[5] = 1 - (xx + zz);
        out[6] = yz + wx;
        out[7] = 0;
        out[8] = xz + wy;
        out[9] = yz - wx;
        out[10] = 1 - (xx + yy);
        out[11] = 0;
        out[12] = v[0];
        out[13] = v[1];
        out[14] = v[2];
        out[15] = 1;
        return out;
    }
    exports.fromRotationTranslation = fromRotationTranslation;
    /**
     * Creates a new mat4 from a dual quat.
     *
     * @param {mat4} out Matrix
     * @param {quat2} a Dual Quaternion
     * @returns {mat4} mat4 receiving operation result
     */
    function fromQuat2(out, a) {
        var translation = new glMatrix.ARRAY_TYPE(3);
        var bx = -a[0], by = -a[1], bz = -a[2], bw = a[3], ax = a[4], ay = a[5], az = a[6], aw = a[7];
        var magnitude = bx * bx + by * by + bz * bz + bw * bw; //Only scale if it makes sense
        if (magnitude > 0) {
            translation[0] = (ax * bw + aw * bx + ay * bz - az * by) * 2 / magnitude;
            translation[1] = (ay * bw + aw * by + az * bx - ax * bz) * 2 / magnitude;
            translation[2] = (az * bw + aw * bz + ax * by - ay * bx) * 2 / magnitude;
        }
        else {
            translation[0] = (ax * bw + aw * bx + ay * bz - az * by) * 2;
            translation[1] = (ay * bw + aw * by + az * bx - ax * bz) * 2;
            translation[2] = (az * bw + aw * bz + ax * by - ay * bx) * 2;
        }
        fromRotationTranslation(out, a, translation);
        return out;
    }
    exports.fromQuat2 = fromQuat2;
    /**
     * Returns the translation vector component of a transformation
     *  matrix. If a matrix is built with fromRotationTranslation,
     *  the returned vector will be the same as the translation vector
     *  originally supplied.
     * @param  {vec3} out Vector to receive translation component
     * @param  {mat4} mat Matrix to be decomposed (input)
     * @return {vec3} out
     */
    function getTranslation(out, mat) {
        out[0] = mat[12];
        out[1] = mat[13];
        out[2] = mat[14];
        return out;
    }
    exports.getTranslation = getTranslation;
    /**
     * Returns the scaling factor component of a transformation
     *  matrix. If a matrix is built with fromRotationTranslationScale
     *  with a normalized Quaternion paramter, the returned vector will be
     *  the same as the scaling vector
     *  originally supplied.
     * @param  {vec3} out Vector to receive scaling factor component
     * @param  {mat4} mat Matrix to be decomposed (input)
     * @return {vec3} out
     */
    function getScaling(out, mat) {
        var m11 = mat[0];
        var m12 = mat[1];
        var m13 = mat[2];
        var m21 = mat[4];
        var m22 = mat[5];
        var m23 = mat[6];
        var m31 = mat[8];
        var m32 = mat[9];
        var m33 = mat[10];
        out[0] = Math.hypot(m11, m12, m13);
        out[1] = Math.hypot(m21, m22, m23);
        out[2] = Math.hypot(m31, m32, m33);
        return out;
    }
    exports.getScaling = getScaling;
    /**
     * Returns a quaternion representing the rotational component
     *  of a transformation matrix. If a matrix is built with
     *  fromRotationTranslation, the returned quaternion will be the
     *  same as the quaternion originally supplied.
     * @param {quat} out Quaternion to receive the rotation component
     * @param {mat4} mat Matrix to be decomposed (input)
     * @return {quat} out
     */
    function getRotation(out, mat) {
        var scaling = new glMatrix.ARRAY_TYPE(3);
        getScaling(scaling, mat);
        var is1 = 1 / scaling[0];
        var is2 = 1 / scaling[1];
        var is3 = 1 / scaling[2];
        var sm11 = mat[0] * is1;
        var sm12 = mat[1] * is2;
        var sm13 = mat[2] * is3;
        var sm21 = mat[4] * is1;
        var sm22 = mat[5] * is2;
        var sm23 = mat[6] * is3;
        var sm31 = mat[8] * is1;
        var sm32 = mat[9] * is2;
        var sm33 = mat[10] * is3;
        var trace = sm11 + sm22 + sm33;
        var S = 0;
        if (trace > 0) {
            S = Math.sqrt(trace + 1.0) * 2;
            out[3] = 0.25 * S;
            out[0] = (sm23 - sm32) / S;
            out[1] = (sm31 - sm13) / S;
            out[2] = (sm12 - sm21) / S;
        }
        else if (sm11 > sm22 && sm11 > sm33) {
            S = Math.sqrt(1.0 + sm11 - sm22 - sm33) * 2;
            out[3] = (sm23 - sm32) / S;
            out[0] = 0.25 * S;
            out[1] = (sm12 + sm21) / S;
            out[2] = (sm31 + sm13) / S;
        }
        else if (sm22 > sm33) {
            S = Math.sqrt(1.0 + sm22 - sm11 - sm33) * 2;
            out[3] = (sm31 - sm13) / S;
            out[0] = (sm12 + sm21) / S;
            out[1] = 0.25 * S;
            out[2] = (sm23 + sm32) / S;
        }
        else {
            S = Math.sqrt(1.0 + sm33 - sm11 - sm22) * 2;
            out[3] = (sm12 - sm21) / S;
            out[0] = (sm31 + sm13) / S;
            out[1] = (sm23 + sm32) / S;
            out[2] = 0.25 * S;
        }
        return out;
    }
    exports.getRotation = getRotation;
    /**
     * Creates a matrix from a quaternion rotation, vector translation and vector scale
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.translate(dest, vec);
     *     let quatMat = mat4.create();
     *     quat4.toMat4(quat, quatMat);
     *     mat4.multiply(dest, quatMat);
     *     mat4.scale(dest, scale)
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {quat4} q Rotation quaternion
     * @param {vec3} v Translation vector
     * @param {vec3} s Scaling vector
     * @returns {mat4} out
     */
    function fromRotationTranslationScale(out, q, v, s) {
        // Quaternion math
        var x = q[0], y = q[1], z = q[2], w = q[3];
        var x2 = x + x;
        var y2 = y + y;
        var z2 = z + z;
        var xx = x * x2;
        var xy = x * y2;
        var xz = x * z2;
        var yy = y * y2;
        var yz = y * z2;
        var zz = z * z2;
        var wx = w * x2;
        var wy = w * y2;
        var wz = w * z2;
        var sx = s[0];
        var sy = s[1];
        var sz = s[2];
        out[0] = (1 - (yy + zz)) * sx;
        out[1] = (xy + wz) * sx;
        out[2] = (xz - wy) * sx;
        out[3] = 0;
        out[4] = (xy - wz) * sy;
        out[5] = (1 - (xx + zz)) * sy;
        out[6] = (yz + wx) * sy;
        out[7] = 0;
        out[8] = (xz + wy) * sz;
        out[9] = (yz - wx) * sz;
        out[10] = (1 - (xx + yy)) * sz;
        out[11] = 0;
        out[12] = v[0];
        out[13] = v[1];
        out[14] = v[2];
        out[15] = 1;
        return out;
    }
    exports.fromRotationTranslationScale = fromRotationTranslationScale;
    /**
     * Creates a matrix from a quaternion rotation, vector translation and vector scale, rotating and scaling around the given origin
     * This is equivalent to (but much faster than):
     *
     *     mat4.identity(dest);
     *     mat4.translate(dest, vec);
     *     mat4.translate(dest, origin);
     *     let quatMat = mat4.create();
     *     quat4.toMat4(quat, quatMat);
     *     mat4.multiply(dest, quatMat);
     *     mat4.scale(dest, scale)
     *     mat4.translate(dest, negativeOrigin);
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {quat4} q Rotation quaternion
     * @param {vec3} v Translation vector
     * @param {vec3} s Scaling vector
     * @param {vec3} o The origin vector around which to scale and rotate
     * @returns {mat4} out
     */
    function fromRotationTranslationScaleOrigin(out, q, v, s, o) {
        // Quaternion math
        var x = q[0], y = q[1], z = q[2], w = q[3];
        var x2 = x + x;
        var y2 = y + y;
        var z2 = z + z;
        var xx = x * x2;
        var xy = x * y2;
        var xz = x * z2;
        var yy = y * y2;
        var yz = y * z2;
        var zz = z * z2;
        var wx = w * x2;
        var wy = w * y2;
        var wz = w * z2;
        var sx = s[0];
        var sy = s[1];
        var sz = s[2];
        var ox = o[0];
        var oy = o[1];
        var oz = o[2];
        var out0 = (1 - (yy + zz)) * sx;
        var out1 = (xy + wz) * sx;
        var out2 = (xz - wy) * sx;
        var out4 = (xy - wz) * sy;
        var out5 = (1 - (xx + zz)) * sy;
        var out6 = (yz + wx) * sy;
        var out8 = (xz + wy) * sz;
        var out9 = (yz - wx) * sz;
        var out10 = (1 - (xx + yy)) * sz;
        out[0] = out0;
        out[1] = out1;
        out[2] = out2;
        out[3] = 0;
        out[4] = out4;
        out[5] = out5;
        out[6] = out6;
        out[7] = 0;
        out[8] = out8;
        out[9] = out9;
        out[10] = out10;
        out[11] = 0;
        out[12] = v[0] + ox - (out0 * ox + out4 * oy + out8 * oz);
        out[13] = v[1] + oy - (out1 * ox + out5 * oy + out9 * oz);
        out[14] = v[2] + oz - (out2 * ox + out6 * oy + out10 * oz);
        out[15] = 1;
        return out;
    }
    exports.fromRotationTranslationScaleOrigin = fromRotationTranslationScaleOrigin;
    /**
     * Calculates a 4x4 matrix from the given quaternion
     *
     * @param {mat4} out mat4 receiving operation result
     * @param {quat} q Quaternion to create matrix from
     *
     * @returns {mat4} out
     */
    function fromQuat(out, q) {
        var x = q[0], y = q[1], z = q[2], w = q[3];
        var x2 = x + x;
        var y2 = y + y;
        var z2 = z + z;
        var xx = x * x2;
        var yx = y * x2;
        var yy = y * y2;
        var zx = z * x2;
        var zy = z * y2;
        var zz = z * z2;
        var wx = w * x2;
        var wy = w * y2;
        var wz = w * z2;
        out[0] = 1 - yy - zz;
        out[1] = yx + wz;
        out[2] = zx - wy;
        out[3] = 0;
        out[4] = yx - wz;
        out[5] = 1 - xx - zz;
        out[6] = zy + wx;
        out[7] = 0;
        out[8] = zx + wy;
        out[9] = zy - wx;
        out[10] = 1 - xx - yy;
        out[11] = 0;
        out[12] = 0;
        out[13] = 0;
        out[14] = 0;
        out[15] = 1;
        return out;
    }
    exports.fromQuat = fromQuat;
    /**
     * Generates a frustum matrix with the given bounds
     *
     * @param {mat4} out mat4 frustum matrix will be written into
     * @param {Number} left Left bound of the frustum
     * @param {Number} right Right bound of the frustum
     * @param {Number} bottom Bottom bound of the frustum
     * @param {Number} top Top bound of the frustum
     * @param {Number} near Near bound of the frustum
     * @param {Number} far Far bound of the frustum
     * @returns {mat4} out
     */
    function frustum(out, left, right, bottom, top, near, far) {
        var rl = 1 / (right - left);
        var tb = 1 / (top - bottom);
        var nf = 1 / (near - far);
        out[0] = near * 2 * rl;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 0;
        out[5] = near * 2 * tb;
        out[6] = 0;
        out[7] = 0;
        out[8] = (right + left) * rl;
        out[9] = (top + bottom) * tb;
        out[10] = (far + near) * nf;
        out[11] = -1;
        out[12] = 0;
        out[13] = 0;
        out[14] = far * near * 2 * nf;
        out[15] = 0;
        return out;
    }
    exports.frustum = frustum;
    /**
     * Generates a perspective projection matrix with the given bounds.
     * Passing null/undefined/no value for far will generate infinite projection matrix.
     *
     * @param {mat4} out mat4 frustum matrix will be written into
     * @param {number} fovy Vertical field of view in radians
     * @param {number} aspect Aspect ratio. typically viewport width/height
     * @param {number} near Near bound of the frustum
     * @param {number} far Far bound of the frustum, can be null or Infinity
     * @returns {mat4} out
     */
    function perspective(out, fovy, aspect, near, far) {
        var f = 1.0 / Math.tan(fovy / 2), nf;
        out[0] = f / aspect;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 0;
        out[5] = f;
        out[6] = 0;
        out[7] = 0;
        out[8] = 0;
        out[9] = 0;
        out[11] = -1;
        out[12] = 0;
        out[13] = 0;
        out[15] = 0;
        if (far != null && far !== Infinity) {
            nf = 1 / (near - far);
            out[10] = (far + near) * nf;
            out[14] = 2 * far * near * nf;
        }
        else {
            out[10] = -1;
            out[14] = -2 * near;
        }
        return out;
    }
    exports.perspective = perspective;
    /**
     * Generates a perspective projection matrix with the given field of view.
     * This is primarily useful for generating projection matrices to be used
     * with the still experiemental WebVR API.
     *
     * @param {mat4} out mat4 frustum matrix will be written into
     * @param {Object} fov Object containing the following values: upDegrees, downDegrees, leftDegrees, rightDegrees
     * @param {number} near Near bound of the frustum
     * @param {number} far Far bound of the frustum
     * @returns {mat4} out
     */
    function perspectiveFromFieldOfView(out, fov, near, far) {
        var upTan = Math.tan(fov.upDegrees * Math.PI / 180.0);
        var downTan = Math.tan(fov.downDegrees * Math.PI / 180.0);
        var leftTan = Math.tan(fov.leftDegrees * Math.PI / 180.0);
        var rightTan = Math.tan(fov.rightDegrees * Math.PI / 180.0);
        var xScale = 2.0 / (leftTan + rightTan);
        var yScale = 2.0 / (upTan + downTan);
        out[0] = xScale;
        out[1] = 0.0;
        out[2] = 0.0;
        out[3] = 0.0;
        out[4] = 0.0;
        out[5] = yScale;
        out[6] = 0.0;
        out[7] = 0.0;
        out[8] = -((leftTan - rightTan) * xScale * 0.5);
        out[9] = (upTan - downTan) * yScale * 0.5;
        out[10] = far / (near - far);
        out[11] = -1.0;
        out[12] = 0.0;
        out[13] = 0.0;
        out[14] = far * near / (near - far);
        out[15] = 0.0;
        return out;
    }
    exports.perspectiveFromFieldOfView = perspectiveFromFieldOfView;
    /**
     * Generates a orthogonal projection matrix with the given bounds
     *
     * @param {mat4} out mat4 frustum matrix will be written into
     * @param {number} left Left bound of the frustum
     * @param {number} right Right bound of the frustum
     * @param {number} bottom Bottom bound of the frustum
     * @param {number} top Top bound of the frustum
     * @param {number} near Near bound of the frustum
     * @param {number} far Far bound of the frustum
     * @returns {mat4} out
     */
    function ortho(out, left, right, bottom, top, near, far) {
        var lr = 1 / (left - right);
        var bt = 1 / (bottom - top);
        var nf = 1 / (near - far);
        out[0] = -2 * lr;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        out[4] = 0;
        out[5] = -2 * bt;
        out[6] = 0;
        out[7] = 0;
        out[8] = 0;
        out[9] = 0;
        out[10] = 2 * nf;
        out[11] = 0;
        out[12] = (left + right) * lr;
        out[13] = (top + bottom) * bt;
        out[14] = (far + near) * nf;
        out[15] = 1;
        return out;
    }
    exports.ortho = ortho;
    /**
     * Generates a look-at matrix with the given eye position, focal point, and up axis.
     * If you want a matrix that actually makes an object look at another object, you should use targetTo instead.
     *
     * @param {mat4} out mat4 frustum matrix will be written into
     * @param {vec3} eye Position of the viewer
     * @param {vec3} center Point the viewer is looking at
     * @param {vec3} up vec3 pointing up
     * @returns {mat4} out
     */
    function lookAt(out, eye, center, up) {
        var x0, x1, x2, y0, y1, y2, z0, z1, z2, len;
        var eyex = eye[0];
        var eyey = eye[1];
        var eyez = eye[2];
        var upx = up[0];
        var upy = up[1];
        var upz = up[2];
        var centerx = center[0];
        var centery = center[1];
        var centerz = center[2];
        if (Math.abs(eyex - centerx) < glMatrix.EPSILON && Math.abs(eyey - centery) < glMatrix.EPSILON && Math.abs(eyez - centerz) < glMatrix.EPSILON) {
            return identity(out);
        }
        z0 = eyex - centerx;
        z1 = eyey - centery;
        z2 = eyez - centerz;
        len = 1 / Math.hypot(z0, z1, z2);
        z0 *= len;
        z1 *= len;
        z2 *= len;
        x0 = upy * z2 - upz * z1;
        x1 = upz * z0 - upx * z2;
        x2 = upx * z1 - upy * z0;
        len = Math.hypot(x0, x1, x2);
        if (!len) {
            x0 = 0;
            x1 = 0;
            x2 = 0;
        }
        else {
            len = 1 / len;
            x0 *= len;
            x1 *= len;
            x2 *= len;
        }
        y0 = z1 * x2 - z2 * x1;
        y1 = z2 * x0 - z0 * x2;
        y2 = z0 * x1 - z1 * x0;
        len = Math.hypot(y0, y1, y2);
        if (!len) {
            y0 = 0;
            y1 = 0;
            y2 = 0;
        }
        else {
            len = 1 / len;
            y0 *= len;
            y1 *= len;
            y2 *= len;
        }
        out[0] = x0;
        out[1] = y0;
        out[2] = z0;
        out[3] = 0;
        out[4] = x1;
        out[5] = y1;
        out[6] = z1;
        out[7] = 0;
        out[8] = x2;
        out[9] = y2;
        out[10] = z2;
        out[11] = 0;
        out[12] = -(x0 * eyex + x1 * eyey + x2 * eyez);
        out[13] = -(y0 * eyex + y1 * eyey + y2 * eyez);
        out[14] = -(z0 * eyex + z1 * eyey + z2 * eyez);
        out[15] = 1;
        return out;
    }
    exports.lookAt = lookAt;
    /**
     * Generates a matrix that makes something look at something else.
     *
     * @param {mat4} out mat4 frustum matrix will be written into
     * @param {vec3} eye Position of the viewer
     * @param {vec3} center Point the viewer is looking at
     * @param {vec3} up vec3 pointing up
     * @returns {mat4} out
     */
    function targetTo(out, eye, target, up) {
        var eyex = eye[0], eyey = eye[1], eyez = eye[2], upx = up[0], upy = up[1], upz = up[2];
        var z0 = eyex - target[0], z1 = eyey - target[1], z2 = eyez - target[2];
        var len = z0 * z0 + z1 * z1 + z2 * z2;
        if (len > 0) {
            len = 1 / Math.sqrt(len);
            z0 *= len;
            z1 *= len;
            z2 *= len;
        }
        var x0 = upy * z2 - upz * z1, x1 = upz * z0 - upx * z2, x2 = upx * z1 - upy * z0;
        len = x0 * x0 + x1 * x1 + x2 * x2;
        if (len > 0) {
            len = 1 / Math.sqrt(len);
            x0 *= len;
            x1 *= len;
            x2 *= len;
        }
        out[0] = x0;
        out[1] = x1;
        out[2] = x2;
        out[3] = 0;
        out[4] = z1 * x2 - z2 * x1;
        out[5] = z2 * x0 - z0 * x2;
        out[6] = z0 * x1 - z1 * x0;
        out[7] = 0;
        out[8] = z0;
        out[9] = z1;
        out[10] = z2;
        out[11] = 0;
        out[12] = eyex;
        out[13] = eyey;
        out[14] = eyez;
        out[15] = 1;
        return out;
    }
    exports.targetTo = targetTo;
    /**
     * Returns a string representation of a mat4
     *
     * @param {mat4} a matrix to represent as a string
     * @returns {String} string representation of the matrix
     */
    function str(a) {
        return "mat4(" + a[0] + ", " + a[1] + ", " + a[2] + ", " + a[3] + ", " + a[4] + ", " + a[5] + ", " + a[6] + ", " + a[7] + ", " + a[8] + ", " + a[9] + ", " + a[10] + ", " + a[11] + ", " + a[12] + ", " + a[13] + ", " + a[14] + ", " + a[15] + ")";
    }
    exports.str = str;
    /**
     * Returns Frobenius norm of a mat4
     *
     * @param {mat4} a the matrix to calculate Frobenius norm of
     * @returns {Number} Frobenius norm
     */
    function frob(a) {
        return Math.hypot(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]);
    }
    exports.frob = frob;
    /**
     * Adds two mat4's
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the first operand
     * @param {mat4} b the second operand
     * @returns {mat4} out
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        out[2] = a[2] + b[2];
        out[3] = a[3] + b[3];
        out[4] = a[4] + b[4];
        out[5] = a[5] + b[5];
        out[6] = a[6] + b[6];
        out[7] = a[7] + b[7];
        out[8] = a[8] + b[8];
        out[9] = a[9] + b[9];
        out[10] = a[10] + b[10];
        out[11] = a[11] + b[11];
        out[12] = a[12] + b[12];
        out[13] = a[13] + b[13];
        out[14] = a[14] + b[14];
        out[15] = a[15] + b[15];
        return out;
    }
    exports.add = add;
    /**
     * Subtracts matrix b from matrix a
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the first operand
     * @param {mat4} b the second operand
     * @returns {mat4} out
     */
    function subtract(out, a, b) {
        out[0] = a[0] - b[0];
        out[1] = a[1] - b[1];
        out[2] = a[2] - b[2];
        out[3] = a[3] - b[3];
        out[4] = a[4] - b[4];
        out[5] = a[5] - b[5];
        out[6] = a[6] - b[6];
        out[7] = a[7] - b[7];
        out[8] = a[8] - b[8];
        out[9] = a[9] - b[9];
        out[10] = a[10] - b[10];
        out[11] = a[11] - b[11];
        out[12] = a[12] - b[12];
        out[13] = a[13] - b[13];
        out[14] = a[14] - b[14];
        out[15] = a[15] - b[15];
        return out;
    }
    exports.subtract = subtract;
    /**
     * Multiply each element of the matrix by a scalar.
     *
     * @param {mat4} out the receiving matrix
     * @param {mat4} a the matrix to scale
     * @param {Number} b amount to scale the matrix's elements by
     * @returns {mat4} out
     */
    function multiplyScalar(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        out[2] = a[2] * b;
        out[3] = a[3] * b;
        out[4] = a[4] * b;
        out[5] = a[5] * b;
        out[6] = a[6] * b;
        out[7] = a[7] * b;
        out[8] = a[8] * b;
        out[9] = a[9] * b;
        out[10] = a[10] * b;
        out[11] = a[11] * b;
        out[12] = a[12] * b;
        out[13] = a[13] * b;
        out[14] = a[14] * b;
        out[15] = a[15] * b;
        return out;
    }
    exports.multiplyScalar = multiplyScalar;
    /**
     * Adds two mat4's after multiplying each element of the second operand by a scalar value.
     *
     * @param {mat4} out the receiving vector
     * @param {mat4} a the first operand
     * @param {mat4} b the second operand
     * @param {Number} scale the amount to scale b's elements by before adding
     * @returns {mat4} out
     */
    function multiplyScalarAndAdd(out, a, b, scale) {
        out[0] = a[0] + b[0] * scale;
        out[1] = a[1] + b[1] * scale;
        out[2] = a[2] + b[2] * scale;
        out[3] = a[3] + b[3] * scale;
        out[4] = a[4] + b[4] * scale;
        out[5] = a[5] + b[5] * scale;
        out[6] = a[6] + b[6] * scale;
        out[7] = a[7] + b[7] * scale;
        out[8] = a[8] + b[8] * scale;
        out[9] = a[9] + b[9] * scale;
        out[10] = a[10] + b[10] * scale;
        out[11] = a[11] + b[11] * scale;
        out[12] = a[12] + b[12] * scale;
        out[13] = a[13] + b[13] * scale;
        out[14] = a[14] + b[14] * scale;
        out[15] = a[15] + b[15] * scale;
        return out;
    }
    exports.multiplyScalarAndAdd = multiplyScalarAndAdd;
    /**
     * Returns whether or not the matrices have exactly the same elements in the same position (when compared with ===)
     *
     * @param {mat4} a The first matrix.
     * @param {mat4} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1] && a[2] === b[2] && a[3] === b[3] && a[4] === b[4] && a[5] === b[5] && a[6] === b[6] && a[7] === b[7] && a[8] === b[8] && a[9] === b[9] && a[10] === b[10] && a[11] === b[11] && a[12] === b[12] && a[13] === b[13] && a[14] === b[14] && a[15] === b[15];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the matrices have approximately the same elements in the same position.
     *
     * @param {mat4} a The first matrix.
     * @param {mat4} b The second matrix.
     * @returns {Boolean} True if the matrices are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3];
        var a4 = a[4], a5 = a[5], a6 = a[6], a7 = a[7];
        var a8 = a[8], a9 = a[9], a10 = a[10], a11 = a[11];
        var a12 = a[12], a13 = a[13], a14 = a[14], a15 = a[15];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3];
        var b4 = b[4], b5 = b[5], b6 = b[6], b7 = b[7];
        var b8 = b[8], b9 = b[9], b10 = b[10], b11 = b[11];
        var b12 = b[12], b13 = b[13], b14 = b[14], b15 = b[15];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1)) && Math.abs(a2 - b2) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a2), Math.abs(b2)) && Math.abs(a3 - b3) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a3), Math.abs(b3)) && Math.abs(a4 - b4) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a4), Math.abs(b4)) && Math.abs(a5 - b5) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a5), Math.abs(b5)) && Math.abs(a6 - b6) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a6), Math.abs(b6)) && Math.abs(a7 - b7) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a7), Math.abs(b7)) && Math.abs(a8 - b8) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a8), Math.abs(b8)) && Math.abs(a9 - b9) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a9), Math.abs(b9)) && Math.abs(a10 - b10) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a10), Math.abs(b10)) && Math.abs(a11 - b11) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a11), Math.abs(b11)) && Math.abs(a12 - b12) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a12), Math.abs(b12)) && Math.abs(a13 - b13) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a13), Math.abs(b13)) && Math.abs(a14 - b14) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a14), Math.abs(b14)) && Math.abs(a15 - b15) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a15), Math.abs(b15));
    }
    exports.equals = equals;
    /**
     * Alias for {@link mat4.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Alias for {@link mat4.subtract}
     * @function
     */
    exports.sub = subtract;
},
"eb06fc032a": /* gl-matrix/esm/quat.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    const mat3 = tslib_1.__importStar(require("0285c50a7e") /* ./mat3.js */);
    const vec3 = tslib_1.__importStar(require("2c5eb22089") /* ./vec3.js */);
    const vec4 = tslib_1.__importStar(require("c1aa33d719") /* ./vec4.js */);
    /**
     * Quaternion
     * @module quat
     */
    /**
     * Creates a new identity quat
     *
     * @returns {quat} a new quaternion
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(4);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[0] = 0;
            out[1] = 0;
            out[2] = 0;
        }
        out[3] = 1;
        return out;
    }
    exports.create = create;
    /**
     * Set a quat to the identity quaternion
     *
     * @param {quat} out the receiving quaternion
     * @returns {quat} out
     */
    function identity(out) {
        out[0] = 0;
        out[1] = 0;
        out[2] = 0;
        out[3] = 1;
        return out;
    }
    exports.identity = identity;
    /**
     * Sets a quat from the given angle and rotation axis,
     * then returns it.
     *
     * @param {quat} out the receiving quaternion
     * @param {vec3} axis the axis around which to rotate
     * @param {Number} rad the angle in radians
     * @returns {quat} out
     **/
    function setAxisAngle(out, axis, rad) {
        rad = rad * 0.5;
        var s = Math.sin(rad);
        out[0] = s * axis[0];
        out[1] = s * axis[1];
        out[2] = s * axis[2];
        out[3] = Math.cos(rad);
        return out;
    }
    exports.setAxisAngle = setAxisAngle;
    /**
     * Gets the rotation axis and angle for a given
     *  quaternion. If a quaternion is created with
     *  setAxisAngle, this method will return the same
     *  values as providied in the original parameter list
     *  OR functionally equivalent values.
     * Example: The quaternion formed by axis [0, 0, 1] and
     *  angle -90 is the same as the quaternion formed by
     *  [0, 0, 1] and 270. This method favors the latter.
     * @param  {vec3} out_axis  Vector receiving the axis of rotation
     * @param  {quat} q     Quaternion to be decomposed
     * @return {Number}     Angle, in radians, of the rotation
     */
    function getAxisAngle(out_axis, q) {
        var rad = Math.acos(q[3]) * 2.0;
        var s = Math.sin(rad / 2.0);
        if (s > glMatrix.EPSILON) {
            out_axis[0] = q[0] / s;
            out_axis[1] = q[1] / s;
            out_axis[2] = q[2] / s;
        }
        else {
            // If s is zero, return any axis (no rotation - axis does not matter)
            out_axis[0] = 1;
            out_axis[1] = 0;
            out_axis[2] = 0;
        }
        return rad;
    }
    exports.getAxisAngle = getAxisAngle;
    /**
     * Gets the angular distance between two unit quaternions
     *
     * @param  {quat} a     Origin unit quaternion
     * @param  {quat} b     Destination unit quaternion
     * @return {Number}     Angle, in radians, between the two quaternions
     */
    function getAngle(a, b) {
        var dotproduct = exports.dot(a, b);
        return Math.acos(2 * dotproduct * dotproduct - 1);
    }
    exports.getAngle = getAngle;
    /**
     * Multiplies two quat's
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a the first operand
     * @param {quat} b the second operand
     * @returns {quat} out
     */
    function multiply(out, a, b) {
        var ax = a[0], ay = a[1], az = a[2], aw = a[3];
        var bx = b[0], by = b[1], bz = b[2], bw = b[3];
        out[0] = ax * bw + aw * bx + ay * bz - az * by;
        out[1] = ay * bw + aw * by + az * bx - ax * bz;
        out[2] = az * bw + aw * bz + ax * by - ay * bx;
        out[3] = aw * bw - ax * bx - ay * by - az * bz;
        return out;
    }
    exports.multiply = multiply;
    /**
     * Rotates a quaternion by the given angle about the X axis
     *
     * @param {quat} out quat receiving operation result
     * @param {quat} a quat to rotate
     * @param {number} rad angle (in radians) to rotate
     * @returns {quat} out
     */
    function rotateX(out, a, rad) {
        rad *= 0.5;
        var ax = a[0], ay = a[1], az = a[2], aw = a[3];
        var bx = Math.sin(rad), bw = Math.cos(rad);
        out[0] = ax * bw + aw * bx;
        out[1] = ay * bw + az * bx;
        out[2] = az * bw - ay * bx;
        out[3] = aw * bw - ax * bx;
        return out;
    }
    exports.rotateX = rotateX;
    /**
     * Rotates a quaternion by the given angle about the Y axis
     *
     * @param {quat} out quat receiving operation result
     * @param {quat} a quat to rotate
     * @param {number} rad angle (in radians) to rotate
     * @returns {quat} out
     */
    function rotateY(out, a, rad) {
        rad *= 0.5;
        var ax = a[0], ay = a[1], az = a[2], aw = a[3];
        var by = Math.sin(rad), bw = Math.cos(rad);
        out[0] = ax * bw - az * by;
        out[1] = ay * bw + aw * by;
        out[2] = az * bw + ax * by;
        out[3] = aw * bw - ay * by;
        return out;
    }
    exports.rotateY = rotateY;
    /**
     * Rotates a quaternion by the given angle about the Z axis
     *
     * @param {quat} out quat receiving operation result
     * @param {quat} a quat to rotate
     * @param {number} rad angle (in radians) to rotate
     * @returns {quat} out
     */
    function rotateZ(out, a, rad) {
        rad *= 0.5;
        var ax = a[0], ay = a[1], az = a[2], aw = a[3];
        var bz = Math.sin(rad), bw = Math.cos(rad);
        out[0] = ax * bw + ay * bz;
        out[1] = ay * bw - ax * bz;
        out[2] = az * bw + aw * bz;
        out[3] = aw * bw - az * bz;
        return out;
    }
    exports.rotateZ = rotateZ;
    /**
     * Calculates the W component of a quat from the X, Y, and Z components.
     * Assumes that quaternion is 1 unit in length.
     * Any existing W component will be ignored.
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a quat to calculate W component of
     * @returns {quat} out
     */
    function calculateW(out, a) {
        var x = a[0], y = a[1], z = a[2];
        out[0] = x;
        out[1] = y;
        out[2] = z;
        out[3] = Math.sqrt(Math.abs(1.0 - x * x - y * y - z * z));
        return out;
    }
    exports.calculateW = calculateW;
    /**
     * Calculate the exponential of a unit quaternion.
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a quat to calculate the exponential of
     * @returns {quat} out
     */
    function exp(out, a) {
        var x = a[0], y = a[1], z = a[2], w = a[3];
        var r = Math.sqrt(x * x + y * y + z * z);
        var et = Math.exp(w);
        var s = r > 0 ? et * Math.sin(r) / r : 0;
        out[0] = x * s;
        out[1] = y * s;
        out[2] = z * s;
        out[3] = et * Math.cos(r);
        return out;
    }
    exports.exp = exp;
    /**
     * Calculate the natural logarithm of a unit quaternion.
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a quat to calculate the exponential of
     * @returns {quat} out
     */
    function ln(out, a) {
        var x = a[0], y = a[1], z = a[2], w = a[3];
        var r = Math.sqrt(x * x + y * y + z * z);
        var t = r > 0 ? Math.atan2(r, w) / r : 0;
        out[0] = x * t;
        out[1] = y * t;
        out[2] = z * t;
        out[3] = 0.5 * Math.log(x * x + y * y + z * z + w * w);
        return out;
    }
    exports.ln = ln;
    /**
     * Calculate the scalar power of a unit quaternion.
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a quat to calculate the exponential of
     * @param {Number} b amount to scale the quaternion by
     * @returns {quat} out
     */
    function pow(out, a, b) {
        ln(out, a);
        exports.scale(out, out, b);
        exp(out, out);
        return out;
    }
    exports.pow = pow;
    /**
     * Performs a spherical linear interpolation between two quat
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a the first operand
     * @param {quat} b the second operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {quat} out
     */
    function slerp(out, a, b, t) {
        // benchmarks:
        //    http://jsperf.com/quaternion-slerp-implementations
        var ax = a[0], ay = a[1], az = a[2], aw = a[3];
        var bx = b[0], by = b[1], bz = b[2], bw = b[3];
        var omega, cosom, sinom, scale0, scale1; // calc cosine
        cosom = ax * bx + ay * by + az * bz + aw * bw; // adjust signs (if necessary)
        if (cosom < 0.0) {
            cosom = -cosom;
            bx = -bx;
            by = -by;
            bz = -bz;
            bw = -bw;
        } // calculate coefficients
        if (1.0 - cosom > glMatrix.EPSILON) {
            // standard case (slerp)
            omega = Math.acos(cosom);
            sinom = Math.sin(omega);
            scale0 = Math.sin((1.0 - t) * omega) / sinom;
            scale1 = Math.sin(t * omega) / sinom;
        }
        else {
            // "from" and "to" quaternions are very close
            //  ... so we can do a linear interpolation
            scale0 = 1.0 - t;
            scale1 = t;
        } // calculate final values
        out[0] = scale0 * ax + scale1 * bx;
        out[1] = scale0 * ay + scale1 * by;
        out[2] = scale0 * az + scale1 * bz;
        out[3] = scale0 * aw + scale1 * bw;
        return out;
    }
    exports.slerp = slerp;
    /**
     * Generates a random unit quaternion
     *
     * @param {quat} out the receiving quaternion
     * @returns {quat} out
     */
    function random(out) {
        // Implementation of http://planning.cs.uiuc.edu/node198.html
        // TODO: Calling random 3 times is probably not the fastest solution
        var u1 = glMatrix.RANDOM();
        var u2 = glMatrix.RANDOM();
        var u3 = glMatrix.RANDOM();
        var sqrt1MinusU1 = Math.sqrt(1 - u1);
        var sqrtU1 = Math.sqrt(u1);
        out[0] = sqrt1MinusU1 * Math.sin(2.0 * Math.PI * u2);
        out[1] = sqrt1MinusU1 * Math.cos(2.0 * Math.PI * u2);
        out[2] = sqrtU1 * Math.sin(2.0 * Math.PI * u3);
        out[3] = sqrtU1 * Math.cos(2.0 * Math.PI * u3);
        return out;
    }
    exports.random = random;
    /**
     * Calculates the inverse of a quat
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a quat to calculate inverse of
     * @returns {quat} out
     */
    function invert(out, a) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3];
        var dot = a0 * a0 + a1 * a1 + a2 * a2 + a3 * a3;
        var invDot = dot ? 1.0 / dot : 0; // TODO: Would be faster to return [0,0,0,0] immediately if dot == 0
        out[0] = -a0 * invDot;
        out[1] = -a1 * invDot;
        out[2] = -a2 * invDot;
        out[3] = a3 * invDot;
        return out;
    }
    exports.invert = invert;
    /**
     * Calculates the conjugate of a quat
     * If the quaternion is normalized, this function is faster than quat.inverse and produces the same result.
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a quat to calculate conjugate of
     * @returns {quat} out
     */
    function conjugate(out, a) {
        out[0] = -a[0];
        out[1] = -a[1];
        out[2] = -a[2];
        out[3] = a[3];
        return out;
    }
    exports.conjugate = conjugate;
    /**
     * Creates a quaternion from the given 3x3 rotation matrix.
     *
     * NOTE: The resultant quaternion is not normalized, so you should be sure
     * to renormalize the quaternion yourself where necessary.
     *
     * @param {quat} out the receiving quaternion
     * @param {mat3} m rotation matrix
     * @returns {quat} out
     * @function
     */
    function fromMat3(out, m) {
        // Algorithm in Ken Shoemake's article in 1987 SIGGRAPH course notes
        // article "Quaternion Calculus and Fast Animation".
        var fTrace = m[0] + m[4] + m[8];
        var fRoot;
        if (fTrace > 0.0) {
            // |w| > 1/2, may as well choose w > 1/2
            fRoot = Math.sqrt(fTrace + 1.0); // 2w
            out[3] = 0.5 * fRoot;
            fRoot = 0.5 / fRoot; // 1/(4w)
            out[0] = (m[5] - m[7]) * fRoot;
            out[1] = (m[6] - m[2]) * fRoot;
            out[2] = (m[1] - m[3]) * fRoot;
        }
        else {
            // |w| <= 1/2
            var i = 0;
            if (m[4] > m[0])
                i = 1;
            if (m[8] > m[i * 3 + i])
                i = 2;
            var j = (i + 1) % 3;
            var k = (i + 2) % 3;
            fRoot = Math.sqrt(m[i * 3 + i] - m[j * 3 + j] - m[k * 3 + k] + 1.0);
            out[i] = 0.5 * fRoot;
            fRoot = 0.5 / fRoot;
            out[3] = (m[j * 3 + k] - m[k * 3 + j]) * fRoot;
            out[j] = (m[j * 3 + i] + m[i * 3 + j]) * fRoot;
            out[k] = (m[k * 3 + i] + m[i * 3 + k]) * fRoot;
        }
        return out;
    }
    exports.fromMat3 = fromMat3;
    /**
     * Creates a quaternion from the given euler angle x, y, z.
     *
     * @param {quat} out the receiving quaternion
     * @param {x} Angle to rotate around X axis in degrees.
     * @param {y} Angle to rotate around Y axis in degrees.
     * @param {z} Angle to rotate around Z axis in degrees.
     * @returns {quat} out
     * @function
     */
    function fromEuler(out, x, y, z) {
        var halfToRad = 0.5 * Math.PI / 180.0;
        x *= halfToRad;
        y *= halfToRad;
        z *= halfToRad;
        var sx = Math.sin(x);
        var cx = Math.cos(x);
        var sy = Math.sin(y);
        var cy = Math.cos(y);
        var sz = Math.sin(z);
        var cz = Math.cos(z);
        out[0] = sx * cy * cz - cx * sy * sz;
        out[1] = cx * sy * cz + sx * cy * sz;
        out[2] = cx * cy * sz - sx * sy * cz;
        out[3] = cx * cy * cz + sx * sy * sz;
        return out;
    }
    exports.fromEuler = fromEuler;
    /**
     * Returns a string representation of a quatenion
     *
     * @param {quat} a vector to represent as a string
     * @returns {String} string representation of the vector
     */
    function str(a) {
        return "quat(" + a[0] + ", " + a[1] + ", " + a[2] + ", " + a[3] + ")";
    }
    exports.str = str;
    /**
     * Creates a new quat initialized with values from an existing quaternion
     *
     * @param {quat} a quaternion to clone
     * @returns {quat} a new quaternion
     * @function
     */
    exports.clone = vec4.clone;
    /**
     * Creates a new quat initialized with the given values
     *
     * @param {Number} x X component
     * @param {Number} y Y component
     * @param {Number} z Z component
     * @param {Number} w W component
     * @returns {quat} a new quaternion
     * @function
     */
    exports.fromValues = vec4.fromValues;
    /**
     * Copy the values from one quat to another
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a the source quaternion
     * @returns {quat} out
     * @function
     */
    exports.copy = vec4.copy;
    /**
     * Set the components of a quat to the given values
     *
     * @param {quat} out the receiving quaternion
     * @param {Number} x X component
     * @param {Number} y Y component
     * @param {Number} z Z component
     * @param {Number} w W component
     * @returns {quat} out
     * @function
     */
    exports.set = vec4.set;
    /**
     * Adds two quat's
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a the first operand
     * @param {quat} b the second operand
     * @returns {quat} out
     * @function
     */
    exports.add = vec4.add;
    /**
     * Alias for {@link quat.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Scales a quat by a scalar number
     *
     * @param {quat} out the receiving vector
     * @param {quat} a the vector to scale
     * @param {Number} b amount to scale the vector by
     * @returns {quat} out
     * @function
     */
    exports.scale = vec4.scale;
    /**
     * Calculates the dot product of two quat's
     *
     * @param {quat} a the first operand
     * @param {quat} b the second operand
     * @returns {Number} dot product of a and b
     * @function
     */
    exports.dot = vec4.dot;
    /**
     * Performs a linear interpolation between two quat's
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a the first operand
     * @param {quat} b the second operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {quat} out
     * @function
     */
    exports.lerp = vec4.lerp;
    /**
     * Calculates the length of a quat
     *
     * @param {quat} a vector to calculate length of
     * @returns {Number} length of a
     */
    exports.length = vec4.length;
    /**
     * Alias for {@link quat.length}
     * @function
     */
    exports.len = exports.length;
    /**
     * Calculates the squared length of a quat
     *
     * @param {quat} a vector to calculate squared length of
     * @returns {Number} squared length of a
     * @function
     */
    exports.squaredLength = vec4.squaredLength;
    /**
     * Alias for {@link quat.squaredLength}
     * @function
     */
    exports.sqrLen = exports.squaredLength;
    /**
     * Normalize a quat
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a quaternion to normalize
     * @returns {quat} out
     * @function
     */
    exports.normalize = vec4.normalize;
    /**
     * Returns whether or not the quaternions have exactly the same elements in the same position (when compared with ===)
     *
     * @param {quat} a The first quaternion.
     * @param {quat} b The second quaternion.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    exports.exactEquals = vec4.exactEquals;
    /**
     * Returns whether or not the quaternions have approximately the same elements in the same position.
     *
     * @param {quat} a The first vector.
     * @param {quat} b The second vector.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    exports.equals = vec4.equals;
    /**
     * Sets a quaternion to represent the shortest rotation from one
     * vector to another.
     *
     * Both vectors are assumed to be unit length.
     *
     * @param {quat} out the receiving quaternion.
     * @param {vec3} a the initial vector
     * @param {vec3} b the destination vector
     * @returns {quat} out
     */
    exports.rotationTo = function () {
        var tmpvec3 = vec3.create();
        var xUnitVec3 = vec3.fromValues(1, 0, 0);
        var yUnitVec3 = vec3.fromValues(0, 1, 0);
        return function (out, a, b) {
            var dot = vec3.dot(a, b);
            if (dot < -0.999999) {
                vec3.cross(tmpvec3, xUnitVec3, a);
                if (vec3.len(tmpvec3) < 0.000001)
                    vec3.cross(tmpvec3, yUnitVec3, a);
                vec3.normalize(tmpvec3, tmpvec3);
                setAxisAngle(out, tmpvec3, Math.PI);
                return out;
            }
            else if (dot > 0.999999) {
                out[0] = 0;
                out[1] = 0;
                out[2] = 0;
                out[3] = 1;
                return out;
            }
            else {
                vec3.cross(tmpvec3, a, b);
                out[0] = tmpvec3[0];
                out[1] = tmpvec3[1];
                out[2] = tmpvec3[2];
                out[3] = 1 + dot;
                return exports.normalize(out, out);
            }
        };
    }();
    /**
     * Performs a spherical linear interpolation with two control points
     *
     * @param {quat} out the receiving quaternion
     * @param {quat} a the first operand
     * @param {quat} b the second operand
     * @param {quat} c the third operand
     * @param {quat} d the fourth operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {quat} out
     */
    exports.sqlerp = function () {
        var temp1 = create();
        var temp2 = create();
        return function (out, a, b, c, d, t) {
            slerp(temp1, a, d, t);
            slerp(temp2, b, c, t);
            slerp(out, temp1, temp2, 2 * t * (1 - t));
            return out;
        };
    }();
    /**
     * Sets the specified quaternion with values corresponding to the given
     * axes. Each axis is a vec3 and is expected to be unit length and
     * perpendicular to all other specified axes.
     *
     * @param {vec3} view  the vector representing the viewing direction
     * @param {vec3} right the vector representing the local "right" direction
     * @param {vec3} up    the vector representing the local "up" direction
     * @returns {quat} out
     */
    exports.setAxes = function () {
        var matr = mat3.create();
        return function (out, view, right, up) {
            matr[0] = right[0];
            matr[3] = right[1];
            matr[6] = right[2];
            matr[1] = up[0];
            matr[4] = up[1];
            matr[7] = up[2];
            matr[2] = -view[0];
            matr[5] = -view[1];
            matr[8] = -view[2];
            return exports.normalize(out, fromMat3(out, matr));
        };
    }();
},
"2c5eb22089": /* gl-matrix/esm/vec3.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    /**
     * 3 Dimensional Vector
     * @module vec3
     */
    /**
     * Creates a new, empty vec3
     *
     * @returns {vec3} a new 3D vector
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(3);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[0] = 0;
            out[1] = 0;
            out[2] = 0;
        }
        return out;
    }
    exports.create = create;
    /**
     * Creates a new vec3 initialized with values from an existing vector
     *
     * @param {vec3} a vector to clone
     * @returns {vec3} a new 3D vector
     */
    function clone(a) {
        var out = new glMatrix.ARRAY_TYPE(3);
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        return out;
    }
    exports.clone = clone;
    /**
     * Calculates the length of a vec3
     *
     * @param {vec3} a vector to calculate length of
     * @returns {Number} length of a
     */
    function length(a) {
        var x = a[0];
        var y = a[1];
        var z = a[2];
        return Math.hypot(x, y, z);
    }
    exports.length = length;
    /**
     * Creates a new vec3 initialized with the given values
     *
     * @param {Number} x X component
     * @param {Number} y Y component
     * @param {Number} z Z component
     * @returns {vec3} a new 3D vector
     */
    function fromValues(x, y, z) {
        var out = new glMatrix.ARRAY_TYPE(3);
        out[0] = x;
        out[1] = y;
        out[2] = z;
        return out;
    }
    exports.fromValues = fromValues;
    /**
     * Copy the values from one vec3 to another
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the source vector
     * @returns {vec3} out
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        return out;
    }
    exports.copy = copy;
    /**
     * Set the components of a vec3 to the given values
     *
     * @param {vec3} out the receiving vector
     * @param {Number} x X component
     * @param {Number} y Y component
     * @param {Number} z Z component
     * @returns {vec3} out
     */
    function set(out, x, y, z) {
        out[0] = x;
        out[1] = y;
        out[2] = z;
        return out;
    }
    exports.set = set;
    /**
     * Adds two vec3's
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {vec3} out
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        out[2] = a[2] + b[2];
        return out;
    }
    exports.add = add;
    /**
     * Subtracts vector b from vector a
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {vec3} out
     */
    function subtract(out, a, b) {
        out[0] = a[0] - b[0];
        out[1] = a[1] - b[1];
        out[2] = a[2] - b[2];
        return out;
    }
    exports.subtract = subtract;
    /**
     * Multiplies two vec3's
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {vec3} out
     */
    function multiply(out, a, b) {
        out[0] = a[0] * b[0];
        out[1] = a[1] * b[1];
        out[2] = a[2] * b[2];
        return out;
    }
    exports.multiply = multiply;
    /**
     * Divides two vec3's
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {vec3} out
     */
    function divide(out, a, b) {
        out[0] = a[0] / b[0];
        out[1] = a[1] / b[1];
        out[2] = a[2] / b[2];
        return out;
    }
    exports.divide = divide;
    /**
     * Math.ceil the components of a vec3
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a vector to ceil
     * @returns {vec3} out
     */
    function ceil(out, a) {
        out[0] = Math.ceil(a[0]);
        out[1] = Math.ceil(a[1]);
        out[2] = Math.ceil(a[2]);
        return out;
    }
    exports.ceil = ceil;
    /**
     * Math.floor the components of a vec3
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a vector to floor
     * @returns {vec3} out
     */
    function floor(out, a) {
        out[0] = Math.floor(a[0]);
        out[1] = Math.floor(a[1]);
        out[2] = Math.floor(a[2]);
        return out;
    }
    exports.floor = floor;
    /**
     * Returns the minimum of two vec3's
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {vec3} out
     */
    function min(out, a, b) {
        out[0] = Math.min(a[0], b[0]);
        out[1] = Math.min(a[1], b[1]);
        out[2] = Math.min(a[2], b[2]);
        return out;
    }
    exports.min = min;
    /**
     * Returns the maximum of two vec3's
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {vec3} out
     */
    function max(out, a, b) {
        out[0] = Math.max(a[0], b[0]);
        out[1] = Math.max(a[1], b[1]);
        out[2] = Math.max(a[2], b[2]);
        return out;
    }
    exports.max = max;
    /**
     * Math.round the components of a vec3
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a vector to round
     * @returns {vec3} out
     */
    function round(out, a) {
        out[0] = Math.round(a[0]);
        out[1] = Math.round(a[1]);
        out[2] = Math.round(a[2]);
        return out;
    }
    exports.round = round;
    /**
     * Scales a vec3 by a scalar number
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the vector to scale
     * @param {Number} b amount to scale the vector by
     * @returns {vec3} out
     */
    function scale(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        out[2] = a[2] * b;
        return out;
    }
    exports.scale = scale;
    /**
     * Adds two vec3's after scaling the second operand by a scalar value
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @param {Number} scale the amount to scale b by before adding
     * @returns {vec3} out
     */
    function scaleAndAdd(out, a, b, scale) {
        out[0] = a[0] + b[0] * scale;
        out[1] = a[1] + b[1] * scale;
        out[2] = a[2] + b[2] * scale;
        return out;
    }
    exports.scaleAndAdd = scaleAndAdd;
    /**
     * Calculates the euclidian distance between two vec3's
     *
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {Number} distance between a and b
     */
    function distance(a, b) {
        var x = b[0] - a[0];
        var y = b[1] - a[1];
        var z = b[2] - a[2];
        return Math.hypot(x, y, z);
    }
    exports.distance = distance;
    /**
     * Calculates the squared euclidian distance between two vec3's
     *
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {Number} squared distance between a and b
     */
    function squaredDistance(a, b) {
        var x = b[0] - a[0];
        var y = b[1] - a[1];
        var z = b[2] - a[2];
        return x * x + y * y + z * z;
    }
    exports.squaredDistance = squaredDistance;
    /**
     * Calculates the squared length of a vec3
     *
     * @param {vec3} a vector to calculate squared length of
     * @returns {Number} squared length of a
     */
    function squaredLength(a) {
        var x = a[0];
        var y = a[1];
        var z = a[2];
        return x * x + y * y + z * z;
    }
    exports.squaredLength = squaredLength;
    /**
     * Negates the components of a vec3
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a vector to negate
     * @returns {vec3} out
     */
    function negate(out, a) {
        out[0] = -a[0];
        out[1] = -a[1];
        out[2] = -a[2];
        return out;
    }
    exports.negate = negate;
    /**
     * Returns the inverse of the components of a vec3
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a vector to invert
     * @returns {vec3} out
     */
    function inverse(out, a) {
        out[0] = 1.0 / a[0];
        out[1] = 1.0 / a[1];
        out[2] = 1.0 / a[2];
        return out;
    }
    exports.inverse = inverse;
    /**
     * Normalize a vec3
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a vector to normalize
     * @returns {vec3} out
     */
    function normalize(out, a) {
        var x = a[0];
        var y = a[1];
        var z = a[2];
        var len = x * x + y * y + z * z;
        if (len > 0) {
            //TODO: evaluate use of glm_invsqrt here?
            len = 1 / Math.sqrt(len);
        }
        out[0] = a[0] * len;
        out[1] = a[1] * len;
        out[2] = a[2] * len;
        return out;
    }
    exports.normalize = normalize;
    /**
     * Calculates the dot product of two vec3's
     *
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {Number} dot product of a and b
     */
    function dot(a, b) {
        return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
    }
    exports.dot = dot;
    /**
     * Computes the cross product of two vec3's
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @returns {vec3} out
     */
    function cross(out, a, b) {
        var ax = a[0], ay = a[1], az = a[2];
        var bx = b[0], by = b[1], bz = b[2];
        out[0] = ay * bz - az * by;
        out[1] = az * bx - ax * bz;
        out[2] = ax * by - ay * bx;
        return out;
    }
    exports.cross = cross;
    /**
     * Performs a linear interpolation between two vec3's
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {vec3} out
     */
    function lerp(out, a, b, t) {
        var ax = a[0];
        var ay = a[1];
        var az = a[2];
        out[0] = ax + t * (b[0] - ax);
        out[1] = ay + t * (b[1] - ay);
        out[2] = az + t * (b[2] - az);
        return out;
    }
    exports.lerp = lerp;
    /**
     * Performs a hermite interpolation with two control points
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @param {vec3} c the third operand
     * @param {vec3} d the fourth operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {vec3} out
     */
    function hermite(out, a, b, c, d, t) {
        var factorTimes2 = t * t;
        var factor1 = factorTimes2 * (2 * t - 3) + 1;
        var factor2 = factorTimes2 * (t - 2) + t;
        var factor3 = factorTimes2 * (t - 1);
        var factor4 = factorTimes2 * (3 - 2 * t);
        out[0] = a[0] * factor1 + b[0] * factor2 + c[0] * factor3 + d[0] * factor4;
        out[1] = a[1] * factor1 + b[1] * factor2 + c[1] * factor3 + d[1] * factor4;
        out[2] = a[2] * factor1 + b[2] * factor2 + c[2] * factor3 + d[2] * factor4;
        return out;
    }
    exports.hermite = hermite;
    /**
     * Performs a bezier interpolation with two control points
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the first operand
     * @param {vec3} b the second operand
     * @param {vec3} c the third operand
     * @param {vec3} d the fourth operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {vec3} out
     */
    function bezier(out, a, b, c, d, t) {
        var inverseFactor = 1 - t;
        var inverseFactorTimesTwo = inverseFactor * inverseFactor;
        var factorTimes2 = t * t;
        var factor1 = inverseFactorTimesTwo * inverseFactor;
        var factor2 = 3 * t * inverseFactorTimesTwo;
        var factor3 = 3 * factorTimes2 * inverseFactor;
        var factor4 = factorTimes2 * t;
        out[0] = a[0] * factor1 + b[0] * factor2 + c[0] * factor3 + d[0] * factor4;
        out[1] = a[1] * factor1 + b[1] * factor2 + c[1] * factor3 + d[1] * factor4;
        out[2] = a[2] * factor1 + b[2] * factor2 + c[2] * factor3 + d[2] * factor4;
        return out;
    }
    exports.bezier = bezier;
    /**
     * Generates a random vector with the given scale
     *
     * @param {vec3} out the receiving vector
     * @param {Number} [scale] Length of the resulting vector. If ommitted, a unit vector will be returned
     * @returns {vec3} out
     */
    function random(out, scale) {
        scale = scale || 1.0;
        var r = glMatrix.RANDOM() * 2.0 * Math.PI;
        var z = glMatrix.RANDOM() * 2.0 - 1.0;
        var zScale = Math.sqrt(1.0 - z * z) * scale;
        out[0] = Math.cos(r) * zScale;
        out[1] = Math.sin(r) * zScale;
        out[2] = z * scale;
        return out;
    }
    exports.random = random;
    /**
     * Transforms the vec3 with a mat4.
     * 4th vector component is implicitly '1'
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the vector to transform
     * @param {mat4} m matrix to transform with
     * @returns {vec3} out
     */
    function transformMat4(out, a, m) {
        var x = a[0], y = a[1], z = a[2];
        var w = m[3] * x + m[7] * y + m[11] * z + m[15];
        w = w || 1.0;
        out[0] = (m[0] * x + m[4] * y + m[8] * z + m[12]) / w;
        out[1] = (m[1] * x + m[5] * y + m[9] * z + m[13]) / w;
        out[2] = (m[2] * x + m[6] * y + m[10] * z + m[14]) / w;
        return out;
    }
    exports.transformMat4 = transformMat4;
    /**
     * Transforms the vec3 with a mat3.
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the vector to transform
     * @param {mat3} m the 3x3 matrix to transform with
     * @returns {vec3} out
     */
    function transformMat3(out, a, m) {
        var x = a[0], y = a[1], z = a[2];
        out[0] = x * m[0] + y * m[3] + z * m[6];
        out[1] = x * m[1] + y * m[4] + z * m[7];
        out[2] = x * m[2] + y * m[5] + z * m[8];
        return out;
    }
    exports.transformMat3 = transformMat3;
    /**
     * Transforms the vec3 with a quat
     * Can also be used for dual quaternions. (Multiply it with the real part)
     *
     * @param {vec3} out the receiving vector
     * @param {vec3} a the vector to transform
     * @param {quat} q quaternion to transform with
     * @returns {vec3} out
     */
    function transformQuat(out, a, q) {
        // benchmarks: https://jsperf.com/quaternion-transform-vec3-implementations-fixed
        var qx = q[0], qy = q[1], qz = q[2], qw = q[3];
        var x = a[0], y = a[1], z = a[2]; // var qvec = [qx, qy, qz];
        // var uv = vec3.cross([], qvec, a);
        var uvx = qy * z - qz * y, uvy = qz * x - qx * z, uvz = qx * y - qy * x; // var uuv = vec3.cross([], qvec, uv);
        var uuvx = qy * uvz - qz * uvy, uuvy = qz * uvx - qx * uvz, uuvz = qx * uvy - qy * uvx; // vec3.scale(uv, uv, 2 * w);
        var w2 = qw * 2;
        uvx *= w2;
        uvy *= w2;
        uvz *= w2; // vec3.scale(uuv, uuv, 2);
        uuvx *= 2;
        uuvy *= 2;
        uuvz *= 2; // return vec3.add(out, a, vec3.add(out, uv, uuv));
        out[0] = x + uvx + uuvx;
        out[1] = y + uvy + uuvy;
        out[2] = z + uvz + uuvz;
        return out;
    }
    exports.transformQuat = transformQuat;
    /**
     * Rotate a 3D vector around the x-axis
     * @param {vec3} out The receiving vec3
     * @param {vec3} a The vec3 point to rotate
     * @param {vec3} b The origin of the rotation
     * @param {Number} rad The angle of rotation in radians
     * @returns {vec3} out
     */
    function rotateX(out, a, b, rad) {
        var p = [], r = []; //Translate point to the origin
        p[0] = a[0] - b[0];
        p[1] = a[1] - b[1];
        p[2] = a[2] - b[2]; //perform rotation
        r[0] = p[0];
        r[1] = p[1] * Math.cos(rad) - p[2] * Math.sin(rad);
        r[2] = p[1] * Math.sin(rad) + p[2] * Math.cos(rad); //translate to correct position
        out[0] = r[0] + b[0];
        out[1] = r[1] + b[1];
        out[2] = r[2] + b[2];
        return out;
    }
    exports.rotateX = rotateX;
    /**
     * Rotate a 3D vector around the y-axis
     * @param {vec3} out The receiving vec3
     * @param {vec3} a The vec3 point to rotate
     * @param {vec3} b The origin of the rotation
     * @param {Number} rad The angle of rotation in radians
     * @returns {vec3} out
     */
    function rotateY(out, a, b, rad) {
        var p = [], r = []; //Translate point to the origin
        p[0] = a[0] - b[0];
        p[1] = a[1] - b[1];
        p[2] = a[2] - b[2]; //perform rotation
        r[0] = p[2] * Math.sin(rad) + p[0] * Math.cos(rad);
        r[1] = p[1];
        r[2] = p[2] * Math.cos(rad) - p[0] * Math.sin(rad); //translate to correct position
        out[0] = r[0] + b[0];
        out[1] = r[1] + b[1];
        out[2] = r[2] + b[2];
        return out;
    }
    exports.rotateY = rotateY;
    /**
     * Rotate a 3D vector around the z-axis
     * @param {vec3} out The receiving vec3
     * @param {vec3} a The vec3 point to rotate
     * @param {vec3} b The origin of the rotation
     * @param {Number} rad The angle of rotation in radians
     * @returns {vec3} out
     */
    function rotateZ(out, a, b, rad) {
        var p = [], r = []; //Translate point to the origin
        p[0] = a[0] - b[0];
        p[1] = a[1] - b[1];
        p[2] = a[2] - b[2]; //perform rotation
        r[0] = p[0] * Math.cos(rad) - p[1] * Math.sin(rad);
        r[1] = p[0] * Math.sin(rad) + p[1] * Math.cos(rad);
        r[2] = p[2]; //translate to correct position
        out[0] = r[0] + b[0];
        out[1] = r[1] + b[1];
        out[2] = r[2] + b[2];
        return out;
    }
    exports.rotateZ = rotateZ;
    /**
     * Get the angle between two 3D vectors
     * @param {vec3} a The first operand
     * @param {vec3} b The second operand
     * @returns {Number} The angle in radians
     */
    function angle(a, b) {
        var ax = a[0], ay = a[1], az = a[2], bx = b[0], by = b[1], bz = b[2], mag1 = Math.sqrt(ax * ax + ay * ay + az * az), mag2 = Math.sqrt(bx * bx + by * by + bz * bz), mag = mag1 * mag2, cosine = mag && dot(a, b) / mag;
        return Math.acos(Math.min(Math.max(cosine, -1), 1));
    }
    exports.angle = angle;
    /**
     * Set the components of a vec3 to zero
     *
     * @param {vec3} out the receiving vector
     * @returns {vec3} out
     */
    function zero(out) {
        out[0] = 0.0;
        out[1] = 0.0;
        out[2] = 0.0;
        return out;
    }
    exports.zero = zero;
    /**
     * Returns a string representation of a vector
     *
     * @param {vec3} a vector to represent as a string
     * @returns {String} string representation of the vector
     */
    function str(a) {
        return "vec3(" + a[0] + ", " + a[1] + ", " + a[2] + ")";
    }
    exports.str = str;
    /**
     * Returns whether or not the vectors have exactly the same elements in the same position (when compared with ===)
     *
     * @param {vec3} a The first vector.
     * @param {vec3} b The second vector.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1] && a[2] === b[2];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the vectors have approximately the same elements in the same position.
     *
     * @param {vec3} a The first vector.
     * @param {vec3} b The second vector.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2];
        var b0 = b[0], b1 = b[1], b2 = b[2];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1)) && Math.abs(a2 - b2) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a2), Math.abs(b2));
    }
    exports.equals = equals;
    /**
     * Alias for {@link vec3.subtract}
     * @function
     */
    exports.sub = subtract;
    /**
     * Alias for {@link vec3.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Alias for {@link vec3.divide}
     * @function
     */
    exports.div = divide;
    /**
     * Alias for {@link vec3.distance}
     * @function
     */
    exports.dist = distance;
    /**
     * Alias for {@link vec3.squaredDistance}
     * @function
     */
    exports.sqrDist = squaredDistance;
    /**
     * Alias for {@link vec3.length}
     * @function
     */
    exports.len = length;
    /**
     * Alias for {@link vec3.squaredLength}
     * @function
     */
    exports.sqrLen = squaredLength;
    /**
     * Perform some operation over an array of vec3s.
     *
     * @param {Array} a the array of vectors to iterate over
     * @param {Number} stride Number of elements between the start of each vec3. If 0 assumes tightly packed
     * @param {Number} offset Number of elements to skip at the beginning of the array
     * @param {Number} count Number of vec3s to iterate over. If 0 iterates over entire array
     * @param {Function} fn Function to call for each vector in the array
     * @param {Object} [arg] additional argument to pass to fn
     * @returns {Array} a
     * @function
     */
    exports.forEach = function () {
        var vec = create();
        return function (a, stride, offset, count, fn, arg) {
            var i, l;
            if (!stride) {
                stride = 3;
            }
            if (!offset) {
                offset = 0;
            }
            if (count) {
                l = Math.min(count * stride + offset, a.length);
            }
            else {
                l = a.length;
            }
            for (i = offset; i < l; i += stride) {
                vec[0] = a[i];
                vec[1] = a[i + 1];
                vec[2] = a[i + 2];
                fn(vec, vec, arg);
                a[i] = vec[0];
                a[i + 1] = vec[1];
                a[i + 2] = vec[2];
            }
            return a;
        };
    }();
},
"c1aa33d719": /* gl-matrix/esm/vec4.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    /**
     * 4 Dimensional Vector
     * @module vec4
     */
    /**
     * Creates a new, empty vec4
     *
     * @returns {vec4} a new 4D vector
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(4);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[0] = 0;
            out[1] = 0;
            out[2] = 0;
            out[3] = 0;
        }
        return out;
    }
    exports.create = create;
    /**
     * Creates a new vec4 initialized with values from an existing vector
     *
     * @param {vec4} a vector to clone
     * @returns {vec4} a new 4D vector
     */
    function clone(a) {
        var out = new glMatrix.ARRAY_TYPE(4);
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        return out;
    }
    exports.clone = clone;
    /**
     * Creates a new vec4 initialized with the given values
     *
     * @param {Number} x X component
     * @param {Number} y Y component
     * @param {Number} z Z component
     * @param {Number} w W component
     * @returns {vec4} a new 4D vector
     */
    function fromValues(x, y, z, w) {
        var out = new glMatrix.ARRAY_TYPE(4);
        out[0] = x;
        out[1] = y;
        out[2] = z;
        out[3] = w;
        return out;
    }
    exports.fromValues = fromValues;
    /**
     * Copy the values from one vec4 to another
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the source vector
     * @returns {vec4} out
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        return out;
    }
    exports.copy = copy;
    /**
     * Set the components of a vec4 to the given values
     *
     * @param {vec4} out the receiving vector
     * @param {Number} x X component
     * @param {Number} y Y component
     * @param {Number} z Z component
     * @param {Number} w W component
     * @returns {vec4} out
     */
    function set(out, x, y, z, w) {
        out[0] = x;
        out[1] = y;
        out[2] = z;
        out[3] = w;
        return out;
    }
    exports.set = set;
    /**
     * Adds two vec4's
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {vec4} out
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        out[2] = a[2] + b[2];
        out[3] = a[3] + b[3];
        return out;
    }
    exports.add = add;
    /**
     * Subtracts vector b from vector a
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {vec4} out
     */
    function subtract(out, a, b) {
        out[0] = a[0] - b[0];
        out[1] = a[1] - b[1];
        out[2] = a[2] - b[2];
        out[3] = a[3] - b[3];
        return out;
    }
    exports.subtract = subtract;
    /**
     * Multiplies two vec4's
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {vec4} out
     */
    function multiply(out, a, b) {
        out[0] = a[0] * b[0];
        out[1] = a[1] * b[1];
        out[2] = a[2] * b[2];
        out[3] = a[3] * b[3];
        return out;
    }
    exports.multiply = multiply;
    /**
     * Divides two vec4's
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {vec4} out
     */
    function divide(out, a, b) {
        out[0] = a[0] / b[0];
        out[1] = a[1] / b[1];
        out[2] = a[2] / b[2];
        out[3] = a[3] / b[3];
        return out;
    }
    exports.divide = divide;
    /**
     * Math.ceil the components of a vec4
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a vector to ceil
     * @returns {vec4} out
     */
    function ceil(out, a) {
        out[0] = Math.ceil(a[0]);
        out[1] = Math.ceil(a[1]);
        out[2] = Math.ceil(a[2]);
        out[3] = Math.ceil(a[3]);
        return out;
    }
    exports.ceil = ceil;
    /**
     * Math.floor the components of a vec4
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a vector to floor
     * @returns {vec4} out
     */
    function floor(out, a) {
        out[0] = Math.floor(a[0]);
        out[1] = Math.floor(a[1]);
        out[2] = Math.floor(a[2]);
        out[3] = Math.floor(a[3]);
        return out;
    }
    exports.floor = floor;
    /**
     * Returns the minimum of two vec4's
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {vec4} out
     */
    function min(out, a, b) {
        out[0] = Math.min(a[0], b[0]);
        out[1] = Math.min(a[1], b[1]);
        out[2] = Math.min(a[2], b[2]);
        out[3] = Math.min(a[3], b[3]);
        return out;
    }
    exports.min = min;
    /**
     * Returns the maximum of two vec4's
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {vec4} out
     */
    function max(out, a, b) {
        out[0] = Math.max(a[0], b[0]);
        out[1] = Math.max(a[1], b[1]);
        out[2] = Math.max(a[2], b[2]);
        out[3] = Math.max(a[3], b[3]);
        return out;
    }
    exports.max = max;
    /**
     * Math.round the components of a vec4
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a vector to round
     * @returns {vec4} out
     */
    function round(out, a) {
        out[0] = Math.round(a[0]);
        out[1] = Math.round(a[1]);
        out[2] = Math.round(a[2]);
        out[3] = Math.round(a[3]);
        return out;
    }
    exports.round = round;
    /**
     * Scales a vec4 by a scalar number
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the vector to scale
     * @param {Number} b amount to scale the vector by
     * @returns {vec4} out
     */
    function scale(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        out[2] = a[2] * b;
        out[3] = a[3] * b;
        return out;
    }
    exports.scale = scale;
    /**
     * Adds two vec4's after scaling the second operand by a scalar value
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @param {Number} scale the amount to scale b by before adding
     * @returns {vec4} out
     */
    function scaleAndAdd(out, a, b, scale) {
        out[0] = a[0] + b[0] * scale;
        out[1] = a[1] + b[1] * scale;
        out[2] = a[2] + b[2] * scale;
        out[3] = a[3] + b[3] * scale;
        return out;
    }
    exports.scaleAndAdd = scaleAndAdd;
    /**
     * Calculates the euclidian distance between two vec4's
     *
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {Number} distance between a and b
     */
    function distance(a, b) {
        var x = b[0] - a[0];
        var y = b[1] - a[1];
        var z = b[2] - a[2];
        var w = b[3] - a[3];
        return Math.hypot(x, y, z, w);
    }
    exports.distance = distance;
    /**
     * Calculates the squared euclidian distance between two vec4's
     *
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {Number} squared distance between a and b
     */
    function squaredDistance(a, b) {
        var x = b[0] - a[0];
        var y = b[1] - a[1];
        var z = b[2] - a[2];
        var w = b[3] - a[3];
        return x * x + y * y + z * z + w * w;
    }
    exports.squaredDistance = squaredDistance;
    /**
     * Calculates the length of a vec4
     *
     * @param {vec4} a vector to calculate length of
     * @returns {Number} length of a
     */
    function length(a) {
        var x = a[0];
        var y = a[1];
        var z = a[2];
        var w = a[3];
        return Math.hypot(x, y, z, w);
    }
    exports.length = length;
    /**
     * Calculates the squared length of a vec4
     *
     * @param {vec4} a vector to calculate squared length of
     * @returns {Number} squared length of a
     */
    function squaredLength(a) {
        var x = a[0];
        var y = a[1];
        var z = a[2];
        var w = a[3];
        return x * x + y * y + z * z + w * w;
    }
    exports.squaredLength = squaredLength;
    /**
     * Negates the components of a vec4
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a vector to negate
     * @returns {vec4} out
     */
    function negate(out, a) {
        out[0] = -a[0];
        out[1] = -a[1];
        out[2] = -a[2];
        out[3] = -a[3];
        return out;
    }
    exports.negate = negate;
    /**
     * Returns the inverse of the components of a vec4
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a vector to invert
     * @returns {vec4} out
     */
    function inverse(out, a) {
        out[0] = 1.0 / a[0];
        out[1] = 1.0 / a[1];
        out[2] = 1.0 / a[2];
        out[3] = 1.0 / a[3];
        return out;
    }
    exports.inverse = inverse;
    /**
     * Normalize a vec4
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a vector to normalize
     * @returns {vec4} out
     */
    function normalize(out, a) {
        var x = a[0];
        var y = a[1];
        var z = a[2];
        var w = a[3];
        var len = x * x + y * y + z * z + w * w;
        if (len > 0) {
            len = 1 / Math.sqrt(len);
        }
        out[0] = x * len;
        out[1] = y * len;
        out[2] = z * len;
        out[3] = w * len;
        return out;
    }
    exports.normalize = normalize;
    /**
     * Calculates the dot product of two vec4's
     *
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @returns {Number} dot product of a and b
     */
    function dot(a, b) {
        return a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3];
    }
    exports.dot = dot;
    /**
     * Returns the cross-product of three vectors in a 4-dimensional space
     *
     * @param {vec4} result the receiving vector
     * @param {vec4} U the first vector
     * @param {vec4} V the second vector
     * @param {vec4} W the third vector
     * @returns {vec4} result
     */
    function cross(out, u, v, w) {
        var A = v[0] * w[1] - v[1] * w[0], B = v[0] * w[2] - v[2] * w[0], C = v[0] * w[3] - v[3] * w[0], D = v[1] * w[2] - v[2] * w[1], E = v[1] * w[3] - v[3] * w[1], F = v[2] * w[3] - v[3] * w[2];
        var G = u[0];
        var H = u[1];
        var I = u[2];
        var J = u[3];
        out[0] = H * F - I * E + J * D;
        out[1] = -(G * F) + I * C - J * B;
        out[2] = G * E - H * C + J * A;
        out[3] = -(G * D) + H * B - I * A;
        return out;
    }
    exports.cross = cross;
    /**
     * Performs a linear interpolation between two vec4's
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the first operand
     * @param {vec4} b the second operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {vec4} out
     */
    function lerp(out, a, b, t) {
        var ax = a[0];
        var ay = a[1];
        var az = a[2];
        var aw = a[3];
        out[0] = ax + t * (b[0] - ax);
        out[1] = ay + t * (b[1] - ay);
        out[2] = az + t * (b[2] - az);
        out[3] = aw + t * (b[3] - aw);
        return out;
    }
    exports.lerp = lerp;
    /**
     * Generates a random vector with the given scale
     *
     * @param {vec4} out the receiving vector
     * @param {Number} [scale] Length of the resulting vector. If ommitted, a unit vector will be returned
     * @returns {vec4} out
     */
    function random(out, scale) {
        scale = scale || 1.0; // Marsaglia, George. Choosing a Point from the Surface of a
        // Sphere. Ann. Math. Statist. 43 (1972), no. 2, 645--646.
        // http://projecteuclid.org/euclid.aoms/1177692644;
        var v1, v2, v3, v4;
        var s1, s2;
        do {
            v1 = glMatrix.RANDOM() * 2 - 1;
            v2 = glMatrix.RANDOM() * 2 - 1;
            s1 = v1 * v1 + v2 * v2;
        } while (s1 >= 1);
        do {
            v3 = glMatrix.RANDOM() * 2 - 1;
            v4 = glMatrix.RANDOM() * 2 - 1;
            s2 = v3 * v3 + v4 * v4;
        } while (s2 >= 1);
        var d = Math.sqrt((1 - s1) / s2);
        out[0] = scale * v1;
        out[1] = scale * v2;
        out[2] = scale * v3 * d;
        out[3] = scale * v4 * d;
        return out;
    }
    exports.random = random;
    /**
     * Transforms the vec4 with a mat4.
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the vector to transform
     * @param {mat4} m matrix to transform with
     * @returns {vec4} out
     */
    function transformMat4(out, a, m) {
        var x = a[0], y = a[1], z = a[2], w = a[3];
        out[0] = m[0] * x + m[4] * y + m[8] * z + m[12] * w;
        out[1] = m[1] * x + m[5] * y + m[9] * z + m[13] * w;
        out[2] = m[2] * x + m[6] * y + m[10] * z + m[14] * w;
        out[3] = m[3] * x + m[7] * y + m[11] * z + m[15] * w;
        return out;
    }
    exports.transformMat4 = transformMat4;
    /**
     * Transforms the vec4 with a quat
     *
     * @param {vec4} out the receiving vector
     * @param {vec4} a the vector to transform
     * @param {quat} q quaternion to transform with
     * @returns {vec4} out
     */
    function transformQuat(out, a, q) {
        var x = a[0], y = a[1], z = a[2];
        var qx = q[0], qy = q[1], qz = q[2], qw = q[3]; // calculate quat * vec
        var ix = qw * x + qy * z - qz * y;
        var iy = qw * y + qz * x - qx * z;
        var iz = qw * z + qx * y - qy * x;
        var iw = -qx * x - qy * y - qz * z; // calculate result * inverse quat
        out[0] = ix * qw + iw * -qx + iy * -qz - iz * -qy;
        out[1] = iy * qw + iw * -qy + iz * -qx - ix * -qz;
        out[2] = iz * qw + iw * -qz + ix * -qy - iy * -qx;
        out[3] = a[3];
        return out;
    }
    exports.transformQuat = transformQuat;
    /**
     * Set the components of a vec4 to zero
     *
     * @param {vec4} out the receiving vector
     * @returns {vec4} out
     */
    function zero(out) {
        out[0] = 0.0;
        out[1] = 0.0;
        out[2] = 0.0;
        out[3] = 0.0;
        return out;
    }
    exports.zero = zero;
    /**
     * Returns a string representation of a vector
     *
     * @param {vec4} a vector to represent as a string
     * @returns {String} string representation of the vector
     */
    function str(a) {
        return "vec4(" + a[0] + ", " + a[1] + ", " + a[2] + ", " + a[3] + ")";
    }
    exports.str = str;
    /**
     * Returns whether or not the vectors have exactly the same elements in the same position (when compared with ===)
     *
     * @param {vec4} a The first vector.
     * @param {vec4} b The second vector.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1] && a[2] === b[2] && a[3] === b[3];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the vectors have approximately the same elements in the same position.
     *
     * @param {vec4} a The first vector.
     * @param {vec4} b The second vector.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1)) && Math.abs(a2 - b2) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a2), Math.abs(b2)) && Math.abs(a3 - b3) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a3), Math.abs(b3));
    }
    exports.equals = equals;
    /**
     * Alias for {@link vec4.subtract}
     * @function
     */
    exports.sub = subtract;
    /**
     * Alias for {@link vec4.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Alias for {@link vec4.divide}
     * @function
     */
    exports.div = divide;
    /**
     * Alias for {@link vec4.distance}
     * @function
     */
    exports.dist = distance;
    /**
     * Alias for {@link vec4.squaredDistance}
     * @function
     */
    exports.sqrDist = squaredDistance;
    /**
     * Alias for {@link vec4.length}
     * @function
     */
    exports.len = length;
    /**
     * Alias for {@link vec4.squaredLength}
     * @function
     */
    exports.sqrLen = squaredLength;
    /**
     * Perform some operation over an array of vec4s.
     *
     * @param {Array} a the array of vectors to iterate over
     * @param {Number} stride Number of elements between the start of each vec4. If 0 assumes tightly packed
     * @param {Number} offset Number of elements to skip at the beginning of the array
     * @param {Number} count Number of vec4s to iterate over. If 0 iterates over entire array
     * @param {Function} fn Function to call for each vector in the array
     * @param {Object} [arg] additional argument to pass to fn
     * @returns {Array} a
     * @function
     */
    exports.forEach = function () {
        var vec = create();
        return function (a, stride, offset, count, fn, arg) {
            var i, l;
            if (!stride) {
                stride = 4;
            }
            if (!offset) {
                offset = 0;
            }
            if (count) {
                l = Math.min(count * stride + offset, a.length);
            }
            else {
                l = a.length;
            }
            for (i = offset; i < l; i += stride) {
                vec[0] = a[i];
                vec[1] = a[i + 1];
                vec[2] = a[i + 2];
                vec[3] = a[i + 3];
                fn(vec, vec, arg);
                a[i] = vec[0];
                a[i + 1] = vec[1];
                a[i + 2] = vec[2];
                a[i + 3] = vec[3];
            }
            return a;
        };
    }();
},
"277615c682": /* gl-matrix/esm/quat2.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    const quat = tslib_1.__importStar(require("eb06fc032a") /* ./quat.js */);
    const mat4 = tslib_1.__importStar(require("a427635f32") /* ./mat4.js */);
    /**
     * Dual Quaternion<br>
     * Format: [real, dual]<br>
     * Quaternion format: XYZW<br>
     * Make sure to have normalized dual quaternions, otherwise the functions may not work as intended.<br>
     * @module quat2
     */
    /**
     * Creates a new identity dual quat
     *
     * @returns {quat2} a new dual quaternion [real -> rotation, dual -> translation]
     */
    function create() {
        var dq = new glMatrix.ARRAY_TYPE(8);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            dq[0] = 0;
            dq[1] = 0;
            dq[2] = 0;
            dq[4] = 0;
            dq[5] = 0;
            dq[6] = 0;
            dq[7] = 0;
        }
        dq[3] = 1;
        return dq;
    }
    exports.create = create;
    /**
     * Creates a new quat initialized with values from an existing quaternion
     *
     * @param {quat2} a dual quaternion to clone
     * @returns {quat2} new dual quaternion
     * @function
     */
    function clone(a) {
        var dq = new glMatrix.ARRAY_TYPE(8);
        dq[0] = a[0];
        dq[1] = a[1];
        dq[2] = a[2];
        dq[3] = a[3];
        dq[4] = a[4];
        dq[5] = a[5];
        dq[6] = a[6];
        dq[7] = a[7];
        return dq;
    }
    exports.clone = clone;
    /**
     * Creates a new dual quat initialized with the given values
     *
     * @param {Number} x1 X component
     * @param {Number} y1 Y component
     * @param {Number} z1 Z component
     * @param {Number} w1 W component
     * @param {Number} x2 X component
     * @param {Number} y2 Y component
     * @param {Number} z2 Z component
     * @param {Number} w2 W component
     * @returns {quat2} new dual quaternion
     * @function
     */
    function fromValues(x1, y1, z1, w1, x2, y2, z2, w2) {
        var dq = new glMatrix.ARRAY_TYPE(8);
        dq[0] = x1;
        dq[1] = y1;
        dq[2] = z1;
        dq[3] = w1;
        dq[4] = x2;
        dq[5] = y2;
        dq[6] = z2;
        dq[7] = w2;
        return dq;
    }
    exports.fromValues = fromValues;
    /**
     * Creates a new dual quat from the given values (quat and translation)
     *
     * @param {Number} x1 X component
     * @param {Number} y1 Y component
     * @param {Number} z1 Z component
     * @param {Number} w1 W component
     * @param {Number} x2 X component (translation)
     * @param {Number} y2 Y component (translation)
     * @param {Number} z2 Z component (translation)
     * @returns {quat2} new dual quaternion
     * @function
     */
    function fromRotationTranslationValues(x1, y1, z1, w1, x2, y2, z2) {
        var dq = new glMatrix.ARRAY_TYPE(8);
        dq[0] = x1;
        dq[1] = y1;
        dq[2] = z1;
        dq[3] = w1;
        var ax = x2 * 0.5, ay = y2 * 0.5, az = z2 * 0.5;
        dq[4] = ax * w1 + ay * z1 - az * y1;
        dq[5] = ay * w1 + az * x1 - ax * z1;
        dq[6] = az * w1 + ax * y1 - ay * x1;
        dq[7] = -ax * x1 - ay * y1 - az * z1;
        return dq;
    }
    exports.fromRotationTranslationValues = fromRotationTranslationValues;
    /**
     * Creates a dual quat from a quaternion and a translation
     *
     * @param {quat2} dual quaternion receiving operation result
     * @param {quat} q a normalized quaternion
     * @param {vec3} t tranlation vector
     * @returns {quat2} dual quaternion receiving operation result
     * @function
     */
    function fromRotationTranslation(out, q, t) {
        var ax = t[0] * 0.5, ay = t[1] * 0.5, az = t[2] * 0.5, bx = q[0], by = q[1], bz = q[2], bw = q[3];
        out[0] = bx;
        out[1] = by;
        out[2] = bz;
        out[3] = bw;
        out[4] = ax * bw + ay * bz - az * by;
        out[5] = ay * bw + az * bx - ax * bz;
        out[6] = az * bw + ax * by - ay * bx;
        out[7] = -ax * bx - ay * by - az * bz;
        return out;
    }
    exports.fromRotationTranslation = fromRotationTranslation;
    /**
     * Creates a dual quat from a translation
     *
     * @param {quat2} dual quaternion receiving operation result
     * @param {vec3} t translation vector
     * @returns {quat2} dual quaternion receiving operation result
     * @function
     */
    function fromTranslation(out, t) {
        out[0] = 0;
        out[1] = 0;
        out[2] = 0;
        out[3] = 1;
        out[4] = t[0] * 0.5;
        out[5] = t[1] * 0.5;
        out[6] = t[2] * 0.5;
        out[7] = 0;
        return out;
    }
    exports.fromTranslation = fromTranslation;
    /**
     * Creates a dual quat from a quaternion
     *
     * @param {quat2} dual quaternion receiving operation result
     * @param {quat} q the quaternion
     * @returns {quat2} dual quaternion receiving operation result
     * @function
     */
    function fromRotation(out, q) {
        out[0] = q[0];
        out[1] = q[1];
        out[2] = q[2];
        out[3] = q[3];
        out[4] = 0;
        out[5] = 0;
        out[6] = 0;
        out[7] = 0;
        return out;
    }
    exports.fromRotation = fromRotation;
    /**
     * Creates a new dual quat from a matrix (4x4)
     *
     * @param {quat2} out the dual quaternion
     * @param {mat4} a the matrix
     * @returns {quat2} dual quat receiving operation result
     * @function
     */
    function fromMat4(out, a) {
        //TODO Optimize this
        var outer = quat.create();
        mat4.getRotation(outer, a);
        var t = new glMatrix.ARRAY_TYPE(3);
        mat4.getTranslation(t, a);
        fromRotationTranslation(out, outer, t);
        return out;
    }
    exports.fromMat4 = fromMat4;
    /**
     * Copy the values from one dual quat to another
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the source dual quaternion
     * @returns {quat2} out
     * @function
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        out[2] = a[2];
        out[3] = a[3];
        out[4] = a[4];
        out[5] = a[5];
        out[6] = a[6];
        out[7] = a[7];
        return out;
    }
    exports.copy = copy;
    /**
     * Set a dual quat to the identity dual quaternion
     *
     * @param {quat2} out the receiving quaternion
     * @returns {quat2} out
     */
    function identity(out) {
        out[0] = 0;
        out[1] = 0;
        out[2] = 0;
        out[3] = 1;
        out[4] = 0;
        out[5] = 0;
        out[6] = 0;
        out[7] = 0;
        return out;
    }
    exports.identity = identity;
    /**
     * Set the components of a dual quat to the given values
     *
     * @param {quat2} out the receiving quaternion
     * @param {Number} x1 X component
     * @param {Number} y1 Y component
     * @param {Number} z1 Z component
     * @param {Number} w1 W component
     * @param {Number} x2 X component
     * @param {Number} y2 Y component
     * @param {Number} z2 Z component
     * @param {Number} w2 W component
     * @returns {quat2} out
     * @function
     */
    function set(out, x1, y1, z1, w1, x2, y2, z2, w2) {
        out[0] = x1;
        out[1] = y1;
        out[2] = z1;
        out[3] = w1;
        out[4] = x2;
        out[5] = y2;
        out[6] = z2;
        out[7] = w2;
        return out;
    }
    exports.set = set;
    /**
     * Gets the real part of a dual quat
     * @param  {quat} out real part
     * @param  {quat2} a Dual Quaternion
     * @return {quat} real part
     */
    exports.getReal = quat.copy;
    /**
     * Gets the dual part of a dual quat
     * @param  {quat} out dual part
     * @param  {quat2} a Dual Quaternion
     * @return {quat} dual part
     */
    function getDual(out, a) {
        out[0] = a[4];
        out[1] = a[5];
        out[2] = a[6];
        out[3] = a[7];
        return out;
    }
    exports.getDual = getDual;
    /**
     * Set the real component of a dual quat to the given quaternion
     *
     * @param {quat2} out the receiving quaternion
     * @param {quat} q a quaternion representing the real part
     * @returns {quat2} out
     * @function
     */
    exports.setReal = quat.copy;
    /**
     * Set the dual component of a dual quat to the given quaternion
     *
     * @param {quat2} out the receiving quaternion
     * @param {quat} q a quaternion representing the dual part
     * @returns {quat2} out
     * @function
     */
    function setDual(out, q) {
        out[4] = q[0];
        out[5] = q[1];
        out[6] = q[2];
        out[7] = q[3];
        return out;
    }
    exports.setDual = setDual;
    /**
     * Gets the translation of a normalized dual quat
     * @param  {vec3} out translation
     * @param  {quat2} a Dual Quaternion to be decomposed
     * @return {vec3} translation
     */
    function getTranslation(out, a) {
        var ax = a[4], ay = a[5], az = a[6], aw = a[7], bx = -a[0], by = -a[1], bz = -a[2], bw = a[3];
        out[0] = (ax * bw + aw * bx + ay * bz - az * by) * 2;
        out[1] = (ay * bw + aw * by + az * bx - ax * bz) * 2;
        out[2] = (az * bw + aw * bz + ax * by - ay * bx) * 2;
        return out;
    }
    exports.getTranslation = getTranslation;
    /**
     * Translates a dual quat by the given vector
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the dual quaternion to translate
     * @param {vec3} v vector to translate by
     * @returns {quat2} out
     */
    function translate(out, a, v) {
        var ax1 = a[0], ay1 = a[1], az1 = a[2], aw1 = a[3], bx1 = v[0] * 0.5, by1 = v[1] * 0.5, bz1 = v[2] * 0.5, ax2 = a[4], ay2 = a[5], az2 = a[6], aw2 = a[7];
        out[0] = ax1;
        out[1] = ay1;
        out[2] = az1;
        out[3] = aw1;
        out[4] = aw1 * bx1 + ay1 * bz1 - az1 * by1 + ax2;
        out[5] = aw1 * by1 + az1 * bx1 - ax1 * bz1 + ay2;
        out[6] = aw1 * bz1 + ax1 * by1 - ay1 * bx1 + az2;
        out[7] = -ax1 * bx1 - ay1 * by1 - az1 * bz1 + aw2;
        return out;
    }
    exports.translate = translate;
    /**
     * Rotates a dual quat around the X axis
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the dual quaternion to rotate
     * @param {number} rad how far should the rotation be
     * @returns {quat2} out
     */
    function rotateX(out, a, rad) {
        var bx = -a[0], by = -a[1], bz = -a[2], bw = a[3], ax = a[4], ay = a[5], az = a[6], aw = a[7], ax1 = ax * bw + aw * bx + ay * bz - az * by, ay1 = ay * bw + aw * by + az * bx - ax * bz, az1 = az * bw + aw * bz + ax * by - ay * bx, aw1 = aw * bw - ax * bx - ay * by - az * bz;
        quat.rotateX(out, a, rad);
        bx = out[0];
        by = out[1];
        bz = out[2];
        bw = out[3];
        out[4] = ax1 * bw + aw1 * bx + ay1 * bz - az1 * by;
        out[5] = ay1 * bw + aw1 * by + az1 * bx - ax1 * bz;
        out[6] = az1 * bw + aw1 * bz + ax1 * by - ay1 * bx;
        out[7] = aw1 * bw - ax1 * bx - ay1 * by - az1 * bz;
        return out;
    }
    exports.rotateX = rotateX;
    /**
     * Rotates a dual quat around the Y axis
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the dual quaternion to rotate
     * @param {number} rad how far should the rotation be
     * @returns {quat2} out
     */
    function rotateY(out, a, rad) {
        var bx = -a[0], by = -a[1], bz = -a[2], bw = a[3], ax = a[4], ay = a[5], az = a[6], aw = a[7], ax1 = ax * bw + aw * bx + ay * bz - az * by, ay1 = ay * bw + aw * by + az * bx - ax * bz, az1 = az * bw + aw * bz + ax * by - ay * bx, aw1 = aw * bw - ax * bx - ay * by - az * bz;
        quat.rotateY(out, a, rad);
        bx = out[0];
        by = out[1];
        bz = out[2];
        bw = out[3];
        out[4] = ax1 * bw + aw1 * bx + ay1 * bz - az1 * by;
        out[5] = ay1 * bw + aw1 * by + az1 * bx - ax1 * bz;
        out[6] = az1 * bw + aw1 * bz + ax1 * by - ay1 * bx;
        out[7] = aw1 * bw - ax1 * bx - ay1 * by - az1 * bz;
        return out;
    }
    exports.rotateY = rotateY;
    /**
     * Rotates a dual quat around the Z axis
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the dual quaternion to rotate
     * @param {number} rad how far should the rotation be
     * @returns {quat2} out
     */
    function rotateZ(out, a, rad) {
        var bx = -a[0], by = -a[1], bz = -a[2], bw = a[3], ax = a[4], ay = a[5], az = a[6], aw = a[7], ax1 = ax * bw + aw * bx + ay * bz - az * by, ay1 = ay * bw + aw * by + az * bx - ax * bz, az1 = az * bw + aw * bz + ax * by - ay * bx, aw1 = aw * bw - ax * bx - ay * by - az * bz;
        quat.rotateZ(out, a, rad);
        bx = out[0];
        by = out[1];
        bz = out[2];
        bw = out[3];
        out[4] = ax1 * bw + aw1 * bx + ay1 * bz - az1 * by;
        out[5] = ay1 * bw + aw1 * by + az1 * bx - ax1 * bz;
        out[6] = az1 * bw + aw1 * bz + ax1 * by - ay1 * bx;
        out[7] = aw1 * bw - ax1 * bx - ay1 * by - az1 * bz;
        return out;
    }
    exports.rotateZ = rotateZ;
    /**
     * Rotates a dual quat by a given quaternion (a * q)
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the dual quaternion to rotate
     * @param {quat} q quaternion to rotate by
     * @returns {quat2} out
     */
    function rotateByQuatAppend(out, a, q) {
        var qx = q[0], qy = q[1], qz = q[2], qw = q[3], ax = a[0], ay = a[1], az = a[2], aw = a[3];
        out[0] = ax * qw + aw * qx + ay * qz - az * qy;
        out[1] = ay * qw + aw * qy + az * qx - ax * qz;
        out[2] = az * qw + aw * qz + ax * qy - ay * qx;
        out[3] = aw * qw - ax * qx - ay * qy - az * qz;
        ax = a[4];
        ay = a[5];
        az = a[6];
        aw = a[7];
        out[4] = ax * qw + aw * qx + ay * qz - az * qy;
        out[5] = ay * qw + aw * qy + az * qx - ax * qz;
        out[6] = az * qw + aw * qz + ax * qy - ay * qx;
        out[7] = aw * qw - ax * qx - ay * qy - az * qz;
        return out;
    }
    exports.rotateByQuatAppend = rotateByQuatAppend;
    /**
     * Rotates a dual quat by a given quaternion (q * a)
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat} q quaternion to rotate by
     * @param {quat2} a the dual quaternion to rotate
     * @returns {quat2} out
     */
    function rotateByQuatPrepend(out, q, a) {
        var qx = q[0], qy = q[1], qz = q[2], qw = q[3], bx = a[0], by = a[1], bz = a[2], bw = a[3];
        out[0] = qx * bw + qw * bx + qy * bz - qz * by;
        out[1] = qy * bw + qw * by + qz * bx - qx * bz;
        out[2] = qz * bw + qw * bz + qx * by - qy * bx;
        out[3] = qw * bw - qx * bx - qy * by - qz * bz;
        bx = a[4];
        by = a[5];
        bz = a[6];
        bw = a[7];
        out[4] = qx * bw + qw * bx + qy * bz - qz * by;
        out[5] = qy * bw + qw * by + qz * bx - qx * bz;
        out[6] = qz * bw + qw * bz + qx * by - qy * bx;
        out[7] = qw * bw - qx * bx - qy * by - qz * bz;
        return out;
    }
    exports.rotateByQuatPrepend = rotateByQuatPrepend;
    /**
     * Rotates a dual quat around a given axis. Does the normalisation automatically
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the dual quaternion to rotate
     * @param {vec3} axis the axis to rotate around
     * @param {Number} rad how far the rotation should be
     * @returns {quat2} out
     */
    function rotateAroundAxis(out, a, axis, rad) {
        //Special case for rad = 0
        if (Math.abs(rad) < glMatrix.EPSILON) {
            return copy(out, a);
        }
        var axisLength = Math.hypot(axis[0], axis[1], axis[2]);
        rad = rad * 0.5;
        var s = Math.sin(rad);
        var bx = s * axis[0] / axisLength;
        var by = s * axis[1] / axisLength;
        var bz = s * axis[2] / axisLength;
        var bw = Math.cos(rad);
        var ax1 = a[0], ay1 = a[1], az1 = a[2], aw1 = a[3];
        out[0] = ax1 * bw + aw1 * bx + ay1 * bz - az1 * by;
        out[1] = ay1 * bw + aw1 * by + az1 * bx - ax1 * bz;
        out[2] = az1 * bw + aw1 * bz + ax1 * by - ay1 * bx;
        out[3] = aw1 * bw - ax1 * bx - ay1 * by - az1 * bz;
        var ax = a[4], ay = a[5], az = a[6], aw = a[7];
        out[4] = ax * bw + aw * bx + ay * bz - az * by;
        out[5] = ay * bw + aw * by + az * bx - ax * bz;
        out[6] = az * bw + aw * bz + ax * by - ay * bx;
        out[7] = aw * bw - ax * bx - ay * by - az * bz;
        return out;
    }
    exports.rotateAroundAxis = rotateAroundAxis;
    /**
     * Adds two dual quat's
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the first operand
     * @param {quat2} b the second operand
     * @returns {quat2} out
     * @function
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        out[2] = a[2] + b[2];
        out[3] = a[3] + b[3];
        out[4] = a[4] + b[4];
        out[5] = a[5] + b[5];
        out[6] = a[6] + b[6];
        out[7] = a[7] + b[7];
        return out;
    }
    exports.add = add;
    /**
     * Multiplies two dual quat's
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a the first operand
     * @param {quat2} b the second operand
     * @returns {quat2} out
     */
    function multiply(out, a, b) {
        var ax0 = a[0], ay0 = a[1], az0 = a[2], aw0 = a[3], bx1 = b[4], by1 = b[5], bz1 = b[6], bw1 = b[7], ax1 = a[4], ay1 = a[5], az1 = a[6], aw1 = a[7], bx0 = b[0], by0 = b[1], bz0 = b[2], bw0 = b[3];
        out[0] = ax0 * bw0 + aw0 * bx0 + ay0 * bz0 - az0 * by0;
        out[1] = ay0 * bw0 + aw0 * by0 + az0 * bx0 - ax0 * bz0;
        out[2] = az0 * bw0 + aw0 * bz0 + ax0 * by0 - ay0 * bx0;
        out[3] = aw0 * bw0 - ax0 * bx0 - ay0 * by0 - az0 * bz0;
        out[4] = ax0 * bw1 + aw0 * bx1 + ay0 * bz1 - az0 * by1 + ax1 * bw0 + aw1 * bx0 + ay1 * bz0 - az1 * by0;
        out[5] = ay0 * bw1 + aw0 * by1 + az0 * bx1 - ax0 * bz1 + ay1 * bw0 + aw1 * by0 + az1 * bx0 - ax1 * bz0;
        out[6] = az0 * bw1 + aw0 * bz1 + ax0 * by1 - ay0 * bx1 + az1 * bw0 + aw1 * bz0 + ax1 * by0 - ay1 * bx0;
        out[7] = aw0 * bw1 - ax0 * bx1 - ay0 * by1 - az0 * bz1 + aw1 * bw0 - ax1 * bx0 - ay1 * by0 - az1 * bz0;
        return out;
    }
    exports.multiply = multiply;
    /**
     * Alias for {@link quat2.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Scales a dual quat by a scalar number
     *
     * @param {quat2} out the receiving dual quat
     * @param {quat2} a the dual quat to scale
     * @param {Number} b amount to scale the dual quat by
     * @returns {quat2} out
     * @function
     */
    function scale(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        out[2] = a[2] * b;
        out[3] = a[3] * b;
        out[4] = a[4] * b;
        out[5] = a[5] * b;
        out[6] = a[6] * b;
        out[7] = a[7] * b;
        return out;
    }
    exports.scale = scale;
    /**
     * Calculates the dot product of two dual quat's (The dot product of the real parts)
     *
     * @param {quat2} a the first operand
     * @param {quat2} b the second operand
     * @returns {Number} dot product of a and b
     * @function
     */
    exports.dot = quat.dot;
    /**
     * Performs a linear interpolation between two dual quats's
     * NOTE: The resulting dual quaternions won't always be normalized (The error is most noticeable when t = 0.5)
     *
     * @param {quat2} out the receiving dual quat
     * @param {quat2} a the first operand
     * @param {quat2} b the second operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {quat2} out
     */
    function lerp(out, a, b, t) {
        var mt = 1 - t;
        if (exports.dot(a, b) < 0)
            t = -t;
        out[0] = a[0] * mt + b[0] * t;
        out[1] = a[1] * mt + b[1] * t;
        out[2] = a[2] * mt + b[2] * t;
        out[3] = a[3] * mt + b[3] * t;
        out[4] = a[4] * mt + b[4] * t;
        out[5] = a[5] * mt + b[5] * t;
        out[6] = a[6] * mt + b[6] * t;
        out[7] = a[7] * mt + b[7] * t;
        return out;
    }
    exports.lerp = lerp;
    /**
     * Calculates the inverse of a dual quat. If they are normalized, conjugate is cheaper
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a dual quat to calculate inverse of
     * @returns {quat2} out
     */
    function invert(out, a) {
        var sqlen = exports.squaredLength(a);
        out[0] = -a[0] / sqlen;
        out[1] = -a[1] / sqlen;
        out[2] = -a[2] / sqlen;
        out[3] = a[3] / sqlen;
        out[4] = -a[4] / sqlen;
        out[5] = -a[5] / sqlen;
        out[6] = -a[6] / sqlen;
        out[7] = a[7] / sqlen;
        return out;
    }
    exports.invert = invert;
    /**
     * Calculates the conjugate of a dual quat
     * If the dual quaternion is normalized, this function is faster than quat2.inverse and produces the same result.
     *
     * @param {quat2} out the receiving quaternion
     * @param {quat2} a quat to calculate conjugate of
     * @returns {quat2} out
     */
    function conjugate(out, a) {
        out[0] = -a[0];
        out[1] = -a[1];
        out[2] = -a[2];
        out[3] = a[3];
        out[4] = -a[4];
        out[5] = -a[5];
        out[6] = -a[6];
        out[7] = a[7];
        return out;
    }
    exports.conjugate = conjugate;
    /**
     * Calculates the length of a dual quat
     *
     * @param {quat2} a dual quat to calculate length of
     * @returns {Number} length of a
     * @function
     */
    exports.length = quat.length;
    /**
     * Alias for {@link quat2.length}
     * @function
     */
    exports.len = exports.length;
    /**
     * Calculates the squared length of a dual quat
     *
     * @param {quat2} a dual quat to calculate squared length of
     * @returns {Number} squared length of a
     * @function
     */
    exports.squaredLength = quat.squaredLength;
    /**
     * Alias for {@link quat2.squaredLength}
     * @function
     */
    exports.sqrLen = exports.squaredLength;
    /**
     * Normalize a dual quat
     *
     * @param {quat2} out the receiving dual quaternion
     * @param {quat2} a dual quaternion to normalize
     * @returns {quat2} out
     * @function
     */
    function normalize(out, a) {
        var magnitude = exports.squaredLength(a);
        if (magnitude > 0) {
            magnitude = Math.sqrt(magnitude);
            var a0 = a[0] / magnitude;
            var a1 = a[1] / magnitude;
            var a2 = a[2] / magnitude;
            var a3 = a[3] / magnitude;
            var b0 = a[4];
            var b1 = a[5];
            var b2 = a[6];
            var b3 = a[7];
            var a_dot_b = a0 * b0 + a1 * b1 + a2 * b2 + a3 * b3;
            out[0] = a0;
            out[1] = a1;
            out[2] = a2;
            out[3] = a3;
            out[4] = (b0 - a0 * a_dot_b) / magnitude;
            out[5] = (b1 - a1 * a_dot_b) / magnitude;
            out[6] = (b2 - a2 * a_dot_b) / magnitude;
            out[7] = (b3 - a3 * a_dot_b) / magnitude;
        }
        return out;
    }
    exports.normalize = normalize;
    /**
     * Returns a string representation of a dual quatenion
     *
     * @param {quat2} a dual quaternion to represent as a string
     * @returns {String} string representation of the dual quat
     */
    function str(a) {
        return "quat2(" + a[0] + ", " + a[1] + ", " + a[2] + ", " + a[3] + ", " + a[4] + ", " + a[5] + ", " + a[6] + ", " + a[7] + ")";
    }
    exports.str = str;
    /**
     * Returns whether or not the dual quaternions have exactly the same elements in the same position (when compared with ===)
     *
     * @param {quat2} a the first dual quaternion.
     * @param {quat2} b the second dual quaternion.
     * @returns {Boolean} true if the dual quaternions are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1] && a[2] === b[2] && a[3] === b[3] && a[4] === b[4] && a[5] === b[5] && a[6] === b[6] && a[7] === b[7];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the dual quaternions have approximately the same elements in the same position.
     *
     * @param {quat2} a the first dual quat.
     * @param {quat2} b the second dual quat.
     * @returns {Boolean} true if the dual quats are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1], a2 = a[2], a3 = a[3], a4 = a[4], a5 = a[5], a6 = a[6], a7 = a[7];
        var b0 = b[0], b1 = b[1], b2 = b[2], b3 = b[3], b4 = b[4], b5 = b[5], b6 = b[6], b7 = b[7];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1)) && Math.abs(a2 - b2) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a2), Math.abs(b2)) && Math.abs(a3 - b3) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a3), Math.abs(b3)) && Math.abs(a4 - b4) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a4), Math.abs(b4)) && Math.abs(a5 - b5) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a5), Math.abs(b5)) && Math.abs(a6 - b6) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a6), Math.abs(b6)) && Math.abs(a7 - b7) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a7), Math.abs(b7));
    }
    exports.equals = equals;
},
"c56d9ff837": /* gl-matrix/esm/vec2.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const glMatrix = tslib_1.__importStar(require("68ca94c15c") /* ./common.js */);
    /**
     * 2 Dimensional Vector
     * @module vec2
     */
    /**
     * Creates a new, empty vec2
     *
     * @returns {vec2} a new 2D vector
     */
    function create() {
        var out = new glMatrix.ARRAY_TYPE(2);
        if (glMatrix.ARRAY_TYPE != Float32Array) {
            out[0] = 0;
            out[1] = 0;
        }
        return out;
    }
    exports.create = create;
    /**
     * Creates a new vec2 initialized with values from an existing vector
     *
     * @param {vec2} a vector to clone
     * @returns {vec2} a new 2D vector
     */
    function clone(a) {
        var out = new glMatrix.ARRAY_TYPE(2);
        out[0] = a[0];
        out[1] = a[1];
        return out;
    }
    exports.clone = clone;
    /**
     * Creates a new vec2 initialized with the given values
     *
     * @param {Number} x X component
     * @param {Number} y Y component
     * @returns {vec2} a new 2D vector
     */
    function fromValues(x, y) {
        var out = new glMatrix.ARRAY_TYPE(2);
        out[0] = x;
        out[1] = y;
        return out;
    }
    exports.fromValues = fromValues;
    /**
     * Copy the values from one vec2 to another
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the source vector
     * @returns {vec2} out
     */
    function copy(out, a) {
        out[0] = a[0];
        out[1] = a[1];
        return out;
    }
    exports.copy = copy;
    /**
     * Set the components of a vec2 to the given values
     *
     * @param {vec2} out the receiving vector
     * @param {Number} x X component
     * @param {Number} y Y component
     * @returns {vec2} out
     */
    function set(out, x, y) {
        out[0] = x;
        out[1] = y;
        return out;
    }
    exports.set = set;
    /**
     * Adds two vec2's
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {vec2} out
     */
    function add(out, a, b) {
        out[0] = a[0] + b[0];
        out[1] = a[1] + b[1];
        return out;
    }
    exports.add = add;
    /**
     * Subtracts vector b from vector a
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {vec2} out
     */
    function subtract(out, a, b) {
        out[0] = a[0] - b[0];
        out[1] = a[1] - b[1];
        return out;
    }
    exports.subtract = subtract;
    /**
     * Multiplies two vec2's
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {vec2} out
     */
    function multiply(out, a, b) {
        out[0] = a[0] * b[0];
        out[1] = a[1] * b[1];
        return out;
    }
    exports.multiply = multiply;
    /**
     * Divides two vec2's
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {vec2} out
     */
    function divide(out, a, b) {
        out[0] = a[0] / b[0];
        out[1] = a[1] / b[1];
        return out;
    }
    exports.divide = divide;
    /**
     * Math.ceil the components of a vec2
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a vector to ceil
     * @returns {vec2} out
     */
    function ceil(out, a) {
        out[0] = Math.ceil(a[0]);
        out[1] = Math.ceil(a[1]);
        return out;
    }
    exports.ceil = ceil;
    /**
     * Math.floor the components of a vec2
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a vector to floor
     * @returns {vec2} out
     */
    function floor(out, a) {
        out[0] = Math.floor(a[0]);
        out[1] = Math.floor(a[1]);
        return out;
    }
    exports.floor = floor;
    /**
     * Returns the minimum of two vec2's
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {vec2} out
     */
    function min(out, a, b) {
        out[0] = Math.min(a[0], b[0]);
        out[1] = Math.min(a[1], b[1]);
        return out;
    }
    exports.min = min;
    /**
     * Returns the maximum of two vec2's
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {vec2} out
     */
    function max(out, a, b) {
        out[0] = Math.max(a[0], b[0]);
        out[1] = Math.max(a[1], b[1]);
        return out;
    }
    exports.max = max;
    /**
     * Math.round the components of a vec2
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a vector to round
     * @returns {vec2} out
     */
    function round(out, a) {
        out[0] = Math.round(a[0]);
        out[1] = Math.round(a[1]);
        return out;
    }
    exports.round = round;
    /**
     * Scales a vec2 by a scalar number
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the vector to scale
     * @param {Number} b amount to scale the vector by
     * @returns {vec2} out
     */
    function scale(out, a, b) {
        out[0] = a[0] * b;
        out[1] = a[1] * b;
        return out;
    }
    exports.scale = scale;
    /**
     * Adds two vec2's after scaling the second operand by a scalar value
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @param {Number} scale the amount to scale b by before adding
     * @returns {vec2} out
     */
    function scaleAndAdd(out, a, b, scale) {
        out[0] = a[0] + b[0] * scale;
        out[1] = a[1] + b[1] * scale;
        return out;
    }
    exports.scaleAndAdd = scaleAndAdd;
    /**
     * Calculates the euclidian distance between two vec2's
     *
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {Number} distance between a and b
     */
    function distance(a, b) {
        var x = b[0] - a[0], y = b[1] - a[1];
        return Math.hypot(x, y);
    }
    exports.distance = distance;
    /**
     * Calculates the squared euclidian distance between two vec2's
     *
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {Number} squared distance between a and b
     */
    function squaredDistance(a, b) {
        var x = b[0] - a[0], y = b[1] - a[1];
        return x * x + y * y;
    }
    exports.squaredDistance = squaredDistance;
    /**
     * Calculates the length of a vec2
     *
     * @param {vec2} a vector to calculate length of
     * @returns {Number} length of a
     */
    function length(a) {
        var x = a[0], y = a[1];
        return Math.hypot(x, y);
    }
    exports.length = length;
    /**
     * Calculates the squared length of a vec2
     *
     * @param {vec2} a vector to calculate squared length of
     * @returns {Number} squared length of a
     */
    function squaredLength(a) {
        var x = a[0], y = a[1];
        return x * x + y * y;
    }
    exports.squaredLength = squaredLength;
    /**
     * Negates the components of a vec2
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a vector to negate
     * @returns {vec2} out
     */
    function negate(out, a) {
        out[0] = -a[0];
        out[1] = -a[1];
        return out;
    }
    exports.negate = negate;
    /**
     * Returns the inverse of the components of a vec2
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a vector to invert
     * @returns {vec2} out
     */
    function inverse(out, a) {
        out[0] = 1.0 / a[0];
        out[1] = 1.0 / a[1];
        return out;
    }
    exports.inverse = inverse;
    /**
     * Normalize a vec2
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a vector to normalize
     * @returns {vec2} out
     */
    function normalize(out, a) {
        var x = a[0], y = a[1];
        var len = x * x + y * y;
        if (len > 0) {
            //TODO: evaluate use of glm_invsqrt here?
            len = 1 / Math.sqrt(len);
        }
        out[0] = a[0] * len;
        out[1] = a[1] * len;
        return out;
    }
    exports.normalize = normalize;
    /**
     * Calculates the dot product of two vec2's
     *
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {Number} dot product of a and b
     */
    function dot(a, b) {
        return a[0] * b[0] + a[1] * b[1];
    }
    exports.dot = dot;
    /**
     * Computes the cross product of two vec2's
     * Note that the cross product must by definition produce a 3D vector
     *
     * @param {vec3} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @returns {vec3} out
     */
    function cross(out, a, b) {
        var z = a[0] * b[1] - a[1] * b[0];
        out[0] = out[1] = 0;
        out[2] = z;
        return out;
    }
    exports.cross = cross;
    /**
     * Performs a linear interpolation between two vec2's
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the first operand
     * @param {vec2} b the second operand
     * @param {Number} t interpolation amount, in the range [0-1], between the two inputs
     * @returns {vec2} out
     */
    function lerp(out, a, b, t) {
        var ax = a[0], ay = a[1];
        out[0] = ax + t * (b[0] - ax);
        out[1] = ay + t * (b[1] - ay);
        return out;
    }
    exports.lerp = lerp;
    /**
     * Generates a random vector with the given scale
     *
     * @param {vec2} out the receiving vector
     * @param {Number} [scale] Length of the resulting vector. If ommitted, a unit vector will be returned
     * @returns {vec2} out
     */
    function random(out, scale) {
        scale = scale || 1.0;
        var r = glMatrix.RANDOM() * 2.0 * Math.PI;
        out[0] = Math.cos(r) * scale;
        out[1] = Math.sin(r) * scale;
        return out;
    }
    exports.random = random;
    /**
     * Transforms the vec2 with a mat2
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the vector to transform
     * @param {mat2} m matrix to transform with
     * @returns {vec2} out
     */
    function transformMat2(out, a, m) {
        var x = a[0], y = a[1];
        out[0] = m[0] * x + m[2] * y;
        out[1] = m[1] * x + m[3] * y;
        return out;
    }
    exports.transformMat2 = transformMat2;
    /**
     * Transforms the vec2 with a mat2d
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the vector to transform
     * @param {mat2d} m matrix to transform with
     * @returns {vec2} out
     */
    function transformMat2d(out, a, m) {
        var x = a[0], y = a[1];
        out[0] = m[0] * x + m[2] * y + m[4];
        out[1] = m[1] * x + m[3] * y + m[5];
        return out;
    }
    exports.transformMat2d = transformMat2d;
    /**
     * Transforms the vec2 with a mat3
     * 3rd vector component is implicitly '1'
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the vector to transform
     * @param {mat3} m matrix to transform with
     * @returns {vec2} out
     */
    function transformMat3(out, a, m) {
        var x = a[0], y = a[1];
        out[0] = m[0] * x + m[3] * y + m[6];
        out[1] = m[1] * x + m[4] * y + m[7];
        return out;
    }
    exports.transformMat3 = transformMat3;
    /**
     * Transforms the vec2 with a mat4
     * 3rd vector component is implicitly '0'
     * 4th vector component is implicitly '1'
     *
     * @param {vec2} out the receiving vector
     * @param {vec2} a the vector to transform
     * @param {mat4} m matrix to transform with
     * @returns {vec2} out
     */
    function transformMat4(out, a, m) {
        var x = a[0];
        var y = a[1];
        out[0] = m[0] * x + m[4] * y + m[12];
        out[1] = m[1] * x + m[5] * y + m[13];
        return out;
    }
    exports.transformMat4 = transformMat4;
    /**
     * Rotate a 2D vector
     * @param {vec2} out The receiving vec2
     * @param {vec2} a The vec2 point to rotate
     * @param {vec2} b The origin of the rotation
     * @param {Number} rad The angle of rotation in radians
     * @returns {vec2} out
     */
    function rotate(out, a, b, rad) {
        //Translate point to the origin
        var p0 = a[0] - b[0], p1 = a[1] - b[1], sinC = Math.sin(rad), cosC = Math.cos(rad); //perform rotation and translate to correct position
        out[0] = p0 * cosC - p1 * sinC + b[0];
        out[1] = p0 * sinC + p1 * cosC + b[1];
        return out;
    }
    exports.rotate = rotate;
    /**
     * Get the angle between two 2D vectors
     * @param {vec2} a The first operand
     * @param {vec2} b The second operand
     * @returns {Number} The angle in radians
     */
    function angle(a, b) {
        var x1 = a[0], y1 = a[1], x2 = b[0], y2 = b[1], 
        // mag is the product of the magnitudes of a and b
        mag = Math.sqrt(x1 * x1 + y1 * y1) * Math.sqrt(x2 * x2 + y2 * y2), 
        // mag &&.. short circuits if mag == 0
        cosine = mag && (x1 * x2 + y1 * y2) / mag; // Math.min(Math.max(cosine, -1), 1) clamps the cosine between -1 and 1
        return Math.acos(Math.min(Math.max(cosine, -1), 1));
    }
    exports.angle = angle;
    /**
     * Set the components of a vec2 to zero
     *
     * @param {vec2} out the receiving vector
     * @returns {vec2} out
     */
    function zero(out) {
        out[0] = 0.0;
        out[1] = 0.0;
        return out;
    }
    exports.zero = zero;
    /**
     * Returns a string representation of a vector
     *
     * @param {vec2} a vector to represent as a string
     * @returns {String} string representation of the vector
     */
    function str(a) {
        return "vec2(" + a[0] + ", " + a[1] + ")";
    }
    exports.str = str;
    /**
     * Returns whether or not the vectors exactly have the same elements in the same position (when compared with ===)
     *
     * @param {vec2} a The first vector.
     * @param {vec2} b The second vector.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    function exactEquals(a, b) {
        return a[0] === b[0] && a[1] === b[1];
    }
    exports.exactEquals = exactEquals;
    /**
     * Returns whether or not the vectors have approximately the same elements in the same position.
     *
     * @param {vec2} a The first vector.
     * @param {vec2} b The second vector.
     * @returns {Boolean} True if the vectors are equal, false otherwise.
     */
    function equals(a, b) {
        var a0 = a[0], a1 = a[1];
        var b0 = b[0], b1 = b[1];
        return Math.abs(a0 - b0) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a0), Math.abs(b0)) && Math.abs(a1 - b1) <= glMatrix.EPSILON * Math.max(1.0, Math.abs(a1), Math.abs(b1));
    }
    exports.equals = equals;
    /**
     * Alias for {@link vec2.length}
     * @function
     */
    exports.len = length;
    /**
     * Alias for {@link vec2.subtract}
     * @function
     */
    exports.sub = subtract;
    /**
     * Alias for {@link vec2.multiply}
     * @function
     */
    exports.mul = multiply;
    /**
     * Alias for {@link vec2.divide}
     * @function
     */
    exports.div = divide;
    /**
     * Alias for {@link vec2.distance}
     * @function
     */
    exports.dist = distance;
    /**
     * Alias for {@link vec2.squaredDistance}
     * @function
     */
    exports.sqrDist = squaredDistance;
    /**
     * Alias for {@link vec2.squaredLength}
     * @function
     */
    exports.sqrLen = squaredLength;
    /**
     * Perform some operation over an array of vec2s.
     *
     * @param {Array} a the array of vectors to iterate over
     * @param {Number} stride Number of elements between the start of each vec2. If 0 assumes tightly packed
     * @param {Number} offset Number of elements to skip at the beginning of the array
     * @param {Number} count Number of vec2s to iterate over. If 0 iterates over entire array
     * @param {Function} fn Function to call for each vector in the array
     * @param {Object} [arg] additional argument to pass to fn
     * @returns {Array} a
     * @function
     */
    exports.forEach = function () {
        var vec = create();
        return function (a, stride, offset, count, fn, arg) {
            var i, l;
            if (!stride) {
                stride = 2;
            }
            if (!offset) {
                offset = 0;
            }
            if (count) {
                l = Math.min(count * stride + offset, a.length);
            }
            else {
                l = a.length;
            }
            for (i = offset; i < l; i += stride) {
                vec[0] = a[i];
                vec[1] = a[i + 1];
                fn(vec, vec, arg);
                a[i] = vec[0];
                a[i + 1] = vec[1];
            }
            return a;
        };
    }();
},
"4baab0b7ce": /* models/vtk/vtksynchronized.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const tslib_1 = require("tslib");
    const p = tslib_1.__importStar(require("@bokehjs/core/properties"));
    const object_1 = require("@bokehjs/core/util/object");
    const vtklayout_1 = require("021b2a3929") /* ./vtklayout */;
    const util_1 = require("6c442cdcb4") /* ./util */;
    const panel_fullscreen_renwin_sync_1 = require("11e0707a8f") /* ./panel_fullscreen_renwin_sync */;
    const CONTEXT_NAME = "panel";
    class VTKSynchronizedPlotView extends vtklayout_1.AbstractVTKView {
        initialize() {
            super.initialize();
            this._promises = [];
            this._renderable = false;
            this._arrays = {};
            this._decoded_arrays = {};
            this._pending_arrays = {};
            // Internal closures
            this.getArray = (hash) => {
                if (this._arrays[hash]) {
                    return Promise.resolve(this._arrays[hash]);
                }
                return new Promise((resolve, reject) => {
                    this._pending_arrays[hash] = { resolve, reject };
                });
            };
            this.registerArray = (hash, array) => {
                this._arrays[hash] = array;
                if (this._pending_arrays[hash]) {
                    this._pending_arrays[hash].resolve(array);
                }
                return true;
            };
            // Context initialisation
            this._synchronizer_context = util_1.vtkns.SynchronizableRenderWindow.getSynchronizerContext(CONTEXT_NAME);
        }
        connect_signals() {
            super.connect_signals();
            this.connect(this.model.properties.arrays.change, () => this._decode_arrays());
            this.connect(this.model.properties.scene.change, () => {
                if (this.model.rebuild) {
                    this._vtk_renwin = null;
                    this.invalidate_render();
                }
                else {
                    const state = object_1.clone(this.model.scene);
                    Promise.all(this._promises).then(() => {
                        this._sync_plot(state, () => {
                            this._on_scene_ready();
                        });
                    });
                }
            });
            this.connect(this.model.properties.one_time_reset.change, () => {
                this._vtk_renwin.getRenderWindow().clearOneTimeUpdaters();
            });
        }
        init_vtk_renwin() {
            this._vtk_renwin = panel_fullscreen_renwin_sync_1.FullScreenRenderWindowSynchronized.newInstance({
                rootContainer: this.el,
                container: this._vtk_container,
                synchronizerContext: this._synchronizer_context,
            });
        }
        plot() {
            this._vtk_renwin.getRenderWindow().clearOneTimeUpdaters();
            this._decode_arrays();
            const state = object_1.clone(this.model.scene);
            Promise.all(this._promises).then(() => {
                this._sync_plot(state, () => this._on_scene_ready()).then(() => {
                    this._set_camera_state();
                    this._get_camera_state();
                });
            });
        }
        _decode_arrays() {
            const jszip = new util_1.vtkns.ThirdParty.JSZip();
            const arrays = this.model.arrays;
            const registerArray = this.registerArray;
            const arrays_processed = this.model.arrays_processed;
            const model = this.model;
            function load(key) {
                return jszip
                    .loadAsync(atob(arrays[key]))
                    .then((zip) => zip.file("data/" + key))
                    .then((zipEntry) => zipEntry.async("arraybuffer"))
                    .then((arraybuffer) => registerArray(key, arraybuffer))
                    .then(() => {
                    arrays_processed.push(key);
                    model.properties.arrays_processed.change.emit();
                });
            }
            Object.keys(arrays).forEach((key) => {
                if (!this._decoded_arrays[key]) {
                    this._decoded_arrays[key] = true;
                    this._promises.push(load(key));
                }
            });
        }
        _on_scene_ready() {
            if (this._promises.length > 0)
                return;
            this._renderable = true;
            this._camera_callbacks.push(this._vtk_renwin
                .getRenderer()
                .getActiveCamera()
                .onModified(() => this._vtk_render()));
            if (!this._orientationWidget)
                this._create_orientation_widget();
            if (!this._axes)
                this._set_axes();
            this._vtk_renwin.resize();
            this._vtk_render();
        }
        _sync_plot(state, onSceneReady) {
            // Need to ensure all promises are resolved before calling this function
            this._renderable = false;
            this._promises = [];
            this._unsubscribe_camera_cb();
            this._synchronizer_context.setFetchArrayFunction((hash) => {
                return Promise.resolve(this._arrays[hash]);
            });
            const renderer = this._synchronizer_context.getInstance(this.model.scene.dependencies[0].id);
            if (renderer && !this._vtk_renwin.getRenderer())
                this._vtk_renwin.getRenderWindow().addRenderer(renderer);
            return this._vtk_renwin
                .getRenderWindow()
                .synchronize(state).then(onSceneReady);
        }
    }
    exports.VTKSynchronizedPlotView = VTKSynchronizedPlotView;
    VTKSynchronizedPlotView.__name__ = "VTKSynchronizedPlotView";
    class VTKSynchronizedPlot extends vtklayout_1.AbstractVTKPlot {
        constructor(attrs) {
            super(attrs);
            this.outline = util_1.vtkns.OutlineFilter.newInstance(); //use to display bouding box of a selected actor
            const mapper = util_1.vtkns.Mapper.newInstance();
            mapper.setInputConnection(this.outline.getOutputPort());
            this.outline_actor = util_1.vtkns.Actor.newInstance();
            this.outline_actor.setMapper(mapper);
        }
        getActors(ptr_ref) {
            let actors = this.renderer_el.getRenderer().getActors();
            if (ptr_ref) {
                const context = this.renderer_el.getSynchronizerContext(CONTEXT_NAME);
                actors = actors.filter((actor) => {
                    const id_actor = context.getInstanceId(actor);
                    return id_actor ? id_actor.slice(-16) == ptr_ref.slice(1, 17) : false;
                });
            }
            return actors;
        }
        static init_VTKSynchronizedPlot() {
            this.prototype.default_view = VTKSynchronizedPlotView;
            this.define({
                arrays: [p.Any, {}],
                arrays_processed: [p.Array, []],
                enable_keybindings: [p.Boolean, false],
                one_time_reset: [p.Boolean],
                rebuild: [p.Boolean, false],
                scene: [p.Any, {}],
            });
            this.override({
                height: 300,
                width: 300,
            });
        }
    }
    exports.VTKSynchronizedPlot = VTKSynchronizedPlot;
    VTKSynchronizedPlot.__name__ = "VTKSynchronizedPlot";
    VTKSynchronizedPlot.__module__ = "panel.models.vtk";
    VTKSynchronizedPlot.init_VTKSynchronizedPlot();
},
"11e0707a8f": /* models/vtk/panel_fullscreen_renwin_sync.js */ function _(require, module, exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    const util_1 = require("6c442cdcb4") /* ./util */;
    if (util_1.vtk) {
        const DEFAULT_VALUES = {
            containerStyle: null,
            controlPanelStyle: null,
            listenWindowResize: true,
            resizeCallback: null,
            controllerVisibility: true,
            synchronizerContextName: "default",
        };
        const STYLE_CONTROL_PANEL = {
            position: "absolute",
            left: "25px",
            top: "25px",
            backgroundColor: "white",
            borderRadius: "5px",
            listStyle: "none",
            padding: "5px 10px",
            margin: "0",
            display: "block",
            border: "solid 1px black",
            maxWidth: "calc(100vw - 70px)",
            maxHeight: "calc(100vh - 60px)",
            overflow: "auto",
        };
        function panelFullScreenRenderWindowSynchronized(publicAPI, model) {
            // Panel (modification) synchronizable renderWindow
            model.renderWindow = util_1.vtkns.SynchronizableRenderWindow.newInstance({
                synchronizerContext: model.synchronizerContext,
            });
            // OpenGlRenderWindow
            model.openGLRenderWindow = util_1.vtkns.OpenGLRenderWindow.newInstance();
            model.openGLRenderWindow.setContainer(model.container);
            model.renderWindow.addView(model.openGLRenderWindow);
            // Interactor
            model.interactor = util_1.vtkns.RenderWindowInteractor.newInstance();
            model.interactor.setInteractorStyle(util_1.vtkns.InteractorStyleTrackballCamera.newInstance());
            model.interactor.setView(model.openGLRenderWindow);
            model.interactor.initialize();
            model.interactor.bindEvents(model.container);
            publicAPI.getRenderer = () => model.renderWindow.getRenderers()[0];
            publicAPI.removeController = () => {
                const el = model.controlContainer;
                if (el) {
                    el.parentNode.removeChild(el);
                }
            };
            publicAPI.setControllerVisibility = (visible) => {
                model.controllerVisibility = visible;
                if (model.controlContainer) {
                    if (visible) {
                        model.controlContainer.style.display = "block";
                    }
                    else {
                        model.controlContainer.style.display = "none";
                    }
                }
            };
            publicAPI.toggleControllerVisibility = () => {
                publicAPI.setControllerVisibility(!model.controllerVisibility);
            };
            publicAPI.addController = (html) => {
                model.controlContainer = document.createElement("div");
                util_1.applyStyle(model.controlContainer, model.controlPanelStyle || STYLE_CONTROL_PANEL);
                model.rootContainer.appendChild(model.controlContainer);
                model.controlContainer.innerHTML = html;
                publicAPI.setControllerVisibility(model.controllerVisibility);
                model.rootContainer.addEventListener("keypress", (e) => {
                    if (String.fromCharCode(e.charCode) === "c") {
                        publicAPI.toggleControllerVisibility();
                    }
                });
            };
            // Properly release GL context
            publicAPI.delete = util_1.vtk.macro.chain(publicAPI.setContainer, model.openGLRenderWindow.delete, publicAPI.delete);
            // Handle window resize
            publicAPI.resize = () => {
                const dims = model.container.getBoundingClientRect();
                const devicePixelRatio = window.devicePixelRatio || 1;
                model.openGLRenderWindow.setSize(Math.floor(dims.width * devicePixelRatio), Math.floor(dims.height * devicePixelRatio));
                if (model.resizeCallback) {
                    model.resizeCallback(dims);
                }
                model.renderWindow.render();
            };
            publicAPI.setResizeCallback = (cb) => {
                model.resizeCallback = cb;
                publicAPI.resize();
            };
            if (model.listenWindowResize) {
                window.addEventListener("resize", publicAPI.resize);
            }
            publicAPI.resize();
        }
        exports.FullScreenRenderWindowSynchronized = {
            newInstance: util_1.vtk.macro.newInstance((publicAPI, model, initialValues = {}) => {
                Object.assign(model, DEFAULT_VALUES, initialValues);
                // Object methods
                util_1.vtk.macro.obj(publicAPI, model);
                util_1.vtk.macro.get(publicAPI, model, [
                    "renderWindow",
                    "openGLRenderWindow",
                    "interactor",
                    "rootContainer",
                    "container",
                    "controlContainer",
                    "synchronizerContext",
                ]);
                // Object specific methods
                panelFullScreenRenderWindowSynchronized(publicAPI, model);
            }),
        };
    }
},
}, "4e90918c0a", {"index":"4e90918c0a","models/index":"c4b9651916","models/ace":"abb1112c2c","models/layout":"7116a7a602","models/audio":"66d52165db","models/card":"0106b0a1bf","models/comm_manager":"684c940c17","models/deckgl":"d0d2aafca0","models/tooltips":"064eac2866","models/echarts":"c6decbe3f5","models/html":"ed08037ce5","models/ipywidget":"cb7ac8d1fa","models/json":"284504a0cf","models/file_download":"7a99dba4eb","models/katex":"7b859fb3cf","models/location":"aded270681","models/mathjax":"0c21036737","models/player":"79c41bbf71","models/plotly":"47b5ae5c43","models/util":"990b5dd5c7","models/progress":"765e9cea08","models/singleselect":"ff9dd91f7b","models/state":"38b2bc9574","models/vega":"294adeb985","models/video":"b0c3e9e9c2","models/videostream":"3c7145a2fa","models/vtk/index":"c51f25e2a7","models/vtk/vtkjs":"6ed30646d7","models/vtk/vtklayout":"021b2a3929","models/vtk/util":"6c442cdcb4","models/vtk/vtkcolorbar":"c010237f8b","models/vtk/vtkvolume":"087f1e0be6","models/vtk/vtkaxes":"3ae7537200","models/vtk/vtksynchronized":"4baab0b7ce","models/vtk/panel_fullscreen_renwin_sync":"11e0707a8f"}, {});
})

//# sourceMappingURL=panel.js.map
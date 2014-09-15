// This simple extension convines hide dash and hide workspace extension. 
// Please visit https://github.com/xenatt/Minimalism-Gnome-Shell

const GLib = imports.gi.GLib;
const Gio = imports.gi.Gio;
const Lang = imports.lang;
const Main = imports.ui.main;
const ThumbnailsSlider = imports.ui.overviewControls.ThumbnailsSlider.prototype;

function init() {
	return new simpleOverview();
}

const simpleOverview = new Lang.Class({
    Name: 'simpleOverview',

	_init: function() {
		this.observer = null;

		// store the values we are going to override
		// for hide dash
		this.actorX = Main.overview.viewSelector.actor.x;
		this.actorWidth = Main.overview.viewSelector.actor.get_width();

		// for hide workspace
		this._getAlwaysZoomOut = ThumbnailsSlider._getAlwaysZoomOut;
        this._getNonExpandedWidth = ThumbnailsSlider.getNonExpandedWidth;
	},
	
	enable: function() {
		// for hide dash
		this.observer = Main.overview.connect("showing", Lang.bind(this, this._hide));
		// for hide workspace
        ThumbnailsSlider._getAlwaysZoomOut = function () { return false; }
        ThumbnailsSlider.getNonExpandedWidth = function () { return 0; }
	},
	
	disable: function() {
		// global.log("disable hide-dash");
		Main.overview.disconnect(this.observer);
		this._show();

		// restore values
		ThumbnailsSlider._getAlwaysZoomOut = this._getAlwaysZoomOut;
        ThumbnailsSlider.getNonExpandedWidth = this._getNonExpandedWidth;
	},

	_hide: function() {
		// global.log("show dash");
		Main.overview._dash.actor.hide();
		Main.overview.viewSelector.actor.set_x(0);
		Main.overview.viewSelector.actor.set_width(Main.overview._group.get_width());
		Main.overview.viewSelector.actor.queue_redraw();
	},

	_show: function() {
		// global.log("hide dash");
		Main.overview._dash.actor.show();
		Main.overview.viewSelector.actor.set_x(this.actorX);
		Main.overview.viewSelector.actor.set_width(this.actorWidth);
		Main.overview.viewSelector.actor.queue_redraw();
	}
});

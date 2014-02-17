(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  App.module("Views", function(Views, App, Backbone, Marionette, $, _) {
    var _ref;
    return Views.EnergyTrends = (function(_super) {
      __extends(EnergyTrends, _super);

      function EnergyTrends() {
        _ref = EnergyTrends.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      EnergyTrends.prototype.template = templates.energy_trends;

      EnergyTrends.prototype.onShow = function() {
        return new App.Utils.LineChart([[2, 5, 7, 3, 15, 4, 15, 2, 10, 10, 20, 6, 30, 10, 20], [2, 5, 2, 3, 2, 4, 2, 2, 10, 10, 20, 50, 30, 60, 20], [90, 10, 5, 100]]);
      };

      return EnergyTrends;

    })(Marionette.ItemView);
  });

}).call(this);

(function() {
  var LoadAction, _base, _ref, _ref1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  if ((_ref = window.Webbzeug) == null) {
    window.Webbzeug = {};
  }

  if ((_ref1 = (_base = window.Webbzeug).Actions) == null) {
    _base.Actions = {};
  }

  window.Webbzeug.Actions.Load = LoadAction = (function(_super) {

    __extends(LoadAction, _super);

    function LoadAction() {
      return LoadAction.__super__.constructor.apply(this, arguments);
    }

    LoadAction.prototype.availableParameters = function() {
      return {
        id: {
          name: 'ID',
          type: 'number',
          min: 0,
          max: 255,
          "default": 0
        }
      };
    };

    LoadAction.prototype.render = function(contexts) {
      LoadAction.__super__.render.call(this);
      return this.app.memory[this.getParameter('id')];
    };

    return LoadAction;

  })(Webbzeug.Action);

}).call(this);

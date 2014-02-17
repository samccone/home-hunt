(function(){
  window.templates = window.templates || {};
  function attrs(obj, escaped){
  var buf = []
    , terse = obj.terse;

  delete obj.terse;
  var keys = Object.keys(obj)
    , len = keys.length;

  if (len) {
    buf.push('');
    for (var i = 0; i < len; ++i) {
      var key = keys[i]
        , val = obj[key];

      if ('boolean' == typeof val || null == val) {
        if (val) {
          terse
            ? buf.push(key)
            : buf.push(key + '="' + key + '"');
        }
      } else if (0 == key.indexOf('data') && 'string' != typeof val) {
        buf.push(key + "='" + JSON.stringify(val) + "'");
      } else if ('class' == key) {
        if (escaped && escaped[key]){
          if (val = escape(joinClasses(val))) {
            buf.push(key + '="' + val + '"');
          }
        } else {
          if (val = joinClasses(val)) {
            buf.push(key + '="' + val + '"');
          }
        }
      } else if (escaped && escaped[key]) {
        buf.push(key + '="' + escape(val) + '"');
      } else {
        buf.push(key + '="' + val + '"');
      }
    }
  }

  return buf.join(' ');
}
function escape(html){
  return String(html)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}
function nulls(val) { return val != null && val !== '' }
function joinClasses(val) { return Array.isArray(val) ? val.map(joinClasses).filter(nulls).join(' ') : val; }
var jade = {
  attrs: attrs,
  escape: escape 
};templates['commute_time'] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),time = locals_.time;buf.push("<li class=\"tile third demographic commute\"><div class=\"inner-tile-wrap\"><img src=\"../images/avg-commute.png\"/><p class=\"subheadline\">avg. commute</p><p class=\"time\">" + (jade.escape((jade.interp = ~~time) == null ? '' : jade.interp)) + "\n<span> minutes </span></p></div></li>");;return buf.join("");
};
templates['energy_fact'] = function anonymous(locals) {
var buf = [];
buf.push("<li class=\"tile full fact\"><h2 class=\"roboto-condensed-light\">did you know?</h2><div class=\"inner-tile-wrap\"><img src=\"images/infographics/light-bulb.png\" class=\"left\"/><p class=\"roboto-light fact-copy left\">If every home in the U.S. switched just one inefficient light for an Energy Star one, that would be equivalent to taking 800,000 vehicles off the road in term of greenhouse gas emissions.</p><div class=\"cl\"></div></div></li>");;return buf.join("");
};
templates['energy_trends'] = function anonymous(locals) {
var buf = [];
buf.push("<div class=\"inner-tile-wrap\"><svg viewBox=\"0 0 750 422\" class=\"chart\"></svg><ul class=\"toggle-chart\"><li data-id=\"SEDS.ESRCD\" class=\"disabled\"><img src=\"../images/chart/elec-active@2x.png\" width=\"32\" height=\"34\" alt=\"Elec\"/><div class=\"cl\"></div><span class=\"energy-type teal\">elec</span></li><li data-id=\"NG.N3010\"><img src=\"../images/chart/gas-active@2x.png\" width=\"30\" height=\"28\" alt=\"Gas\"/><div class=\"cl\"></div><span class=\"energy-type red\">gas</span></li><li data-id=\"SEDS.DFRCD\" class=\"disabled\"><img src=\"../images/chart/oil-active@2x.png\" width=\"20\" height=\"30\" alt=\"Oil\"/><div class=\"cl\"></div><span class=\"energy-type purple\">oil</span></li><li data-id=\"SEDS.WDRCD\"><img src=\"../images/chart/wood-active@2x.png\" width=\"30\" height=\"30\" alt=\"Wood\"/><div class=\"cl\"></div><span class=\"energy-type blue\">wood</span></li></ul></div>");;return buf.join("");
};
templates['family_size'] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),size = locals_.size;buf.push("<li class=\"tile third demographic size\"><div class=\"inner-tile-wrap\"><img src=\"../images/family-size.png\"/><div class=\"contained\"><p class=\"subheadline\">avg. family size</p><p class=\"time\">" + (jade.escape((jade.interp = size.toFixed(1)) == null ? '' : jade.interp)) + " people</p></div></div></li>");;return buf.join("");
};
templates['grid_layout'] = function anonymous(locals) {
var buf = [];
buf.push("<h2 class=\"chart-headline roboto-condensed-light\">energy type trends</h2><h3 class=\"chart-subheadline robot-regular\">over the last 10 years</h3><div class=\"energy-trends tile full\"></div><div class=\"homes\"></div>");;return buf.join("");
};
templates['home_grid_item'] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),homeBath = locals_.homeBath,homeBed = locals_.homeBed,homeImage = locals_.homeImage,energyCost = locals_.energyCost,homePrice = locals_.homePrice,homeSqFt = locals_.homeSqFt;buf.push("<div class=\"inner-tile-wrap\"><div class=\"home-details\"><div class=\"bath\">" + (jade.escape((jade.interp = homeBath) == null ? '' : jade.interp)) + " Bath</div><div class=\"bed\">" + (jade.escape((jade.interp = homeBed) == null ? '' : jade.interp)) + " Bed</div></div><div class=\"home-photo-wrap\"><div class=\"overlay\"></div><div" + (jade.attrs({ 'data-original':(homeImage), "class": [('home-photo'),('lazy')] }, {"data-original":true})) + "></div></div><div class=\"monthly-summary\">");
if (energyCost)
{
buf.push("<div class=\"green-button-cost\"><h5>electrical bill</h5><div class=\"energy-cost\">$" + (jade.escape((jade.interp = energyCost) == null ? '' : jade.interp)) + " a month</div></div>");
}
else
{
buf.push("<div class=\"green-button-drop\"><p>Drag Green Button data for monthly estimate</p><input type=\"file\"/></div>");
}
buf.push("</div></div><div class=\"bottom-meta-info\"><div class=\"home-meta-col\"><h4><span class=\"inline-icon home-icon\"></span><span class=\"price\">" + (jade.escape(null == (jade.interp = homePrice) ? "" : jade.interp)) + "</span></h4></div><div class=\"home-meta-col\"><h4><span class=\"inline-icon sq-ft-icon\"></span>" + (jade.escape((jade.interp = homeSqFt) == null ? '' : jade.interp)) + " sq ft.</h4></div></div>");;return buf.join("");
};
templates['locating'] = function anonymous(locals) {
var buf = [];
buf.push("<div class=\"loading-view\"><h2>Finding your location...</h2></div>");;return buf.join("");
};
templates['old_homes'] = function anonymous(locals) {
var buf = [];
var locals_ = (locals || {}),percent = locals_.percent;buf.push("<li class=\"tile third demographic age\"><div class=\"inner-tile-wrap\"><img src=\"../images/home-age.png\"/><p class=\"percent\">" + (jade.escape((jade.interp = ~~(percent*100)) == null ? '' : jade.interp)) + "%</p><p class=\"subheadline\">homes build < 1900</p></div></li>");;return buf.join("");
};
})();
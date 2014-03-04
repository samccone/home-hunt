App.module "Utils", (Utils, App, Backbone, Marionette, $, _) ->
  marginBottom    = 22
  marginTop       = 22
  height          = 391 + marginBottom
  width           = 750
  leftRightMargin = 10
  diameter        = 4

  class Utils.LineChart
    constructor: (@data) ->
      @chart = d3.select('.chart')
                .attr('width', width)
                .attr 'height', height

      @y = d3.scale.linear()
            .domain([0, d3.max(_.flatten(_.map(@data, (d) -> d.data)))])
            .range([height-marginBottom, marginTop])

      @x = d3.scale.linear()
            .domain([0, @data[0].data.length])
            .range([leftRightMargin, width-leftRightMargin])

      @line = d3.svg.line()
             .interpolate("monotone")
             .x((d, i) => @x(i))
             .y @y


      @data.forEach (_d, i, initial = true) => @drawLine.apply(@, arguments)

      @drawAxis()
      @addToolTip()

    addToolTip: ->
      @chart.append('svg:rect')
            .attr('class', 'chart-tool-tip inactive')
            .attr('rx', 5)
            .attr('ry', 5)
            .attr('width', "60")
            .attr('height', "40")

      @chart.append('svg:text')
            .attr('width', "60")
            .attr('class', 'chart-tool-tip-text')

    updateTooltip: (value, node) ->
      y = parseFloat(node.getAttribute('cy'))
      x = parseFloat(node.getAttribute('cx'))

      @chart.select('.chart-tool-tip')
        .attr('class', 'chart-tool-tip')
        .transition().duration(300)
        .attr('x', x - 30)
        .attr('y', y - 60)

      @chart.select('.chart-tool-tip-text')
            .transition().duration(300)
            .attr('dx', x - 20)
            .attr('dy', y - 34)
            .text("$#{value}")

    drawAxis: ->
      xAxis = d3.svg.axis()
              .scale(@x)
              .orient("bottom")
              .tickFormat (d, i) ->
                1969 + ~~(44 * i/8)

      @chart.append('g')
           .attr('transform', -> "translate(0, #{height - marginBottom})")
           .call xAxis

    drawLine: (d, i, initial) ->
      _this = this;

      empty= d.data.map -> 0

      if initial
        @chart.append("svg:path").attr("d", @line(empty))
                              .attr('class', "line#{i} id-#{d.id}")
                              .transition().duration(500)
                              .attr("d", @line(d.data))
      else
        @chart.selectAll("circle.line#{i}")
           .attr('cy', height-marginBottom)

        @chart.select("path.line#{i}").attr("d", @line(empty))
                              .transition().duration(500)
                              .attr("d", @line(d.data))

      @chart.selectAll("circle.line#{i}")
           .data(empty).enter()
           .append('circle')
           .attr('class', "line#{i} id-#{d.id}")
           .attr('cx', @line.x())
           .attr('cy', @line.y())
           .attr('r', diameter)
           .on("mouseover", (v) ->
            $('circle[r!="4"]').each (i, n) ->
              d3.select(n)
                .transition().duration(300)
                .attr("r", 4)

            d3.select(this)
              .transition().duration(300)
              .attr("r", 10)

            _this.updateTooltip(v, this) )

      @chart.selectAll("circle.line#{i}")
           .data(d.data)
           .transition().duration(500)
           .attr('cx', @line.x())
           .attr('cy', @line.y())

    redrawLine: (i) ->
      @drawLine @data[i], i, false

var data = [100];

var y = d3.scale.linear()
    .domain([0, d3.max(data)])
    .range([0, 400]);

d3.select(".chart")
  .selectAll("div")
    .data(data)
  .enter().append("div")
    .style("height", function(d) { return y(d) + "px"; })
    .style("z-index", function(d, i) { return i; })
    .text(function(d) { return d + "%"; });
root = @
if not root.app? then app = root.app = {} else app = root.app

app.map = new L.Map "map",
  center: [34.267990, -112.085034]
  zoom: 7

app.osm_layer = new L.TileLayer 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
  attribution: 'Map data © OpenStreetMap contributors'

app.map.addLayer app.osm_layer

app.svg = d3.select(app.map.getPanes().overlayPane).append "svg"
app.g = app.svg.append("g").attr "class", "leaflet-zoom-hide"

xhr_url = "http://data.usgin.org/arizona/ows?service=WFS&version=1.0.0&request=GetFeature&outputFormat=text/javascript&typeName=azgs:earthquakedata&format_options=callback:dothis"

$.ajax
  url:xhr_url
  dataType:'jsonp'
  jsonpCallback:'dothis'

dothis = (jsondata) ->
  app.mydata = jsondata
  console.log "HELLO"
  return app.mydata
"""
d3.json xhr_url, (jsondata) ->
  app.mydata = jsondata
  return app.mydata
"""
console.log app.mydata
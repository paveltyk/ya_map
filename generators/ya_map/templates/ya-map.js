function buildPlacemark(id, geo_point, options, extras) {
  var pm = new YMaps.Placemark(geo_point, options);
  if (extras) {
    if (extras.iconContent) pm.setIconContent(extras.iconContent);
    if (extras.name) pm.name = extras.name;
    if (extras.description) pm.description = extras.description;
  }
  yandexObjectsMapper[id] = pm;
  return pm;
}

function destroyAllOverlays() {
  for (var i in yandexObjectsMapper) {
    map.removeOverlay(yandexObjectsMapper[i]);
    delete yandexObjectsMapper[i]
  }
}
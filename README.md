# mapproxy za Hrvatsku (za geoportal.dgu.hr WMS)

Local caching / faster loading of Croatian WMS

## Instructions for installation

- run `sudo apt-get install mapproxy`
- run `./runme.sh`

## Instructions for JOSM TMS setup (fast!)
- go to `Imagery` / `Imagery preferences`
- click `+TMS` button on the lower-right part of the window
- click `2. Enter URL`
- paste TMS URL from the list below (like `http://localhost:8080/tiles/1.0.0/dgu_2011/webmercator_hr/{zoom}/{x}/{y}.jpeg`)
- click `5. Enter name for this layer`
- paste name of the layer (like `dgu.hr: Croatia 2011 Aerial imagery (mapproxy)`)
- click `OK`
- repeat for all wanted layers

When adding layers, you may want to click on "eye" icon and increase "Gamma", so imagery is not so washed-out

## List of layers and TMS URLs

- dgu.hr: Croatia 2011 Aerial imagery (mapproxy)

  `http://localhost:8080/tiles/1.0.0/dgu_2011/webmercator_hr/{zoom}/{x}/{y}.jpeg`
  
- dgu.hr: Croatia 2014-2016 Aerial imagery (mapproxy)

  `http://localhost:8080/tiles/1.0.0/dgu_2014_2016/webmercator_hr/{zoom}/{x}/{y}.jpeg`
  
- dgu.hr: Croatia 2017-2018 Aerial imagery (mapproxy)

  `http://localhost:8080/tiles/1.0.0/dgu_2017_2018/webmercator_hr/{zoom}/{x}/{y}.jpeg`
  
- dgu.hr: Croatia 2019-2020 Aerial imagery (mapproxy)

  `http://localhost:8080/tiles/1.0.0/dgu_2019_2020/webmercator_hr/{zoom}/{x}/{y}.jpeg`
  
- dgu.hr: HOK (mapproxy)

  `http://localhost:8080/tiles/1.0.0/dgu_HOK/webmercator_hr/{zoom}/{x}/{y}.png`
  
- dgu.hr: Topo 25 (mapproxy)

  `http://localhost:8080/tiles/1.0.0/dgu_TK_25/webmercator_hr/{zoom}/{x}/{y}.png`
  
- dgu.hr: Topo 25 new (mapproxy)

  `http://localhost:8080/tiles/1.0.0/dgu_TK25_NOVI/webmercator_hr/{zoom}/{x}/{y}.png`
  
- OSM tiles MapProxy demo (mapproxy)

  `http://localhost:8080/tiles/1.0.0/osm_demo/webmercator_hr/{zoom}/{x}/{y}.png`



## (Deprecated) Instruction for JOSM WMS setup (slower, avoid)
- go to `Imagery` / `Imagery preferences`
- click `+WMS` button on the lower-right part of the window
- paste `http://localhost:8080/service?REQUEST=GetCapabilities` under `2. Enter GetCapabilities URL`
- click `3. Get Layers`
- check box `Store WMS endpoint only, select layers at usage` under `4. Select layers`
- paste `dgu.hr mapproxy` under `7. Enter name for this layer`
- click `OK`
- click `OK`

# TODO:
- setup layer boundaries in a way that doesn't break TMS
- make a merged (and noncached) layer for 2018+2019 (or 2017+2018?)
- document authenticated WMS with no watermark
- try to speed up by using WMTS instead of WMS

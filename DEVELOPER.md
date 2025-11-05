1. find new sources at https://geoportal.nipp.hr/ (Orthoimagery category)
   e.g. https://geoportal.nipp.hr/geonetwork/srv/hrv/catalog.search#/metadata/59d0e399-e9c9-4b90-8341-f9fc84ac7f5f
   
   (also can look at https://geoportal.dgu.hr/, hamburger menu at top left, "Metapodaci", but it lags)
  
2. it contains WMS URL, e.g. https://geoportal.dgu.hr/services/inspire/orthophoto_2021_2022/wms?service=WMS&request=GetCapabilities 

3. open that URL in browser, and search for "<Layer queryable" -- we'll need its "Name" e.g.
   ```
   <Name>OI.OrthoimageCoverage</Name>
   <Title>Digitalni ortofoto u mjerilu 1:5000_2021/22 godina</Title>
   ```
   
   We'll also need its bounding box in CRS:84 (EPSG:4326, AKA WGS84) projection, 
   e.g. `<BoundingBox CRS="CRS:84" minx="13.41104433989873" miny="42.331528030505226" maxx="19.510865658171447" maxy="46.561631712677226"/>`

4. in mapproxy.yaml section `layer:` add a new block similar to previous ones, but replace names/years in all places, e.g.
   ```
    - name: dgu_2021_2022
      title: dgu.hr - Croatia 2021-2022 Aerial imagery
      sources: [dgu_cache_2021_2022]
   ```

5. in mapproxy.yaml section `caches:` add a new block similar to previous ones, but replace names/years to match those from step 4, e.g.
   ```
    dgu_cache_2021_2022:
      sources: [dgu_wms_2021_2022]
      format: image/jpeg
      grids: [webmercator_hr]
   ```

   
6. in mapproxy.yaml section `sources:` add a new block similar to previous ones, but replace names/years to match those from step 5, so:

   - for `url:`, use URL from step 2, but with everything after `?` removed, e.g.
     `https://geoportal.dgu.hr/services/inspire/orthophoto_2021_2022/ows?`
   - for `layers:`, use Name from step 3, e.g. `OI.OrthoimageCoverage`
   - for `bbox:`, use BoundingBox from step 3
   - for `bbox_srs:` use `EPSG:4326` (that is the same as CRS:84)

   You can check if bounding box looks sane at e.g. http://bboxfinder.com/

   e.g.
   ```
    dgu_wms_2021_2022:
      type: wms
      req:
        url: https://geoportal.dgu.hr/services/inspire/orthophoto_2021_2022/ows?
        #url: https://geoportal.dgu.hr/services/inspire/orthophoto_2021_2022/ows?authKey=12345
        layers: OI.OrthoimageCoverage
      coverage:
        bbox: [12.7076,41.6049,19.7065,46.5583]   # from geoportal.dgu.hr / Metapodaci
        bbox_srs: 'EPSG:4326'
   ```
  
7. run local mapproxy via `./runme.sh` (needs mapproxy to be installed via `apt install mapproxy`)

8. open http://127.0.0.1:8080/demo/ in web browser, find your layer down in "TMS" section, and click on that layer's `jpeg` link to test.
   Beware of possible worse resolution (see README.md / TODO for details!)

9. `git commit -a`, `git push` to publish changes

# mapproxy za Hrvatsku (za geoportal.dgu.hr WMS)

Local caching / faster loading of Croatian WMS

- run `./runme.sh`
- in JOSM:
  - go to Imagery / Imagery preferences / +WMS
  - paste `http://localhost:8080/service?REQUEST=GetCapabilities` under `2. Enter GetCapabilities URL`
  - click `3. Get Layers`
  - check box `Store WMS endpoint only, select layers at usage` under `4. Select layers`
  - enter `dgu.hr mapproxy` under `7. Enter name for this layer"
  - click OK
  - click OK

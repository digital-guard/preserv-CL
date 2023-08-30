#!/bin/bash










# layer via:
rm -rf /tmp/sandbox/_pk15200000201_001 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk15200000201_001
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org http://dl.digital-guard.org/7c1cd5cd90518c829dae09cb6b94eaa67979a945e318e469e9d2a1126d037864.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/7c1cd5cd90518c829dae09cb6b94eaa67979a945e318e469e9d2a1126d037864.zip && sudo chmod 664 /var/www/dl.digital-guard.org/7c1cd5cd90518c829dae09cb6b94eaa67979a945e318e469e9d2a1126d037864.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk15200000201101_p1_via CASCADE"
cd /tmp/sandbox/_pk15200000201_001; 7z  x -y /var/www/dl.digital-guard.org/7c1cd5cd90518c829dae09cb6b94eaa67979a945e318e469e9d2a1126d037864.zip "*CALLES*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=3857"
cd /tmp/sandbox/_pk15200000201_001; shp2pgsql -D   -s 3857 "CALLES.shp" pk15200000201101_p1_via | psql -q postgres://postgres@localhost/ingest1 2> /dev/null

psql postgres://postgres@localhost/ingest1 -c "CREATE VIEW vw1_pk15200000201101_p1_via AS SELECT gid, comuna, nom_comuna, nom_calle, clase_com, \
( CASE textregexeq(nom_calle,'^[[:digit:]]+(\.[[:digit:]]+)?$'') \
  WHEN TRUE THEN clase_com || ' ' || nom_calle \
  ELSE nom_calle \
END ) as via, \
geom FROM $(tabname)"
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.any_load('shp2sql','/tmp/sandbox/CALLES.shp','via_full','vw1_pk15200000201101_p1_via','15200000201101','7c1cd5cd90518c829dae09cb6b94eaa67979a945e318e469e9d2a1126d037864.zip',array[]::text[],5,1)"
psql postgres://postgres@localhost/ingest1 -c "DROP VIEW vw1_pk15200000201101_p1_via"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk15200000201101_p1_via CASCADE"
rm -f /tmp/sandbox/_pk15200000201_001/*CALLES.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-CL2021/data/LL/PuertoMontt/_pk0002.01/via
rm -rf /var/gits/_dg/preservCutGeo-CL2021/data/LL/PuertoMontt/_pk0002.01/via/*.geojson
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.publicating_geojsons('via','CL-LL-PuertoMontt','/var/gits/_dg/preservCutGeo-CL2021/data/LL/PuertoMontt/_pk0002.01/via','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-CL2021/data/LL/PuertoMontt/_pk0002.01/via
sudo find /var/gits/_dg/preservCutGeo-CL2021/data/LL/PuertoMontt/_pk0002.01/via -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-CL2021/data/LL/PuertoMontt/_pk0002.01/via -type f -exec chmod 664 {} \;





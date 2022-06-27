//1.Import stations
MATCH (s:Station) DETACH DELETE s;

DROP CONSTRAINT UniqueStationName;

CREATE CONSTRAINT UniqueStationName ON (s:Station) ASSERT s.name IS UNIQUE;

LOAD CSV WITH HEADERS FROM 'file:///stations.csv' AS row
WITH row
CREATE (:Station{
    station_code: row.station_code,
    station: row.station,
    name: row.state + "/" + row.station_code + "/" + row.station,
    state: row.state,
    region: row.region,
    height: toFloat(row.height),
    latitude: toFloat(row.latitude),
    longitude: toFloat(row.longitude),
    first_date: date(row.first_date)
})
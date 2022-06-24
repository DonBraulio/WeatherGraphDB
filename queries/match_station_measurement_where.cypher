//match station_measurement-where
MATCH (s:Station)-->(m:Measurement) WHERE m.hour = time("2:00") AND m.date > date("2019-01-01") RETURN s, m LIMIT 10
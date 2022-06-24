//match station_measurement-edge
MATCH (s:Station)-[:MEASURED{hour: time("2:00"), date:date("2019-01-01")}]->(m:Measurement) RETURN m,s
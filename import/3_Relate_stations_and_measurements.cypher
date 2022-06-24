//3.Relate stations and measurements
:auto MATCH (s:Station)
MATCH (m:Measurement{station_name: s.name})
CALL{
    WITH s, m
    MERGE (s)-[:MEASURED{date:m.date, hour:m.hour}]->(m)
} IN TRANSACTIONS OF 10000 ROWS
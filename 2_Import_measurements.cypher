//2.Import measurements
MATCH (m:Measurement) DETACH DELETE m;

DROP CONSTRAINT UniqueMeasurementStationTime;

CREATE CONSTRAINT UniqueMeasurementStationTime ON (m:Measurement) ASSERT (m.station_name, m.name) IS UNIQUE;

:auto LOAD CSV WITH HEADERS FROM 'file:///central_west.csv' AS row
CALL{
    WITH row
    CREATE (:Measurement {
        station_name: row.state + "/" + row.station_code + "/" + row.station,
        name: row["Data"] + "T" + row["Hora"],
        date: date(row["Data"]),
        hour: time(row["Hora"]),
        latitude: toFloat(row.latitude),
        longitude: toFloat(row.longitude),
        heigth: toFloat(row.height),
        radiation: toInteger(row["RADIACAO GLOBAL (Kj/m²)"]),
        temperature: toFloat(row["TEMPERATURA DO PONTO DE ORVALHO (°C)"]),
        wind_direction: toInteger(row["VENTO, DIREÇÃO HORARIA (gr) (° (gr))"]),
        wind_speed: toFloat(row["VENTO, VELOCIDADE HORARIA (m/s)"]),
        pressure: toFloat(row["PRESSAO ATMOSFERICA AO NIVEL DA ESTACAO, HORARIA (mB)"]),
        humidity: toInteger(row["UMIDADE RELATIVA DO AR, HORARIA (%)"]),
        rain: toFloat(row["PRECIPITAÇÃO TOTAL, HORÁRIO (mm)"])
    })
} IN TRANSACTIONS OF 10000 ROWS
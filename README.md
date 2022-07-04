# WeatherGraphDB
Analysis of spatio-temporal weather data using a graph database (neo4j)

The meat of this project is in the jupyter notebook, and the `import/*.cypher` queries needed to create the database.

## How to run the project
1. Download `central_west.csv` and `stations.csv` from [Brazil Weather Surface dataset on Kaggle](https://www.kaggle.com/datasets/PROPPG-PPG/hourly-weather-surface-brazil-southeast-region)
1. Install neo4j Desktop.
1. Copy both downloaded CSV files into the neo4j workspace (i.e: in neo4j Desktop, create a project, find the "three dots menu" of the project, click "Open folder" and select "import" folder option. Copy both CSV files into that folder.)
1. Run the three cypher queries available on the [import/](import/) folder of this project (careful, not the previous import/ folder, we picked an intentionally confusing name, sorry about that).
1. Create a virtualenv or whatever and then `pip install -r requirements.txt`.
1. Open the [jupyter notebook](BDNR2022_Proyecto_Final.ipynb), note that it's all written in spanish and ask yourself why these steps are in english.

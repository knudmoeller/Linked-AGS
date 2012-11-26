# Linked AGS #

**Linked AGS** is a refence dataset for administrative regions in Germany, based on the official identifier system (the AGS or [Amtlicher Gemeindeschlüssel](http://de.wikipedia.org/wiki/Amtlicher_Gemeindeschlüssel) and Regionalschlüssel).


## URI Structure ##

In a nutshell, the structure of the **AGS** is made up of 8 digits, which are a concatenation of identifiers from higher-order administrative regions down to lower-order administrative regions. In detail, the AGS is structured as follows:

    BUNDESLAND          2 digits
    REGIERUNGSBEZIRK    1 digit
    KREIS               2 digits
    GEMEINDE            3 digits
    
    BUNDESLAND - REGIERUNGSBEZIRK - KREIS - GEMEINDE
    e.g.: 12 0 64 340 = Neuhardenberg
  
The **Regionalschlüssel** (ARS) adds four more digits for the Gemeindeverband:

    BUNDESLAND - REGIERUNGSBEZIRK - KREIS - GEMEINDEVERBAND - GEMEINDE
    e.g.: 12 0 64 5410 340 = Neuhardenberg

The current URI structure of the dataset follows the ARS:

    http://datalysator.com/lod/ags/BUNDESLAND/REGIERUNGSBEZIRK/KREIS/GEMEINDEVERBAND/GEMEINDE
    e.g.: http://datalysator.com/lod/ags/12/0/64/5410 = Neuhardenberg

## Sources ##

Linked AGS is derived mainly from the [Gemeindeverzeichnis](https://www.destatis.de/DE/ZahlenFakten/LaenderRegionen/Regionales/Gemeindeverzeichnis/Gemeindeverzeichnis.html) of the Federal Statistics Office of Germany (Statistisches Bundesamt or [Destatis](https://www.destatis.de)). Destatis provides a comprehensive Excel table with AGS, ARS and additional data (size, population, lat/long coordinates of geographic centre, etc.) for almost all administrative regions in Germany (subdivisions of larger cities such as Berlin or Hamburg are missing).

The original Excel file is exported to CSV format, filtered to prevent duplicate entries on different administrative levels and finally converted to RDF using a fork of [Vertere-RDF](https://github.com/knudmoeller/Vertere-RDF).

The data is then enriched with links to [DBpedia](http://dbpedia.org) and [Geonames](http://geonames.org), using a combination of SPARQL processing and scripting. The linking to DBpedia and Geonames is currently incomplete.

The final dataset is at `output_data/final.ttl`.

(C) 2012 Knud Möller

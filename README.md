# preserv-CL
[Preservación digital](https://en.wikipedia.org/wiki/Digital_preservation) de las principales fuentes de la **base de datos AddressForAll-Chile**, mantenida por el [Instituto AddressForAll](http://addressforall.org/).

A Chile se le asignó: en el contexto [ISO&nbsp;3166](https://en.wikipedia.org/wiki/ISO_3166) el geocódigo [**CL**](https://en.wikipedia.org/wiki/ISO_3166-2:CL) y el número [**152**](https://en.wikipedia.org/wiki/ISO_3166-1_numeric); en [Wikidata](https://wikidata.org) el identificador [Q298](http://wikidata.org/entity/Q298); en [OpenStreetMap](https://osm.org) el identificador de [*relación* 167454](http://osm.org/relation/167454).

## Organización territorial y sus geocódigos
El territorio nacional y sus subdivisiones representam **jurisdiciones**:

* El país está dividido en **16 Regiones** que son administradas por un intendente designado por el presidente de la república.<br/>Los geocódigos de las regiones siguen la convención registrada por [ISO 3166‑2:CL](https://en.wikipedia.org/wiki/ISO_3166-2:CL). El Ministerio de Bienes Nacionales también estableció geocódigos numéricos de regiones (en contexto dos Códigos Únicos Territoriales - CUT). En OpenStreetMap se acuerda que la subdivisión por regiones corresponde al *nivel administrativo 4*.

* Las regiones se subdividem en **56 provincias** que son administradas por un gobernador designado por el presidente de la república.<br/>Geocódigos numéricos CUT.

* Las provincia se subdividem en **346 comunas** que están gobernadas por un alcalde y un concejo elegidos. <br/>Geocódigos numéricos CUT.

Los catastros urbanos se encuentran en las comunas.

La jurisdicción que asigna nombres a las calles y el sistema de numeración urbana es la comuna.

## Organización de este repositorio

En este *git*, **solo se guardan los metadatos**, es decir, descriptores de entidad, como nombres y códigos geográficos &mdash; mapas y otros datos brutos, almacenados externamente porque son muy grandes.  Posteriormente, los "datos en bruto", no estandarizados, se convierten en "datos filtrados" y se conservan en lo [*git* preservCutGeo‑CL2021](http://git.digital-guard.org/preservCutGeo-CL2021).

Los metadatos se organizaron de la siguiente manera, en la carpeta [`/data`](./data):

* [`/data`](./data): datos originales de **entrada**, es decir, metadatos proporcionados para el sistema.
   * `jurisdictionLevel*.csv`:  jurisdicciones (en todos los niveles) y sus geocódigos. La primera subdivisión es [jurisdictionLevel4.csv](./data/jurisdictionLevel4.csv).
   * [`donor.csv`](./data/donor.csv): donantes de paquetes de datos. Metadatos de las instituciones que brindan datos oficiales. (pendente)
   * [`donatedPack.csv`](./data/cl-donatedPack.csv): descriptores de los archivos donados. (pendente)
   * *paquetes* (carpetas `_packXX`): *hash*  y otros descriptores de archivos almacenados externamente, así como `makefile` y otros descriptores de proceso para descomprimir estos archivos y llevarlos a la base de datos (PostregSQL)... 

* [`/data/out`](./data/out): resultados generados por el sistema (**salida**), es decir, metadatos creados a partir de los algoritmos y estadísticas aplicados a los datos de `_pack`.

## Licencia
[Licencia CC0](https://creativecommons.org/publicdomain/zero/1.0/deed.es).

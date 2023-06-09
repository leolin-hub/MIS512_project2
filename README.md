# Database Project Final
## Mini World
```
此資料集主題為2022年美國國內航線詳盡資料，除了起飛降落資訊，也納入機場、飛機機種、起飛天氣資訊。
```
## 資料集列表和欄位說明

資料集來源：https://www.kaggle.com/datasets/jl8771/2022-us-airlines-domestic-departure-data?select=CompleteData.csv
```
選取Completedata.csv和Stations.csv來作為匯入Oracle的資料表。
Completedata囊括起飛降落、機場、飛機機種、起飛天氣等欄位
    ● FL_DATE：飛行日期
    ● DEP_HOUR：飛行時間
    ● MKT_UNIQUE_CARRIER：
      行銷承運人航班代碼，用以辨識和區分在不同系統和資料庫的航班
    ● MKT_CARRIER_FL_NUM：行銷承運人航班編號
    ● OP_UNIQUE_CARRIER：實際執行航空公司專屬代碼
    ● OP_CARRIER_FL_NUM：實際執行航空公司專屬編號
    ● TAIL_NUM：機尾編號(= 車牌號碼)
    ● ORIGIN：出發機場代碼
    ● DEST：目的地機場代碼
    ● DEP_TIME：出發的日期時間
    ● CRS_DEP_TIME：CRS出發的日期時間
    ● TAXI_OUT：滑行離場時間(mins)
    ● DEP_DELAY：起飛延誤時間
    ● AIR_TIME：航空時間
    ● DISTANCE：機場間的距離		
    ● CANCELED：
      取消的狀態，分成0(未取消)、1(航具取消)、2(天氣取消)、3(國家空域系統)、4(安全取消)
    ● LATITUDE：緯度
    ● LONGITUDE：經度
    ● ELEVATION：海拔高度(ft)
    ● MESONET_STATION：氣象網站
    ● YEAR OF MANUFACTURE：飛機製造年份
    ● MANUFACTURER：飛機製造商
    ● ICAO TYPE：
      國際民航組織機場代碼，通常用於空中交通管理及飛行策劃等
    ● RANGE：飛行里程，分為短、中、長程
    ● WIDTH：飛機機身種類，分為窄身和寬身
    ● WIND_DIR：風向
    ● WIND_SPD：風速
    ● WIND_GUST：陣風
    ● VISIBILITY：能見度
    ● TEMPERATURE：溫度(C)
    ● DEW_POINT：露點(C)
    ● REL_HUMIDITY：相對溼度
    ● ALTIMETER：氣壓(汞柱)
    ● LOWEST_CLOUD_LAYER：最低雲層高度(ft)
    ● N_CLOUD_LAYER：雲層數量
    ● LOW_LEVEL_CLOUD：低雲層是否存在？(0表否、1表是)
    ● MID_LEVEL_CLOUD：中雲層是否存在？(0表否、1表是)
    ● HIGH_LEVEL_CLOUD：高雲層是否存在？(0表否、1表是)
    ● CLOUD_COVER：雲量，分五個等級
    ● ACTIVE_WEATHER：
      分三類別，0(無天氣事件發生)、1(天氣事件存在)、2(劇烈天氣事件發生(火山灰、龍捲風))
```
```
Stations囊括機場編號、所在城市、經緯度、海拔高度等欄位
    ● AIRPORT_ID：機場編號
    ● AIRPORT：機場代碼
    ● DISPLAY_AIRPORT_NAME：機場名字
    ● DISPLAY_AIRPORT_CITY_NAME_FULL：機場所在城市全名
    ● AIRPORT_STATE_NAME：機場所在州名字
    ● AIRPORT_STATE_CODE：機場所在州代碼
    ● LATITUDE：機場緯度
    ● LONGITUDE：機場經度
    ● ELEVATION：機場海拔高度(ft)
    ● ICAO：國際民航組織機場代碼，通常用於空中交通管理及飛行策劃
    ● IATA：國際航空運輸協會機場代碼
    ● FAA：聯邦航空協會代碼，協助辨識機場、航線、飛機製造者
    ● MESONET_STATION：氣象網站
```
## 將資料匯入Oracle
```
分別匯入Completedata.csv和Stations.csv這兩個資料集
Completedata.csv初始筆數為692,8147，為了利於查詢，我們使用R語言以隨機抽取的方式篩選出最終為121,136筆。
Stations.csv有376筆
先新增兩個table分別對應兩資料集的欄位以及符合型態限制
成功匯入資料
```

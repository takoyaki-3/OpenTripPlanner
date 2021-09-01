# Open Trip Planner

## 使い方
1. 対象地域の``.osm.pbf``ファイルを``map``ディレクトリ内に保存する.
2. 対象となるGTFSを``gtfs``ディレクトリ内に保存する.
3. ``docker-compose up``で起動する.

## APIリクエスト例

```
http://localhost:8080/otp/routers/default/plan?fromPlace=35.683934,139.775619&toPlace=35.689790,139.701805&time=1:02pm&date=09-01-2021&mode=TRANSIT,WALK&maxWalkDistance=500&arriveBy=false&numItineraries=5
```

## 以下、メモ

java -Xmx5G -jar /root/otp/otp-2.0.0-shaded.jar --build /root/otp/ --save

java -Xmx2G -jar /root/otp/otp-2.0.0-shaded.jar --load /root/otp

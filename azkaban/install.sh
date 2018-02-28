# 先安裝編譯相關套件
sudo apt-get install gcc g++

# 以下安裝流程來自官方網站
# 從git複製檔案
git clone https://github.com/azkaban/azkaban.git

# 開始編譯安裝檔案
cd azkaban; ./gradlew build installDist

# 啟動server前先修改時區設定(官方預設時區為America/Los Angeles)
cd azkaban/azkaban-solo-server/build/install/azkaban-solo-server
nano conf/azkaban.properties

修改default.timezone.id為Asia/Taipei(或是其他時區)
修改jetty.port為指定的port(如果預設的8081有其他服務使用的話一定要修改)

# 啟動server
bin/azkaban-solo-start.sh

# 關閉server
bin/azkaban-solo-shutdown.sh

# Trouble shooting
問題: 啟動時出現Exception in thread "main" java.io.IOException: Cannot find 'database.properties' file in sql/database.properties
解決方法: 用以下的方式執行
cd azkaban/azkaban-solo-server/build/install/azkaban-solo-server
bin/azkaban-solo-start.sh

問題: 執行Flow時出現hdfs command not found
解決方法: 重新建立account，並確認該user有權限可執行hdfs指令。目前看起來應該是跟指令權限有關
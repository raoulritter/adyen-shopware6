#!/bin/bash

sudo docker exec shopware mysql -u root --password='root' shopware -e "update sales_channel_domain set url='${APP_URL}' where url LIKE '%localhost%'" 2> /dev/null
sudo docker exec shopware mysql -u root --password='root' shopware_test -e "update sales_channel_domain set url='${APP_URL}' where url LIKE '%localhost%'" 2> /dev/null
sudo docker exec shopware mysql -u root --password='root' shopware_e2e -e "update sales_channel_domain set url='${APP_URL}' where url LIKE '%localhost%'" 2> /dev/null

sudo docker exec shopware composer require adyen/adyen-shopware6

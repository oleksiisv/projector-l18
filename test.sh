#!/bin/bash
for (( c=1; c<=50; c++ ))
do
   docker exec -it l18-php-1 php index.php
done
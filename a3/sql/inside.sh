echo running ${1}

# run this within the docker container
mysql -uroot -proot db < ${1}

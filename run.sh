dirname="node_modules"
if [ -d "$dirname" ]
then
   pm2 restart Vivek;
   done
else
   npm install
   pm2 start index.js --name "Vivek"
fi

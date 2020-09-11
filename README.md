# Profit & Loss
## Project Deployment

git clone https://github.com/alex5272372/ProfitAndLoss.git
npm install
npx ubcli createStore
npx ubcli initDB -p admin -dba postgres -dbaPwd FS9final -drop -create -host http://localhost:8881
npx ubcli generateDDL -u admin -p admin -host http://localhost:8881 -autorun
npx ubcli initialize -u admin -p admin -host http://localhost:8881

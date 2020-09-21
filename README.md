# Profit & Loss
## Project Deployment

1. Download and install following applications:
- Visual Studio Code
- Git
- node.js
2. Download and unpack UnityBase https://unitybase.info/download-files.html
3. Add path to ub.exe to PATH in environment variables
4. git clone https://github.com/alex5272372/ProfitAndLoss.git
5. npm install
6. npx ubcli createStore
7. init.cmd (or follow separated steps below)
- npx ubcli initDB -p admin -dba postgres -dbaPwd FS9final -drop -create -host http://localhost:8881
- npx ubcli generateDDL -u admin -p admin -host http://localhost:8881 -autorun
- npx ubcli initialize -u admin -p admin -host http://localhost:8881
8. Install "Debugger for Firefox" extension for VSCode (version 2.3.4)
9. Create a Launch configuration:
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "firefox",
      "request": "attach",
      "name": "UB",
      "host": "127.0.0.1",
      "port": 6000,
      "sourceMaps": "client"
    }
  ]
}
```
10. ub -dev

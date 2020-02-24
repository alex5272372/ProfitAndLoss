set UB_HOST=http://localhost:8881
set UB_USER=admin
set UB_PWD=admin
set DBA_USER_NAME=cityportal
set DBA_PASSWORD=A5Systems

call npx ubcli initDB -drop -create
@if errorlevel 1 goto err
call npx ubcli generateDDL -autorun
@if errorlevel 1 goto err
call npx ubcli initialize
@goto eof

:err 
echo Something wrong
exit 1

:eof
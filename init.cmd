set UB_HOST=http://localhost:8881
set UB_USER=admin
set UB_PWD=admin
set UB_DBA=postgres
set UB_DBAPWD=FS9final

md logs

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

@echo off
set winip=Target IP Address
set username=Target UserName
set password=Target Password 
set SessionStatus=
set SessionID=

rem Set Windows Authentication
cmdkey /generic:TERMSRV/%winip% /user:%username% /pass:%password%

rem Get Session Number
for /f "usebackq delims=" %%A in (`query session /server:%winip%`) do set SessionStatus=%%A
set SessionID=%SessionStatus:~9,9%

rem Connect Shadow Session
start mstsc /v:%winip% /control /noConsentPrompt /shadow:%SessionID% /multimon
timeout 5

cmdkey /delete:TERMSRV/%winip% /user:%username% /pass:%password%

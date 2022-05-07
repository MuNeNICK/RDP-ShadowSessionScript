@echo off
set winip=Target IP Address
set username=Target UserName
set password=Target Password 
set SessionStatus=
set SessionID=

rem Set Windows Authentication
cmdkey /add:%winip% /user:%username% /pass:%password%

rem Get Session Number
for /f "usebackq delims=" %%A in (`query session /server:%winip%`) do set SessionStatus=%%A
set SessionID=%SessionStatus:~45,1%

rem Connect Shadow Session
start mstsc /v:%winip% /control /noConsentPrompt /shadow:%SessionID%
timeout 5

cmdkey /delete:%winip%


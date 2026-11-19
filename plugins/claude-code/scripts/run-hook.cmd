@echo off
setlocal DisableDelayedExpansion

rem Resolve only through PATH, independently of the plugin and working directory.
set "DR_BINARY="
for %%I in (deep-reflect.exe) do set "DR_BINARY=%%~$PATH:I"
if not defined DR_BINARY (
  echo {"systemMessage":"Deep Reflect CLI is unavailable. Install deep-reflect and add it to the PATH used by your coding agent, then restart the agent."}
  exit /b 0
)

"%DR_BINARY%" hook %*
exit /b %errorlevel%

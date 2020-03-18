set PATH=%PREFIX%\cmake-bin\bin;%PATH%

mkdir build && cd build

cmake -GNinja ^
	  -D CMAKE_BUILD_TYPE=Release ^
	  -D BUILD_SHARED_LIBS=ON ^
	  -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	  -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	  -D ENABLE_ZLIB_COMPRESSION=ON ^
	%SRC_DIR%
IF %ERRORLEVEL% NEQ 0 exit 1

ninja install
IF %ERRORLEVEL% NEQ 0 exit 1

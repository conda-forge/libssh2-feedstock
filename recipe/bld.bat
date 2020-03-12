:: copy files which are missing from the release tarball
:: see: https://github.com/libssh2/libssh2/issues/379
:: TODO: remove this in the 1.9.1 or later releases
copy %RECIPE_DIR%\missing_files\*.c tests\

set PATH=%PREFIX%\cmake-bin\bin;%PATH%

mkdir build && cd build

cmake -G "%CMAKE_GENERATOR%" ^
	  -D CMAKE_BUILD_TYPE=Release ^
	  -D BUILD_SHARED_LIBS=ON ^
	  -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	  -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	  -D ENABLE_ZLIB_COMPRESSION=ON ^
	  -D CMAKE_BUILD_TYPE=Release ^
	%SRC_DIR%
IF %ERRORLEVEL% NEQ 0 exit 1

cmake --build . --config Release --target INSTALL
IF %ERRORLEVEL% NEQ 0 exit 1

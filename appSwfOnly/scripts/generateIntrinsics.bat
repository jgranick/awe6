:: Generates stub classes / intrinsics from runtime loaded assets to src/assets/*

@echo off
cd ..\assets\
if exist hxclasses rmdir hxclasses /s /q

:: haxe 2.07+ version:
:: haxe -swf test.swf -swf-lib asset.swf --gen-hx-classes --no-output
:: be aware this calls haxe from env variable, so will call Haxe 3 if installed - note difference to ,s on implements
haxe -swf test.swf -swf-lib audio.swf --gen-hx-classes --no-output
haxe -swf test.swf -swf-lib gui.swf --gen-hx-classes --no-output

if not exist hxclasses exit

if exist ..\src\assets rd ..\src\assets /S /Q
mkdir ..\src\assets
xcopy hxclasses\assets\* ..\src\assets\* /E
attrib ..\src\assets +a +r
attrib ..\src\assets\* +a +r
attrib hxclasses -r
rmdir hxclasses /s /q
cd ..\scripts\

echo All Classes in this package are generated by generateIntrinsics.bat, and should be considered scratchable. >> ..\src\assets\_readme.txt

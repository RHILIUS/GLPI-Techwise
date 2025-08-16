@echo off
REM TECHWISE Logo Restoration Script
REM Run this script after GLPI updates or CSS recompilation to restore the TECHWISE logo

echo Restoring TECHWISE logo...

cd /d "c:\xampp\htdocs\GLPI-Techwise\css_compiled"

echo Adding TECHWISE custom CSS to all compiled CSS files...

REM Add to install CSS
type ..\css\techwise-custom.css >> css_install.min.css

REM Add to all palette CSS files
for %%f in (css_palettes_*.min.css) do (
    echo Adding to %%f...
    type ..\css\techwise-custom.css >> %%f
)

echo TECHWISE logo has been restored!
echo Please refresh your browser or clear browser cache to see the changes.
pause

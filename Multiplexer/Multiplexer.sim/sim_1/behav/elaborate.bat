@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto d4c0b95f3e3a46228d4921c0844de261 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot LogicalElementsSimulation_behav xil_defaultlib.LogicalElementsSimulation -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

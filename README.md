# Phased array patch antenna @10GHz

Objective: “Design a 1D patch phased array of 10 elements with corporate feeding network for broadside radiation, target return loss is -10 dB. Calculate the radiation pattern analytically and numerically and compare them. If you want you can select the operating frequency yourself, otherwise use 10 GHz.”

Detail report can be found in https://github.com/Khainguyen1349/1x10_PatchArray_RotmanLens/blob/main/Phased%20array%20patch%20antenna%20%4010GHz.pdf

The analytical analysis is done in https://github.com/Khainguyen1349/1x10_PatchArray_RotmanLens/blob/main/Main.m

The final design is as following

![alt text](https://github.com/Khainguyen1349/1x10_PatchArray_RotmanLens/blob/main/Figures/Rotman/FinalStructure.png)

By principle, each port of the Rotman lens excites different phase-shift to the antenne 

![alt text](https://github.com/Khainguyen1349/1x10_PatchArray_RotmanLens/blob/main/Figures/Rotman/ROTMAN_PATCH_10GHz_01.gif)

By feeding different ports, we can have these scanning beams covering 60 degrees

![alt text](https://github.com/Khainguyen1349/1x10_PatchArray_RotmanLens/blob/main/Figures/Rotman/Patterns.png)

3D pattern

![alt text](https://github.com/Khainguyen1349/1x10_PatchArray_RotmanLens/blob/main/Figures/Rotman/ArrayPatchRotman10GHz.gif)

The design have a better impedance matching than -10dB and total loss lower than 5.5dB.

![alt text](https://github.com/Khainguyen1349/1x10_PatchArray_RotmanLens/blob/main/Figures/Rotman/Matching.png)

References

1. Eurocircuits site: https://www.eurocircuits.com/ 

2. Balanis, “Antenna Theory: Analysis and Design,” 4th edition, MATLAB code: https://fr.mathworks.com/academia/books/antenna-theory-balanis.html 

3. Rotman lens design using MATLAB: https://fr.mathworks.com/matlabcentral/fileexchange/50490-rotman-lens-design-with-hfss-link?s_tid=mwa_osa_a 
 
4. Patch dimension calculator: https://www.pasternack.com/t-calculator-microstrip-ant.aspx 

5. Microstrip line calculator: https://www.pasternack.com/t-calculator-microstrip.aspx 

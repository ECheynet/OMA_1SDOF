# Damping ratio estimation from ambient vibrations (SDOF)

[![View Damping ratio estimation from ambient vibrations (SDOF) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/55557-damping-ratio-estimation-from-ambient-vibrations-sdof)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3827107.svg)](https://doi.org/10.5281/zenodo.3827107)


[![Donation](https://camo.githubusercontent.com/a37ab2f2f19af23730565736fb8621eea275aad02f649c8f96959f78388edf45/68747470733a2f2f77617265686f7573652d63616d6f2e636d68312e707366686f737465642e6f72672f316339333962613132323739393662383762623033636630323963313438323165616239616439312f3638373437343730373333613266326636393664363732653733363836393635366336343733326536393666326636323631363436373635326634343666366536313734363532643432373537393235333233303664363532353332333036313235333233303633366636363636363536353264373936353663366336663737363737323635363536653265373337363637)](https://www.buymeacoffee.com/echeynet)


## Summary
If the free-decay response (FDR) of a Single Degree-of-Freedom (SDOF) system is not directly available, it is possible to use ambient vibrations data yo estimate the modal damping ratio. Here, the Random Decrement Technique (RDT) [1], as well as the Natural Excitation Technique (NExT) [2], are used. First, the response of a SDOF to white noise is simulated in the time domain using [3]. Then the IRF is computed using the RDT or NExT. Finally, and an exponential decay is fitted to the envelop of the IRF to obtain the modal damping ratio.

## Content

The present submission contains:
- a function RDT.,m that implements to Random Decrement Technique (RDT)
- a function NExT that implements the Natural Excitation Technique (NExT)
- a function expoFit that determine the modal damping ratio by fitting an exponential decay to the envelope of the IRF.
- a function CentDiff used to simulate the response to a white noise load of a SDOF in the time domain.
- An example file Example.m

Any question, comment or suggestion is welcomed.

## References

[1] Ibrahim, S. R. (1977). Random decrement technique for modal identification of structures. Journal of Spacecraft and Rockets, 14(11), 696-700.

[2] James III, O. H., & Came, T. G. (1995). The natural excitation technique (next) for modal parameter extraction from operating structures.

[3] http://www.mathworks.com/matlabcentral/fileexchange/53854-harmonic-excitation-of-a-sdof

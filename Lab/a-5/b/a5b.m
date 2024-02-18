clear all; 
close all; 
clc;

% addpath('\\samba1.engr.scu.edu\lkim\dcengr\Desktop\fall2020\104L\a-5\b\femm\mfiles','-end');

% The package must be initialized with the openfemm command.
% This command starts up a FEMM process and connects to it
addpath('/samba1.engr.scu.edu/lkim/dcengr/Desktop/fall2020/104L/a-b/b/femm/mfiles');

openfemm;

% We need to create a new Magnetostatics document to work on.

newdocument(0);

% Define the problem type.  Electrostatics; Units of mm; Axisymmetric; 
% Precision of 10^(-8) for the linear solver; a placeholder of 20 for 
% the depth dimension, and an angle constraint of 30 degrees
mi_probdef(0, 'millimeters', 'axi', 1.e-8, 20);

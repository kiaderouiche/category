%module kernel

%{
#include "GaussianKernel.h"
#include "BlobelKernel.h"
#include "SpectrumKernel.h"
#include "MyKernel.h"
%}

%include "VKernel.h"
%include "GaussianKernel.h"
%include "BlobelKernel.h"
%include "SpectrumKernel.h"
%include "MyKernel.h"

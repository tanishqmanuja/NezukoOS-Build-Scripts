#!/bin/bash

# Delete Kernel
rm -rf kernel/oneplus/msm8998

# Clone Kernel
if [ "$1" == "-l" ]; then
	git clone --depth=1 --single-branch --branch custom2-develop https://github.com/ederekun/lazy_kernel_op5-t kernel/oneplus/msm8998
else
	git clone --depth=1 --single-branch --branch oldvib https://github.com/Maitreya29/TanjiroKernelOP5-T kernel/oneplus/msm8998
fi

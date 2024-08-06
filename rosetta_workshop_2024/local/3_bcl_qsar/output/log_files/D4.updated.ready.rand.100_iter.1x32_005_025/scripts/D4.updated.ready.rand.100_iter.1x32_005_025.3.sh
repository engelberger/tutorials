#!/bin/bash
cd /home/ben/Projects/BCL_Workshop_2022/Tutorial_3/output
. ./log_files/D4.updated.ready.rand.100_iter.1x32_005_025/scripts/functions.sh
PrologueStatus ./log_files/D4.updated.ready.rand.100_iter.1x32_005_025/status.txt
run_command_check_status /home/ben/workspace/bcl/build/linux64_release/bin/bcl-apps-static.exe model:Train 'NeuralNetwork( transfer function = Sigmoid, weight update = Simple(alpha=0.5,eta=0.05),dropout(0.05,0.25),objective function = AucRocCurve(cutoff=0.5,parity=1,x_axis_log=1,min fpr=0.001,max fpr=0.1),scaling=AveStd,steps per update=1,hidden architecture(32),balance=True,balance target ratio=0.1,shuffle=True,input dropout type=Zero)'  -max_minutes 24000 -max_iterations 100   -opencl Disable  --result_averaging_window 0 -random_seed `od -A n -t dI -N 4 /dev/urandom | tr -d -`  -final_objective_function 'AucRocCurve(cutoff=0.5,parity=1,x_axis_log=1,min fpr=0.001,max fpr=0.1)'   -training 'Subset(number chunks=5,chunks="[0, 5) - [3] - [3]",filename="../input/dopamine_receptors/D4.updated.ready.rand.bin") '  -monitoring 'Subset(number chunks=5,chunks="[3]",filename="../input/dopamine_receptors/D4.updated.ready.rand.bin") '  -independent 'Subset(number chunks=5,chunks="[3]",filename="../input/dopamine_receptors/D4.updated.ready.rand.bin") '  --print_independent_predictions ./results/D4.updated.ready.rand.100_iter.1x32_005_025/independent3_monitoring3_number0.gz  -storage_model 'File(directory=./models/D4.updated.ready.rand.100_iter.1x32_005_025,prefix="model",write_descriptors=1,key=3)'  -logger File ./log_files/D4.updated.ready.rand.100_iter.1x32_005_025/independent3_monitoring3_number0.txt &> /home/ben/Projects/BCL_Workshop_2022/Tutorial_3/output/log_files/D4.updated.ready.rand.100_iter.1x32_005_025/independent3_monitoring3_number0.job.txt
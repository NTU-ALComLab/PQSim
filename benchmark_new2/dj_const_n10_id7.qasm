OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
creg c[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
x q[9];
h q[9];
cx q[3], q[4];
x q[2];
cx q[3], q[5];
cx q[4], q[0];
cx q[3], q[0];
x q[5];
x q[1];
x q[0];
x q[4];
x q[0];
x q[4];
cx q[0], q[3];
x q[0];
x q[2];
x q[1];
cx q[1], q[6];
x q[5];
x q[3];
x q[2];
x q[1];
x q[5];
x q[3];
x q[3];
x q[5];
x q[3];
x q[5];
cx q[1], q[0];
x q[0];
cx q[0], q[2];
cx q[0], q[5];
x q[2];
x q[6];
x q[2];
x q[5];
x q[2];
x q[1];
cx q[0], q[4];
cx q[4], q[0];
x q[1];
cx q[0], q[1];
cx q[6], q[3];
cx q[4], q[3];
cx q[5], q[4];
cx q[3], q[0];
cx q[0], q[3];
x q[6];
x q[0];
x q[3];
cx q[6], q[5];
cx q[1], q[2];
cx q[0], q[2];
x q[2];
x q[1];
x q[4];
cx q[3], q[4];
cx q[3], q[5];
x q[1];
cx q[6], q[5];
cx q[1], q[0];
cx q[1], q[2];
x q[6];
cx q[5], q[0];
cx q[6], q[3];
cx q[3], q[5];
cx q[0], q[6];
x q[2];
x q[4];
x q[1];
x q[1];
x q[1];
x q[4];
x q[2];
cx q[6], q[4];
cx q[1], q[0];
x q[0];
x q[4];
x q[5];
x q[4];
x q[4];
x q[3];
cx q[4], q[6];
cx q[4], q[6];
cx q[1], q[4];
x q[4];
x q[4];
x q[0];
cx q[3], q[1];
x q[2];
cx q[5], q[4];
x q[6];
x q[4];
cx q[6], q[4];
cx q[1], q[5];
cx q[1], q[5];
x q[5];
x q[3];
x q[5];
x q[5];
cx q[3], q[6];
x q[3];
x q[2];
x q[3];
x q[2];
x q[2];
cx q[0], q[1];
x q[2];
x q[3];
x q[5];
x q[3];
cx q[3], q[5];
x q[1];
x q[3];
cx q[1], q[3];
cx q[4], q[0];
cx q[1], q[6];
cx q[0], q[1];
cx q[4], q[0];
x q[6];
cx q[2], q[5];
cx q[4], q[0];
x q[5];
cx q[5], q[6];
cx q[1], q[6];
cx q[0], q[6];
cx q[5], q[6];
x q[2];
x q[5];
cx q[0], q[2];
x q[6];
cx q[6], q[4];
x q[3];
x q[6];
x q[6];
x q[0];
cx q[5], q[4];
x q[3];
cx q[5], q[0];
cx q[4], q[2];
cx q[3], q[5];
x q[2];
cx q[2], q[1];
x q[5];
x q[4];
x q[5];
cx q[6], q[3];
x q[0];
x q[1];
x q[3];
x q[3];
x q[1];
cx q[1], q[4];
x q[3];
cx q[4], q[6];
cx q[4], q[6];
cx q[3], q[5];
cx q[4], q[2];
cx q[5], q[6];
x q[5];
x q[6];
x q[1];
cx q[0], q[3];
cx q[5], q[3];
x q[2];
cx q[4], q[0];
cx q[4], q[1];
cx q[1], q[3];
x q[5];
x q[2];
cx q[0], q[5];
cx q[5], q[1];
cx q[0], q[2];
x q[1];
cx q[2], q[6];
x q[0];
cx q[5], q[2];
cx q[0], q[2];
x q[6];
cx q[5], q[4];
cx q[1], q[3];
x q[6];
cx q[1], q[5];
cx q[3], q[6];
cx q[6], q[5];
cx q[1], q[3];
cx q[0], q[3];
cx q[1], q[4];
cx q[6], q[2];
x q[0];
x q[5];
cx q[0], q[5];
cx q[5], q[2];
cx q[2], q[5];
cx q[0], q[6];
x q[2];
cx q[3], q[5];
x q[3];
x q[4];
cx q[4], q[0];
cx q[6], q[2];
cx q[3], q[1];
cx q[3], q[4];
x q[6];
cx q[2], q[6];
cx q[0], q[4];
x q[3];
x q[0];
x q[0];
x q[2];
x q[5];
x q[1];
cx q[3], q[4];
x q[4];
cx q[0], q[6];
cx q[0], q[6];
cx q[3], q[6];
cx q[2], q[4];
x q[1];
cx q[1], q[5];
x q[5];
cx q[5], q[0];
x q[0];
x q[5];
cx q[3], q[4];
x q[6];
x q[4];
cx q[1], q[2];
cx q[1], q[0];
cx q[6], q[0];
cx q[3], q[4];
x q[0];
x q[0];
x q[6];
cx q[1], q[5];
x q[0];
cx q[2], q[6];
x q[2];
cx q[4], q[0];
x q[1];
x q[3];
cx q[3], q[4];
x q[4];
x q[5];
cx q[0], q[6];
x q[5];
x q[0];
x q[0];
cx q[1], q[2];
x q[2];
cx q[1], q[4];
x q[5];
cx q[0], q[4];
x q[5];
cx q[6], q[3];
x q[4];
cx q[5], q[2];
x q[0];
x q[5];
cx q[6], q[2];
x q[2];
cx q[2], q[5];
cx q[4], q[0];
cx q[6], q[2];
x q[5];
x q[6];
cx q[6], q[2];
cx q[0], q[6];
cx q[5], q[1];
x q[3];
cx q[0], q[1];
cx q[6], q[0];
cx q[1], q[4];
x q[4];
cx q[3], q[6];
cx q[1], q[4];
x q[5];
cx q[2], q[6];
cx q[3], q[6];
cx q[3], q[6];
cx q[1], q[0];
x q[2];
x q[2];
cx q[3], q[0];
x q[6];
x q[3];
x q[2];
cx q[0], q[5];
cx q[3], q[2];
x q[6];
x q[1];
x q[0];
cx q[6], q[1];
x q[1];
cx q[6], q[0];
x q[6];
cx q[0], q[6];
cx q[6], q[1];
cx q[6], q[3];
cx q[5], q[2];
cx q[1], q[4];
x q[6];
cx q[1], q[5];
x q[2];
x q[4];
cx q[5], q[3];
x q[3];
x q[6];
x q[0];
cx q[2], q[5];
x q[6];
x q[1];
x q[2];
x q[1];
cx q[6], q[5];
cx q[5], q[0];
cx q[4], q[0];
cx q[5], q[3];
x q[6];
x q[3];
cx q[6], q[2];
x q[5];
cx q[1], q[0];
x q[3];
x q[2];
x q[6];
x q[3];
x q[5];
cx q[1], q[6];
x q[3];
x q[0];
cx q[0], q[3];
cx q[2], q[6];
x q[1];
x q[2];
x q[4];
cx q[6], q[0];
x q[4];
cx q[0], q[3];
x q[4];
cx q[3], q[0];
cx q[6], q[1];
cx q[6], q[1];
x q[0];
x q[4];
cx q[1], q[6];
cx q[3], q[0];
cx q[6], q[2];
cx q[0], q[5];
cx q[2], q[4];
x q[0];
cx q[6], q[1];
cx q[6], q[4];
x q[1];
x q[4];
x q[2];
cx q[4], q[6];
x q[2];
cx q[4], q[6];
x q[5];
cx q[1], q[0];
cx q[0], q[5];
cx q[3], q[1];
cx q[0], q[6];
cx q[5], q[1];
x q[6];
x q[5];
x q[6];
x q[3];
cx q[5], q[6];
cx q[4], q[3];
x q[0];
x q[6];
x q[4];
x q[2];
x q[4];
x q[5];
x q[2];
x q[4];
cx q[4], q[3];
cx q[0], q[6];
cx q[2], q[5];
x q[6];
x q[6];
cx q[4], q[6];
x q[6];
cx q[3], q[6];
cx q[2], q[3];
cx q[6], q[5];
x q[3];
cx q[5], q[1];
x q[1];
cx q[5], q[3];
cx q[6], q[3];
cx q[2], q[0];
cx q[2], q[6];
x q[2];
x q[1];
cx q[3], q[1];
x q[0];
cx q[2], q[4];
cx q[6], q[1];
cx q[5], q[6];
x q[4];
x q[6];
x q[3];
x q[4];
cx q[5], q[2];
cx q[3], q[4];
cx q[2], q[4];
x q[0];
cx q[6], q[5];
x q[0];
cx q[2], q[5];
cx q[1], q[6];
x q[5];
x q[1];
cx q[3], q[0];
cx q[5], q[4];
cx q[3], q[0];
x q[1];
cx q[3], q[4];
x q[5];
cx q[2], q[4];
cx q[4], q[3];
cx q[6], q[2];
x q[3];
cx q[4], q[3];
cx q[5], q[1];
x q[0];
x q[6];
x q[2];
cx q[5], q[1];
cx q[2], q[1];
x q[4];
x q[0];
cx q[2], q[4];
cx q[4], q[2];
cx q[3], q[2];
x q[0];
x q[2];
x q[1];
cx q[4], q[3];
x q[5];
x q[5];
x q[3];
cx q[1], q[2];
cx q[3], q[6];
x q[2];
x q[3];
cx q[6], q[4];
x q[4];
x q[1];
cx q[6], q[0];
x q[3];
cx q[2], q[4];
x q[3];
x q[5];
cx q[5], q[1];
cx q[2], q[6];
x q[3];
x q[4];
cx q[1], q[2];
x q[1];
x q[0];
cx q[2], q[0];
x q[6];
cx q[4], q[6];
cx q[6], q[0];
x q[3];
x q[4];
x q[5];
x q[1];
cx q[2], q[4];
cx q[3], q[6];
x q[1];
x q[6];
cx q[3], q[5];
cx q[3], q[5];
cx q[4], q[1];
cx q[1], q[3];
x q[6];
x q[5];
cx q[0], q[7];
cx q[3], q[7];
cx q[4], q[7];
cx q[5], q[7];
cx q[6], q[7];
cx q[0], q[8];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[8];
cx q[6], q[8];
x q[8];
ccx q[7], q[8], q[9];
cx q[0], q[8];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[8];
cx q[6], q[8];
cx q[0], q[7];
cx q[3], q[7];
cx q[4], q[7];
cx q[5], q[7];
cx q[6], q[7];
x q[5];
x q[6];
cx q[1], q[3];
cx q[4], q[1];
cx q[3], q[5];
cx q[3], q[5];
x q[6];
x q[1];
cx q[3], q[6];
cx q[2], q[4];
x q[1];
x q[5];
x q[4];
x q[3];
cx q[6], q[0];
cx q[4], q[6];
x q[6];
cx q[2], q[0];
x q[0];
x q[1];
cx q[1], q[2];
x q[4];
x q[3];
cx q[2], q[6];
cx q[5], q[1];
x q[5];
x q[3];
cx q[2], q[4];
x q[3];
cx q[6], q[0];
x q[1];
x q[4];
cx q[6], q[4];
x q[3];
x q[2];
cx q[3], q[6];
cx q[1], q[2];
x q[3];
x q[5];
x q[5];
cx q[4], q[3];
x q[1];
x q[2];
x q[0];
cx q[3], q[2];
cx q[4], q[2];
cx q[2], q[4];
x q[0];
x q[4];
cx q[2], q[1];
cx q[5], q[1];
x q[2];
x q[6];
x q[0];
cx q[5], q[1];
cx q[4], q[3];
x q[3];
cx q[6], q[2];
cx q[4], q[3];
cx q[2], q[4];
x q[5];
cx q[3], q[4];
x q[1];
cx q[3], q[0];
cx q[5], q[4];
cx q[3], q[0];
x q[1];
x q[5];
cx q[1], q[6];
cx q[2], q[5];
x q[0];
cx q[6], q[5];
x q[0];
cx q[2], q[4];
cx q[3], q[4];
cx q[5], q[2];
x q[4];
x q[3];
x q[6];
x q[4];
cx q[5], q[6];
cx q[6], q[1];
cx q[2], q[4];
x q[0];
cx q[3], q[1];
x q[1];
x q[2];
cx q[2], q[6];
cx q[2], q[0];
cx q[6], q[3];
cx q[5], q[3];
x q[1];
cx q[5], q[1];
x q[3];
cx q[6], q[5];
cx q[2], q[3];
cx q[3], q[6];
x q[6];
cx q[4], q[6];
x q[6];
x q[6];
cx q[2], q[5];
cx q[0], q[6];
cx q[4], q[3];
x q[4];
x q[2];
x q[5];
x q[4];
x q[2];
x q[4];
x q[6];
x q[0];
cx q[4], q[3];
cx q[5], q[6];
x q[3];
x q[6];
x q[5];
x q[6];
cx q[5], q[1];
cx q[0], q[6];
cx q[3], q[1];
cx q[0], q[5];
cx q[1], q[0];
x q[5];
cx q[4], q[6];
x q[2];
cx q[4], q[6];
x q[2];
x q[4];
x q[1];
cx q[6], q[4];
cx q[6], q[1];
x q[0];
cx q[2], q[4];
cx q[0], q[5];
cx q[6], q[2];
cx q[3], q[0];
cx q[1], q[6];
x q[4];
x q[0];
cx q[6], q[1];
cx q[6], q[1];
cx q[3], q[0];
x q[4];
cx q[0], q[3];
x q[4];
cx q[6], q[0];
x q[4];
x q[2];
x q[1];
cx q[2], q[6];
cx q[0], q[3];
x q[0];
x q[3];
cx q[1], q[6];
x q[5];
x q[3];
x q[6];
x q[2];
x q[3];
cx q[1], q[0];
x q[5];
cx q[6], q[2];
x q[3];
x q[6];
cx q[5], q[3];
cx q[4], q[0];
cx q[5], q[0];
cx q[6], q[5];
x q[1];
x q[2];
x q[1];
x q[6];
cx q[2], q[5];
x q[0];
x q[6];
x q[3];
cx q[5], q[3];
x q[4];
x q[2];
cx q[1], q[5];
x q[6];
cx q[1], q[4];
cx q[5], q[2];
cx q[6], q[3];
cx q[6], q[1];
cx q[0], q[6];
x q[6];
cx q[6], q[0];
x q[1];
cx q[6], q[1];
x q[0];
x q[1];
x q[6];
cx q[3], q[2];
cx q[0], q[5];
x q[2];
x q[3];
x q[6];
cx q[3], q[0];
x q[2];
x q[2];
cx q[1], q[0];
cx q[3], q[6];
cx q[3], q[6];
cx q[2], q[6];
x q[5];
cx q[1], q[4];
cx q[3], q[6];
x q[4];
cx q[1], q[4];
cx q[6], q[0];
cx q[0], q[1];
x q[3];
cx q[5], q[1];
cx q[0], q[6];
cx q[6], q[2];
x q[6];
x q[5];
cx q[6], q[2];
cx q[4], q[0];
cx q[2], q[5];
x q[2];
cx q[6], q[2];
x q[5];
x q[0];
cx q[5], q[2];
x q[4];
cx q[6], q[3];
x q[5];
cx q[0], q[4];
x q[5];
cx q[1], q[4];
x q[2];
cx q[1], q[2];
x q[0];
x q[0];
x q[5];
cx q[0], q[6];
x q[5];
x q[4];
cx q[3], q[4];
x q[3];
x q[1];
cx q[4], q[0];
x q[2];
cx q[2], q[6];
x q[0];
cx q[1], q[5];
x q[6];
x q[0];
x q[0];
cx q[3], q[4];
cx q[6], q[0];
cx q[1], q[0];
cx q[1], q[2];
x q[4];
x q[6];
cx q[3], q[4];
x q[5];
x q[0];
cx q[5], q[0];
x q[5];
cx q[1], q[5];
x q[1];
cx q[2], q[4];
cx q[3], q[6];
cx q[0], q[6];
cx q[0], q[6];
x q[4];
cx q[3], q[4];
x q[1];
x q[5];
x q[2];
x q[0];
x q[0];
x q[3];
cx q[0], q[4];
cx q[2], q[6];
x q[6];
cx q[3], q[4];
cx q[3], q[1];
cx q[6], q[2];
cx q[4], q[0];
x q[4];
x q[3];
cx q[3], q[5];
x q[2];
cx q[0], q[6];
cx q[2], q[5];
cx q[5], q[2];
cx q[0], q[5];
x q[5];
x q[0];
cx q[6], q[2];
cx q[1], q[4];
cx q[0], q[3];
cx q[1], q[3];
cx q[6], q[5];
cx q[3], q[6];
cx q[1], q[5];
x q[6];
cx q[1], q[3];
cx q[5], q[4];
x q[6];
cx q[0], q[2];
cx q[5], q[2];
x q[0];
cx q[2], q[6];
x q[1];
cx q[0], q[2];
cx q[5], q[1];
cx q[0], q[5];
x q[2];
x q[5];
cx q[1], q[3];
cx q[4], q[1];
cx q[4], q[0];
x q[2];
cx q[5], q[3];
cx q[0], q[3];
x q[1];
x q[6];
x q[5];
cx q[5], q[6];
cx q[4], q[2];
cx q[3], q[5];
cx q[4], q[6];
cx q[4], q[6];
x q[3];
cx q[1], q[4];
x q[1];
x q[3];
x q[3];
x q[1];
x q[0];
cx q[6], q[3];
x q[5];
x q[4];
x q[5];
cx q[2], q[1];
x q[2];
cx q[3], q[5];
cx q[4], q[2];
cx q[5], q[0];
x q[3];
cx q[5], q[4];
x q[0];
x q[6];
x q[6];
x q[3];
cx q[6], q[4];
x q[6];
cx q[0], q[2];
x q[5];
x q[2];
cx q[5], q[6];
cx q[0], q[6];
cx q[1], q[6];
cx q[5], q[6];
x q[5];
cx q[4], q[0];
cx q[2], q[5];
x q[6];
cx q[4], q[0];
cx q[0], q[1];
cx q[1], q[6];
cx q[4], q[0];
cx q[1], q[3];
x q[3];
x q[1];
cx q[3], q[5];
x q[3];
x q[5];
x q[3];
x q[2];
cx q[0], q[1];
x q[2];
x q[2];
x q[3];
x q[2];
x q[3];
cx q[3], q[6];
x q[5];
x q[5];
x q[3];
x q[5];
cx q[1], q[5];
cx q[1], q[5];
cx q[6], q[4];
x q[4];
x q[6];
cx q[5], q[4];
x q[2];
cx q[3], q[1];
x q[0];
x q[4];
x q[4];
cx q[1], q[4];
cx q[4], q[6];
cx q[4], q[6];
x q[3];
x q[4];
x q[4];
x q[5];
x q[4];
x q[0];
cx q[1], q[0];
cx q[6], q[4];
x q[2];
x q[4];
x q[1];
x q[1];
x q[1];
x q[4];
x q[2];
cx q[0], q[6];
cx q[3], q[5];
cx q[6], q[3];
cx q[5], q[0];
x q[6];
cx q[1], q[2];
cx q[1], q[0];
cx q[6], q[5];
x q[1];
cx q[3], q[5];
cx q[3], q[4];
x q[4];
x q[1];
x q[2];
cx q[0], q[2];
cx q[1], q[2];
cx q[6], q[5];
x q[3];
x q[0];
x q[6];
cx q[0], q[3];
cx q[3], q[0];
cx q[5], q[4];
cx q[4], q[3];
cx q[6], q[3];
cx q[0], q[1];
x q[1];
cx q[4], q[0];
cx q[0], q[4];
x q[1];
x q[2];
x q[5];
x q[2];
x q[6];
x q[2];
cx q[0], q[5];
cx q[0], q[2];
x q[0];
cx q[1], q[0];
x q[5];
x q[3];
x q[5];
x q[3];
x q[3];
x q[5];
x q[1];
x q[2];
x q[3];
x q[5];
cx q[1], q[6];
x q[1];
x q[2];
x q[0];
cx q[0], q[3];
x q[4];
x q[0];
x q[4];
x q[0];
x q[1];
x q[5];
cx q[3], q[0];
cx q[4], q[0];
cx q[3], q[5];
x q[2];
cx q[3], q[4];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

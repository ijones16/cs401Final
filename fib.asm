  addi $s0, $0, 10
  addi $s1, $0, 1
  addi $s2, $0, 1
  addi $s4, $0, 1
loop:
  beq $s0, $0, target
  add $s3, $0, $s1
  add $s1, $s1, $s2
  add $s2, $s3, $0
  sub $s0, $s0, $s4
  j loop
target:
  addi $s4, $0, 1

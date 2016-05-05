  addi $s2, $0, 5	     # 20020005
  addi $s7, $0, 3	        # 20070003
addi $s3, $0, 0xc	        # 2003000c
 # nori $s3, $0, 0xd
  xori $s3, $0, 0xf
  or   $s4, $s7, $s2     # 00e22025
  xor  $s4, $s7, $s2 
  nor $4, $s2, $s4
  and  $s5, $s3, $s4     # 00642824
  add  $s5, $s5, $s4      # 00a42820
  addi $s5, $0, 10     # 2005000a
  addi $s2, $0, 1      #20020001
  sub  $s7, $s7, $s2     # 00e23822
  sw   $s7, 72($0)     # ac470047

decode.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <unpack>:
   0:	89 f8                	mov    %edi,%eax
   2:	c1 e8 1c             	shr    $0x1c,%eax
   5:	83 f8 0c             	cmp    $0xc,%eax
   8:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # e <unpack+0xe>
   e:	89 f8                	mov    %edi,%eax
  10:	76 1e                	jbe    30 <unpack+0x30>
  12:	25 00 00 00 0e       	and    $0xe000000,%eax
  17:	81 e7 ff ff ff 01    	and    $0x1ffffff,%edi
  1d:	c1 e8 19             	shr    $0x19,%eax
  20:	89 3d 00 00 00 00    	mov    %edi,0x0(%rip)        # 26 <unpack+0x26>
  26:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 2c <unpack+0x2c>
  2c:	c3                   	retq   
  2d:	0f 1f 00             	nopl   (%rax)
  30:	25 c0 01 00 00       	and    $0x1c0,%eax
  35:	c1 e8 06             	shr    $0x6,%eax
  38:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 3e <unpack+0x3e>
  3e:	89 f8                	mov    %edi,%eax
  40:	83 e7 07             	and    $0x7,%edi
  43:	83 e0 38             	and    $0x38,%eax
  46:	89 3d 00 00 00 00    	mov    %edi,0x0(%rip)        # 4c <unpack+0x4c>
  4c:	c1 e8 03             	shr    $0x3,%eax
  4f:	89 05 00 00 00 00    	mov    %eax,0x0(%rip)        # 55 <unpack+0x55>
  55:	c3                   	retq   
  56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  5d:	00 00 00 

0000000000000060 <get_opcode>:
  60:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 66 <get_opcode+0x6>
  66:	c3                   	retq   
  67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  6e:	00 00 

0000000000000070 <get_rega>:
  70:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 76 <get_rega+0x6>
  76:	c3                   	retq   
  77:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  7e:	00 00 

0000000000000080 <get_regb>:
  80:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 86 <get_regb+0x6>
  86:	c3                   	retq   
  87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  8e:	00 00 

0000000000000090 <get_regc>:
  90:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 96 <get_regc+0x6>
  96:	c3                   	retq   
  97:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  9e:	00 00 

00000000000000a0 <get_val>:
  a0:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # a6 <get_val+0x6>
  a6:	c3                   	retq   

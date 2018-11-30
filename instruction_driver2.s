
instruction_driver.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <cmov>:
   0:	89 d2                	mov    %edx,%edx
   2:	8b 04 95 00 00 00 00 	mov    0x0(,%rdx,4),%eax
   9:	85 c0                	test   %eax,%eax
   b:	74 12                	je     1f <cmov+0x1f>
   d:	89 f6                	mov    %esi,%esi
   f:	89 ff                	mov    %edi,%edi
  11:	8b 04 b5 00 00 00 00 	mov    0x0(,%rsi,4),%eax
  18:	89 04 bd 00 00 00 00 	mov    %eax,0x0(,%rdi,4)
  1f:	f3 c3                	repz retq 
  21:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  2d:	00 00 00 

0000000000000030 <add>:
  30:	89 f6                	mov    %esi,%esi
  32:	89 d2                	mov    %edx,%edx
  34:	89 ff                	mov    %edi,%edi
  36:	8b 04 95 00 00 00 00 	mov    0x0(,%rdx,4),%eax
  3d:	03 04 b5 00 00 00 00 	add    0x0(,%rsi,4),%eax
  44:	89 04 bd 00 00 00 00 	mov    %eax,0x0(,%rdi,4)
  4b:	c3                   	retq   
  4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000050 <mul>:
  50:	89 f6                	mov    %esi,%esi
  52:	89 d2                	mov    %edx,%edx
  54:	89 ff                	mov    %edi,%edi
  56:	8b 04 b5 00 00 00 00 	mov    0x0(,%rsi,4),%eax
  5d:	0f af 04 95 00 00 00 	imul   0x0(,%rdx,4),%eax
  64:	00 
  65:	89 04 bd 00 00 00 00 	mov    %eax,0x0(,%rdi,4)
  6c:	c3                   	retq   
  6d:	0f 1f 00             	nopl   (%rax)

0000000000000070 <divide>:
  70:	89 f6                	mov    %esi,%esi
  72:	89 d1                	mov    %edx,%ecx
  74:	31 d2                	xor    %edx,%edx
  76:	8b 04 b5 00 00 00 00 	mov    0x0(,%rsi,4),%eax
  7d:	89 ff                	mov    %edi,%edi
  7f:	f7 34 8d 00 00 00 00 	divl   0x0(,%rcx,4)
  86:	89 04 bd 00 00 00 00 	mov    %eax,0x0(,%rdi,4)
  8d:	c3                   	retq   
  8e:	66 90                	xchg   %ax,%ax

0000000000000090 <nand>:
  90:	89 f6                	mov    %esi,%esi
  92:	89 d2                	mov    %edx,%edx
  94:	89 ff                	mov    %edi,%edi
  96:	8b 04 b5 00 00 00 00 	mov    0x0(,%rsi,4),%eax
  9d:	23 04 95 00 00 00 00 	and    0x0(,%rdx,4),%eax
  a4:	f7 d0                	not    %eax
  a6:	89 04 bd 00 00 00 00 	mov    %eax,0x0(,%rdi,4)
  ad:	c3                   	retq   
  ae:	66 90                	xchg   %ax,%ax

00000000000000b0 <halt>:
  b0:	f3 c3                	repz retq 
  b2:	0f 1f 40 00          	nopl   0x0(%rax)
  b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  bd:	00 00 00 

00000000000000c0 <loadv>:
  c0:	89 ff                	mov    %edi,%edi
  c2:	89 34 bd 00 00 00 00 	mov    %esi,0x0(,%rdi,4)
  c9:	c3                   	retq   
  ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000000d0 <sstore>:
  d0:	89 d2                	mov    %edx,%edx
  d2:	89 f6                	mov    %esi,%esi
  d4:	89 ff                	mov    %edi,%edi
  d6:	8b 14 95 00 00 00 00 	mov    0x0(,%rdx,4),%edx
  dd:	8b 34 b5 00 00 00 00 	mov    0x0(,%rsi,4),%esi
  e4:	8b 3c bd 00 00 00 00 	mov    0x0(,%rdi,4),%edi
  eb:	e9 00 00 00 00       	jmpq   f0 <sload>

00000000000000f0 <sload>:
  f0:	89 f0                	mov    %esi,%eax
  f2:	89 d2                	mov    %edx,%edx
  f4:	53                   	push   %rbx
  f5:	8b 34 95 00 00 00 00 	mov    0x0(,%rdx,4),%esi
  fc:	89 fb                	mov    %edi,%ebx
  fe:	8b 3c 85 00 00 00 00 	mov    0x0(,%rax,4),%edi
 105:	e8 00 00 00 00       	callq  10a <sload+0x1a>
 10a:	89 04 9d 00 00 00 00 	mov    %eax,0x0(,%rbx,4)
 111:	5b                   	pop    %rbx
 112:	c3                   	retq   
 113:	0f 1f 00             	nopl   (%rax)
 116:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 11d:	00 00 00 

0000000000000120 <loadp>:
 120:	89 f6                	mov    %esi,%esi
 122:	8b 3c b5 00 00 00 00 	mov    0x0(,%rsi,4),%edi
 129:	85 ff                	test   %edi,%edi
 12b:	75 03                	jne    130 <loadp+0x10>
 12d:	f3 c3                	repz retq 
 12f:	90                   	nop
 130:	e9 00 00 00 00       	jmpq   135 <loadp+0x15>
 135:	90                   	nop
 136:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 13d:	00 00 00 

0000000000000140 <input>:
 140:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 147 <input+0x7>
 147:	53                   	push   %rbx
 148:	89 d3                	mov    %edx,%ebx
 14a:	e8 00 00 00 00       	callq  14f <input+0xf>
 14f:	89 04 9d 00 00 00 00 	mov    %eax,0x0(,%rbx,4)
 156:	5b                   	pop    %rbx
 157:	c3                   	retq   
 158:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 15f:	00 

0000000000000160 <output>:
 160:	89 d2                	mov    %edx,%edx
 162:	8b 3c 95 00 00 00 00 	mov    0x0(,%rdx,4),%edi
 169:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 16f:	76 07                	jbe    178 <output+0x18>
 171:	f3 c3                	repz retq 
 173:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 178:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 17f <output+0x1f>
 17f:	e9 00 00 00 00       	jmpq   184 <output+0x24>
 184:	66 90                	xchg   %ax,%ax
 186:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 18d:	00 00 00 

0000000000000190 <inactivate>:
 190:	89 d2                	mov    %edx,%edx
 192:	8b 3c 95 00 00 00 00 	mov    0x0(,%rdx,4),%edi
 199:	e9 00 00 00 00       	jmpq   19e <inactivate+0xe>
 19e:	66 90                	xchg   %ax,%ax

00000000000001a0 <activate>:
 1a0:	89 d2                	mov    %edx,%edx
 1a2:	53                   	push   %rbx
 1a3:	89 f3                	mov    %esi,%ebx
 1a5:	8b 3c 95 00 00 00 00 	mov    0x0(,%rdx,4),%edi
 1ac:	e8 00 00 00 00       	callq  1b1 <activate+0x11>
 1b1:	89 04 9d 00 00 00 00 	mov    %eax,0x0(,%rbx,4)
 1b8:	5b                   	pop    %rbx
 1b9:	c3                   	retq   
 1ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000001c0 <driver>:
 1c0:	41 56                	push   %r14
 1c2:	41 55                	push   %r13
 1c4:	49 89 fe             	mov    %rdi,%r14
 1c7:	41 54                	push   %r12
 1c9:	55                   	push   %rbp
 1ca:	bf 01 00 00 00       	mov    $0x1,%edi
 1cf:	53                   	push   %rbx
 1d0:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
 1d7:	48 89 e2             	mov    %rsp,%rdx
 1da:	e8 00 00 00 00       	callq  1df <driver+0x1f>
 1df:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
 1e4:	4c 63 ef             	movslq %edi,%r13
 1e7:	49 c1 ed 02          	shr    $0x2,%r13
 1eb:	44 89 eb             	mov    %r13d,%ebx
 1ee:	e8 00 00 00 00       	callq  1f3 <driver+0x33>
 1f3:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
 1fa:	00 
 1fb:	e8 00 00 00 00       	callq  200 <driver+0x40>
 200:	48 85 c0             	test   %rax,%rax
 203:	0f 84 f8 00 00 00    	je     301 <driver+0x141>
 209:	4c 89 f1             	mov    %r14,%rcx
 20c:	48 89 da             	mov    %rbx,%rdx
 20f:	be 04 00 00 00       	mov    $0x4,%esi
 214:	48 89 c7             	mov    %rax,%rdi
 217:	48 89 c5             	mov    %rax,%rbp
 21a:	e8 00 00 00 00       	callq  21f <driver+0x5f>
 21f:	41 39 c5             	cmp    %eax,%r13d
 222:	0f 85 d9 00 00 00    	jne    301 <driver+0x141>
 228:	31 db                	xor    %ebx,%ebx
 22a:	45 85 ed             	test   %r13d,%r13d
 22d:	45 89 ec             	mov    %r13d,%r12d
 230:	74 1e                	je     250 <driver+0x90>
 232:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 238:	8b 54 9d 00          	mov    0x0(%rbp,%rbx,4),%edx
 23c:	89 de                	mov    %ebx,%esi
 23e:	31 ff                	xor    %edi,%edi
 240:	48 83 c3 01          	add    $0x1,%rbx
 244:	0f ca                	bswap  %edx
 246:	e8 00 00 00 00       	callq  24b <driver+0x8b>
 24b:	41 39 dc             	cmp    %ebx,%r12d
 24e:	77 e8                	ja     238 <driver+0x78>
 250:	48 89 ef             	mov    %rbp,%rdi
 253:	31 ed                	xor    %ebp,%ebp
 255:	e8 00 00 00 00       	callq  25a <driver+0x9a>
 25a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 260:	89 ee                	mov    %ebp,%esi
 262:	31 ff                	xor    %edi,%edi
 264:	e8 00 00 00 00       	callq  269 <driver+0xa9>
 269:	89 c7                	mov    %eax,%edi
 26b:	e8 00 00 00 00       	callq  270 <driver+0xb0>
 270:	e8 00 00 00 00       	callq  275 <driver+0xb5>
 275:	48 63 d8             	movslq %eax,%rbx
 278:	e8 00 00 00 00       	callq  27d <driver+0xbd>
 27d:	83 fb 0c             	cmp    $0xc,%ebx
 280:	41 89 c4             	mov    %eax,%r12d
 283:	7f 3b                	jg     2c0 <driver+0x100>
 285:	e8 00 00 00 00       	callq  28a <driver+0xca>
 28a:	41 89 c6             	mov    %eax,%r14d
 28d:	e8 00 00 00 00       	callq  292 <driver+0xd2>
 292:	48 63 cb             	movslq %ebx,%rcx
 295:	41 89 c5             	mov    %eax,%r13d
 298:	44 89 f6             	mov    %r14d,%esi
 29b:	44 89 ea             	mov    %r13d,%edx
 29e:	44 89 e7             	mov    %r12d,%edi
 2a1:	ff 14 cd 00 00 00 00 	callq  *0x0(,%rcx,8)
 2a8:	83 fb 0c             	cmp    $0xc,%ebx
 2ab:	75 33                	jne    2e0 <driver+0x120>
 2ad:	42 8b 2c ad 00 00 00 	mov    0x0(,%r13,4),%ebp
 2b4:	00 
 2b5:	eb a9                	jmp    260 <driver+0xa0>
 2b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 2be:	00 00 
 2c0:	e8 00 00 00 00       	callq  2c5 <driver+0x105>
 2c5:	83 c5 01             	add    $0x1,%ebp
 2c8:	31 d2                	xor    %edx,%edx
 2ca:	89 c6                	mov    %eax,%esi
 2cc:	44 89 e7             	mov    %r12d,%edi
 2cf:	ff 14 dd 00 00 00 00 	callq  *0x0(,%rbx,8)
 2d6:	eb 88                	jmp    260 <driver+0xa0>
 2d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 2df:	00 
 2e0:	83 c5 01             	add    $0x1,%ebp
 2e3:	83 fb 07             	cmp    $0x7,%ebx
 2e6:	0f 85 74 ff ff ff    	jne    260 <driver+0xa0>
 2ec:	e8 00 00 00 00       	callq  2f1 <driver+0x131>
 2f1:	48 81 c4 90 00 00 00 	add    $0x90,%rsp
 2f8:	5b                   	pop    %rbx
 2f9:	5d                   	pop    %rbp
 2fa:	41 5c                	pop    %r12
 2fc:	41 5d                	pop    %r13
 2fe:	41 5e                	pop    %r14
 300:	c3                   	retq   
 301:	bf 01 00 00 00       	mov    $0x1,%edi
 306:	e8 00 00 00 00       	callq  30b <driver+0x14b>

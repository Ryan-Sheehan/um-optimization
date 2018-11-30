
instruction_driver.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <driver>:
   0:	41 56                	push   %r14
   2:	41 55                	push   %r13
   4:	49 89 fe             	mov    %rdi,%r14
   7:	41 54                	push   %r12
   9:	55                   	push   %rbp
   a:	bf 01 00 00 00       	mov    $0x1,%edi
   f:	53                   	push   %rbx
  10:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
  17:	48 89 e2             	mov    %rsp,%rdx
  1a:	e8 00 00 00 00       	callq  1f <driver+0x1f>
  1f:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  24:	4c 63 ef             	movslq %edi,%r13
  27:	49 c1 ed 02          	shr    $0x2,%r13
  2b:	44 89 eb             	mov    %r13d,%ebx
  2e:	e8 00 00 00 00       	callq  33 <driver+0x33>
  33:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
  3a:	00 
  3b:	e8 00 00 00 00       	callq  40 <driver+0x40>
  40:	48 85 c0             	test   %rax,%rax
  43:	0f 84 ad 03 00 00    	je     3f6 <driver+0x3f6>
  49:	4c 89 f1             	mov    %r14,%rcx
  4c:	48 89 da             	mov    %rbx,%rdx
  4f:	be 04 00 00 00       	mov    $0x4,%esi
  54:	48 89 c7             	mov    %rax,%rdi
  57:	48 89 c5             	mov    %rax,%rbp
  5a:	e8 00 00 00 00       	callq  5f <driver+0x5f>
  5f:	41 39 c5             	cmp    %eax,%r13d
  62:	0f 85 8e 03 00 00    	jne    3f6 <driver+0x3f6>
  68:	31 db                	xor    %ebx,%ebx
  6a:	45 85 ed             	test   %r13d,%r13d
  6d:	45 89 ec             	mov    %r13d,%r12d
  70:	74 1e                	je     90 <driver+0x90>
  72:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  78:	8b 54 9d 00          	mov    0x0(%rbp,%rbx,4),%edx
  7c:	89 de                	mov    %ebx,%esi
  7e:	31 ff                	xor    %edi,%edi
  80:	48 83 c3 01          	add    $0x1,%rbx
  84:	0f ca                	bswap  %edx
  86:	e8 00 00 00 00       	callq  8b <driver+0x8b>
  8b:	41 39 dc             	cmp    %ebx,%r12d
  8e:	77 e8                	ja     78 <driver+0x78>
  90:	48 89 ef             	mov    %rbp,%rdi
  93:	31 ed                	xor    %ebp,%ebp
  95:	e8 00 00 00 00       	callq  9a <driver+0x9a>
  9a:	e9 81 00 00 00       	jmpq   120 <driver+0x120>
  9f:	90                   	nop
  a0:	83 f8 01             	cmp    $0x1,%eax
  a3:	0f 84 e7 00 00 00    	je     190 <driver+0x190>
  a9:	83 f8 02             	cmp    $0x2,%eax
  ac:	0f 84 1e 01 00 00    	je     1d0 <driver+0x1d0>
  b2:	83 f8 03             	cmp    $0x3,%eax
  b5:	0f 84 55 01 00 00    	je     210 <driver+0x210>
  bb:	83 f8 04             	cmp    $0x4,%eax
  be:	0f 84 84 01 00 00    	je     248 <driver+0x248>
  c4:	83 f8 05             	cmp    $0x5,%eax
  c7:	0f 84 b3 01 00 00    	je     280 <driver+0x280>
  cd:	83 f8 06             	cmp    $0x6,%eax
  d0:	0f 84 ea 01 00 00    	je     2c0 <driver+0x2c0>
  d6:	83 f8 07             	cmp    $0x7,%eax
  d9:	74 3d                	je     118 <driver+0x118>
  db:	83 f8 08             	cmp    $0x8,%eax
  de:	0f 84 1c 02 00 00    	je     300 <driver+0x300>
  e4:	83 f8 09             	cmp    $0x9,%eax
  e7:	0f 84 43 02 00 00    	je     330 <driver+0x330>
  ed:	83 f8 0a             	cmp    $0xa,%eax
  f0:	0f 84 5a 02 00 00    	je     350 <driver+0x350>
  f6:	83 f8 0b             	cmp    $0xb,%eax
  f9:	0f 84 81 02 00 00    	je     380 <driver+0x380>
  ff:	83 f8 0c             	cmp    $0xc,%eax
 102:	0f 84 a0 02 00 00    	je     3a8 <driver+0x3a8>
 108:	83 f8 0d             	cmp    $0xd,%eax
 10b:	0f 84 bf 02 00 00    	je     3d0 <driver+0x3d0>
 111:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 118:	83 c5 01             	add    $0x1,%ebp
 11b:	83 fb 07             	cmp    $0x7,%ebx
 11e:	74 57                	je     177 <driver+0x177>
 120:	89 ee                	mov    %ebp,%esi
 122:	31 ff                	xor    %edi,%edi
 124:	e8 00 00 00 00       	callq  129 <driver+0x129>
 129:	89 c7                	mov    %eax,%edi
 12b:	e8 00 00 00 00       	callq  130 <driver+0x130>
 130:	e8 00 00 00 00       	callq  135 <driver+0x135>
 135:	85 c0                	test   %eax,%eax
 137:	89 c3                	mov    %eax,%ebx
 139:	0f 85 61 ff ff ff    	jne    a0 <driver+0xa0>
 13f:	e8 00 00 00 00       	callq  144 <driver+0x144>
 144:	89 c0                	mov    %eax,%eax
 146:	8b 04 85 00 00 00 00 	mov    0x0(,%rax,4),%eax
 14d:	85 c0                	test   %eax,%eax
 14f:	74 c7                	je     118 <driver+0x118>
 151:	e8 00 00 00 00       	callq  156 <driver+0x156>
 156:	41 89 c4             	mov    %eax,%r12d
 159:	83 c5 01             	add    $0x1,%ebp
 15c:	e8 00 00 00 00       	callq  161 <driver+0x161>
 161:	89 c0                	mov    %eax,%eax
 163:	83 fb 07             	cmp    $0x7,%ebx
 166:	8b 04 85 00 00 00 00 	mov    0x0(,%rax,4),%eax
 16d:	42 89 04 a5 00 00 00 	mov    %eax,0x0(,%r12,4)
 174:	00 
 175:	75 a9                	jne    120 <driver+0x120>
 177:	e8 00 00 00 00       	callq  17c <driver+0x17c>
 17c:	48 81 c4 90 00 00 00 	add    $0x90,%rsp
 183:	5b                   	pop    %rbx
 184:	5d                   	pop    %rbp
 185:	41 5c                	pop    %r12
 187:	41 5d                	pop    %r13
 189:	41 5e                	pop    %r14
 18b:	c3                   	retq   
 18c:	0f 1f 40 00          	nopl   0x0(%rax)
 190:	e8 00 00 00 00       	callq  195 <driver+0x195>
 195:	89 c0                	mov    %eax,%eax
 197:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 19e:	00 
 19f:	e8 00 00 00 00       	callq  1a4 <driver+0x1a4>
 1a4:	89 c0                	mov    %eax,%eax
 1a6:	44 8b 34 85 00 00 00 	mov    0x0(,%rax,4),%r14d
 1ad:	00 
 1ae:	e8 00 00 00 00       	callq  1b3 <driver+0x1b3>
 1b3:	44 89 ef             	mov    %r13d,%edi
 1b6:	41 89 c4             	mov    %eax,%r12d
 1b9:	44 89 f6             	mov    %r14d,%esi
 1bc:	e8 00 00 00 00       	callq  1c1 <driver+0x1c1>
 1c1:	42 89 04 a5 00 00 00 	mov    %eax,0x0(,%r12,4)
 1c8:	00 
 1c9:	e9 4a ff ff ff       	jmpq   118 <driver+0x118>
 1ce:	66 90                	xchg   %ax,%ax
 1d0:	e8 00 00 00 00       	callq  1d5 <driver+0x1d5>
 1d5:	89 c0                	mov    %eax,%eax
 1d7:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 1de:	00 
 1df:	e8 00 00 00 00       	callq  1e4 <driver+0x1e4>
 1e4:	89 c0                	mov    %eax,%eax
 1e6:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 1ed:	00 
 1ee:	e8 00 00 00 00       	callq  1f3 <driver+0x1f3>
 1f3:	89 c0                	mov    %eax,%eax
 1f5:	44 89 e7             	mov    %r12d,%edi
 1f8:	8b 14 85 00 00 00 00 	mov    0x0(,%rax,4),%edx
 1ff:	44 89 ee             	mov    %r13d,%esi
 202:	e8 00 00 00 00       	callq  207 <driver+0x207>
 207:	e9 0c ff ff ff       	jmpq   118 <driver+0x118>
 20c:	0f 1f 40 00          	nopl   0x0(%rax)
 210:	e8 00 00 00 00       	callq  215 <driver+0x215>
 215:	89 c0                	mov    %eax,%eax
 217:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 21e:	00 
 21f:	e8 00 00 00 00       	callq  224 <driver+0x224>
 224:	89 c0                	mov    %eax,%eax
 226:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 22d:	00 
 22e:	e8 00 00 00 00       	callq  233 <driver+0x233>
 233:	89 c0                	mov    %eax,%eax
 235:	45 01 ec             	add    %r13d,%r12d
 238:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 23f:	00 
 240:	e9 d3 fe ff ff       	jmpq   118 <driver+0x118>
 245:	0f 1f 00             	nopl   (%rax)
 248:	e8 00 00 00 00       	callq  24d <driver+0x24d>
 24d:	89 c0                	mov    %eax,%eax
 24f:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 256:	00 
 257:	e8 00 00 00 00       	callq  25c <driver+0x25c>
 25c:	89 c0                	mov    %eax,%eax
 25e:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 265:	00 
 266:	e8 00 00 00 00       	callq  26b <driver+0x26b>
 26b:	89 c0                	mov    %eax,%eax
 26d:	45 0f af e5          	imul   %r13d,%r12d
 271:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 278:	00 
 279:	e9 9a fe ff ff       	jmpq   118 <driver+0x118>
 27e:	66 90                	xchg   %ax,%ax
 280:	e8 00 00 00 00       	callq  285 <driver+0x285>
 285:	89 c0                	mov    %eax,%eax
 287:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 28e:	00 
 28f:	e8 00 00 00 00       	callq  294 <driver+0x294>
 294:	89 c0                	mov    %eax,%eax
 296:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 29d:	00 
 29e:	e8 00 00 00 00       	callq  2a3 <driver+0x2a3>
 2a3:	31 d2                	xor    %edx,%edx
 2a5:	89 c1                	mov    %eax,%ecx
 2a7:	44 89 e0             	mov    %r12d,%eax
 2aa:	41 f7 f5             	div    %r13d
 2ad:	89 04 8d 00 00 00 00 	mov    %eax,0x0(,%rcx,4)
 2b4:	e9 5f fe ff ff       	jmpq   118 <driver+0x118>
 2b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 2c0:	e8 00 00 00 00       	callq  2c5 <driver+0x2c5>
 2c5:	89 c0                	mov    %eax,%eax
 2c7:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 2ce:	00 
 2cf:	e8 00 00 00 00       	callq  2d4 <driver+0x2d4>
 2d4:	89 c0                	mov    %eax,%eax
 2d6:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 2dd:	00 
 2de:	e8 00 00 00 00       	callq  2e3 <driver+0x2e3>
 2e3:	89 c0                	mov    %eax,%eax
 2e5:	45 21 ec             	and    %r13d,%r12d
 2e8:	41 f7 d4             	not    %r12d
 2eb:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 2f2:	00 
 2f3:	e9 20 fe ff ff       	jmpq   118 <driver+0x118>
 2f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 2ff:	00 
 300:	e8 00 00 00 00       	callq  305 <driver+0x305>
 305:	89 c0                	mov    %eax,%eax
 307:	8b 3c 85 00 00 00 00 	mov    0x0(,%rax,4),%edi
 30e:	e8 00 00 00 00       	callq  313 <driver+0x313>
 313:	41 89 c4             	mov    %eax,%r12d
 316:	e8 00 00 00 00       	callq  31b <driver+0x31b>
 31b:	89 c0                	mov    %eax,%eax
 31d:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 324:	00 
 325:	e9 ee fd ff ff       	jmpq   118 <driver+0x118>
 32a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 330:	e8 00 00 00 00       	callq  335 <driver+0x335>
 335:	89 c0                	mov    %eax,%eax
 337:	8b 3c 85 00 00 00 00 	mov    0x0(,%rax,4),%edi
 33e:	e8 00 00 00 00       	callq  343 <driver+0x343>
 343:	e9 d0 fd ff ff       	jmpq   118 <driver+0x118>
 348:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 34f:	00 
 350:	e8 00 00 00 00       	callq  355 <driver+0x355>
 355:	89 c0                	mov    %eax,%eax
 357:	8b 3c 85 00 00 00 00 	mov    0x0(,%rax,4),%edi
 35e:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 364:	0f 87 ae fd ff ff    	ja     118 <driver+0x118>
 36a:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 371 <driver+0x371>
 371:	e8 00 00 00 00       	callq  376 <driver+0x376>
 376:	e9 9d fd ff ff       	jmpq   118 <driver+0x118>
 37b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 380:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 387 <driver+0x387>
 387:	e8 00 00 00 00       	callq  38c <driver+0x38c>
 38c:	41 89 c4             	mov    %eax,%r12d
 38f:	e8 00 00 00 00       	callq  394 <driver+0x394>
 394:	89 c0                	mov    %eax,%eax
 396:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 39d:	00 
 39e:	e9 75 fd ff ff       	jmpq   118 <driver+0x118>
 3a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 3a8:	e8 00 00 00 00       	callq  3ad <driver+0x3ad>
 3ad:	89 c0                	mov    %eax,%eax
 3af:	8b 1c 85 00 00 00 00 	mov    0x0(,%rax,4),%ebx
 3b6:	e8 00 00 00 00       	callq  3bb <driver+0x3bb>
 3bb:	85 db                	test   %ebx,%ebx
 3bd:	75 2b                	jne    3ea <driver+0x3ea>
 3bf:	89 c0                	mov    %eax,%eax
 3c1:	8b 2c 85 00 00 00 00 	mov    0x0(,%rax,4),%ebp
 3c8:	e9 53 fd ff ff       	jmpq   120 <driver+0x120>
 3cd:	0f 1f 00             	nopl   (%rax)
 3d0:	e8 00 00 00 00       	callq  3d5 <driver+0x3d5>
 3d5:	41 89 c4             	mov    %eax,%r12d
 3d8:	e8 00 00 00 00       	callq  3dd <driver+0x3dd>
 3dd:	42 89 04 a5 00 00 00 	mov    %eax,0x0(,%r12,4)
 3e4:	00 
 3e5:	e9 2e fd ff ff       	jmpq   118 <driver+0x118>
 3ea:	89 df                	mov    %ebx,%edi
 3ec:	e8 00 00 00 00       	callq  3f1 <driver+0x3f1>
 3f1:	e9 2a fd ff ff       	jmpq   120 <driver+0x120>
 3f6:	bf 01 00 00 00       	mov    $0x1,%edi
 3fb:	e8 00 00 00 00       	callq  400 <driver+0x400>


instruction_driver.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <driver>:
   0:	41 57                	push   %r15
   2:	41 56                	push   %r14
   4:	49 89 ff             	mov    %rdi,%r15
   7:	41 55                	push   %r13
   9:	41 54                	push   %r12
   b:	bf 01 00 00 00       	mov    $0x1,%edi
  10:	55                   	push   %rbp
  11:	53                   	push   %rbx
  12:	49 89 f6             	mov    %rsi,%r14
  15:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  1c:	48 89 e2             	mov    %rsp,%rdx
  1f:	e8 00 00 00 00       	callq  24 <driver+0x24>
  24:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  29:	4c 63 ef             	movslq %edi,%r13
  2c:	49 c1 ed 02          	shr    $0x2,%r13
  30:	44 89 eb             	mov    %r13d,%ebx
  33:	45 89 ec             	mov    %r13d,%r12d
  36:	e8 00 00 00 00       	callq  3b <driver+0x3b>
  3b:	48 8d 3c 9d 00 00 00 	lea    0x0(,%rbx,4),%rdi
  42:	00 
  43:	e8 00 00 00 00       	callq  48 <driver+0x48>
  48:	48 85 c0             	test   %rax,%rax
  4b:	48 89 c5             	mov    %rax,%rbp
  4e:	0f 84 d6 03 00 00    	je     42a <driver+0x42a>
  54:	4c 89 f9             	mov    %r15,%rcx
  57:	48 89 da             	mov    %rbx,%rdx
  5a:	be 04 00 00 00       	mov    $0x4,%esi
  5f:	48 89 ef             	mov    %rbp,%rdi
  62:	e8 00 00 00 00       	callq  67 <driver+0x67>
  67:	41 39 c5             	cmp    %eax,%r13d
  6a:	74 34                	je     a0 <driver+0xa0>
  6c:	ba 4d 00 00 00       	mov    $0x4d,%edx
  71:	be 00 00 00 00       	mov    $0x0,%esi
  76:	bf 00 00 00 00       	mov    $0x0,%edi
  7b:	e8 00 00 00 00       	callq  80 <driver+0x80>
  80:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 87 <driver+0x87>
  87:	4c 89 f2             	mov    %r14,%rdx
  8a:	be 00 00 00 00       	mov    $0x0,%esi
  8f:	31 c0                	xor    %eax,%eax
  91:	e8 00 00 00 00       	callq  96 <driver+0x96>
  96:	bf 01 00 00 00       	mov    $0x1,%edi
  9b:	e8 00 00 00 00       	callq  a0 <driver+0xa0>
  a0:	31 db                	xor    %ebx,%ebx
  a2:	45 85 ed             	test   %r13d,%r13d
  a5:	74 21                	je     c8 <driver+0xc8>
  a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  ae:	00 00 
  b0:	8b 54 9d 00          	mov    0x0(%rbp,%rbx,4),%edx
  b4:	89 de                	mov    %ebx,%esi
  b6:	31 ff                	xor    %edi,%edi
  b8:	48 83 c3 01          	add    $0x1,%rbx
  bc:	0f ca                	bswap  %edx
  be:	e8 00 00 00 00       	callq  c3 <driver+0xc3>
  c3:	41 39 dc             	cmp    %ebx,%r12d
  c6:	77 e8                	ja     b0 <driver+0xb0>
  c8:	48 89 ef             	mov    %rbp,%rdi
  cb:	31 ed                	xor    %ebp,%ebp
  cd:	e8 00 00 00 00       	callq  d2 <driver+0xd2>
  d2:	e9 89 00 00 00       	jmpq   160 <driver+0x160>
  d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  de:	00 00 
  e0:	83 f8 01             	cmp    $0x1,%eax
  e3:	0f 84 e7 00 00 00    	je     1d0 <driver+0x1d0>
  e9:	83 f8 02             	cmp    $0x2,%eax
  ec:	0f 84 1e 01 00 00    	je     210 <driver+0x210>
  f2:	83 f8 03             	cmp    $0x3,%eax
  f5:	0f 84 55 01 00 00    	je     250 <driver+0x250>
  fb:	83 f8 04             	cmp    $0x4,%eax
  fe:	0f 84 84 01 00 00    	je     288 <driver+0x288>
 104:	83 f8 05             	cmp    $0x5,%eax
 107:	0f 84 b3 01 00 00    	je     2c0 <driver+0x2c0>
 10d:	83 f8 06             	cmp    $0x6,%eax
 110:	0f 84 ea 01 00 00    	je     300 <driver+0x300>
 116:	83 f8 07             	cmp    $0x7,%eax
 119:	74 3d                	je     158 <driver+0x158>
 11b:	83 f8 08             	cmp    $0x8,%eax
 11e:	0f 84 1c 02 00 00    	je     340 <driver+0x340>
 124:	83 f8 09             	cmp    $0x9,%eax
 127:	0f 84 43 02 00 00    	je     370 <driver+0x370>
 12d:	83 f8 0a             	cmp    $0xa,%eax
 130:	0f 84 5a 02 00 00    	je     390 <driver+0x390>
 136:	83 f8 0b             	cmp    $0xb,%eax
 139:	0f 84 81 02 00 00    	je     3c0 <driver+0x3c0>
 13f:	83 f8 0c             	cmp    $0xc,%eax
 142:	0f 84 a0 02 00 00    	je     3e8 <driver+0x3e8>
 148:	83 f8 0d             	cmp    $0xd,%eax
 14b:	0f 84 bf 02 00 00    	je     410 <driver+0x410>
 151:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 158:	83 c5 01             	add    $0x1,%ebp
 15b:	83 fb 07             	cmp    $0x7,%ebx
 15e:	74 57                	je     1b7 <driver+0x1b7>
 160:	89 ee                	mov    %ebp,%esi
 162:	31 ff                	xor    %edi,%edi
 164:	e8 00 00 00 00       	callq  169 <driver+0x169>
 169:	89 c7                	mov    %eax,%edi
 16b:	e8 00 00 00 00       	callq  170 <driver+0x170>
 170:	e8 00 00 00 00       	callq  175 <driver+0x175>
 175:	85 c0                	test   %eax,%eax
 177:	89 c3                	mov    %eax,%ebx
 179:	0f 85 61 ff ff ff    	jne    e0 <driver+0xe0>
 17f:	e8 00 00 00 00       	callq  184 <driver+0x184>
 184:	89 c0                	mov    %eax,%eax
 186:	8b 04 85 00 00 00 00 	mov    0x0(,%rax,4),%eax
 18d:	85 c0                	test   %eax,%eax
 18f:	74 c7                	je     158 <driver+0x158>
 191:	e8 00 00 00 00       	callq  196 <driver+0x196>
 196:	89 c0                	mov    %eax,%eax
 198:	83 c5 01             	add    $0x1,%ebp
 19b:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 1a2:	00 
 1a3:	e8 00 00 00 00       	callq  1a8 <driver+0x1a8>
 1a8:	83 fb 07             	cmp    $0x7,%ebx
 1ab:	89 c0                	mov    %eax,%eax
 1ad:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 1b4:	00 
 1b5:	75 a9                	jne    160 <driver+0x160>
 1b7:	e8 00 00 00 00       	callq  1bc <driver+0x1bc>
 1bc:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
 1c3:	5b                   	pop    %rbx
 1c4:	5d                   	pop    %rbp
 1c5:	41 5c                	pop    %r12
 1c7:	41 5d                	pop    %r13
 1c9:	41 5e                	pop    %r14
 1cb:	41 5f                	pop    %r15
 1cd:	c3                   	retq   
 1ce:	66 90                	xchg   %ax,%ax
 1d0:	e8 00 00 00 00       	callq  1d5 <driver+0x1d5>
 1d5:	89 c0                	mov    %eax,%eax
 1d7:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 1de:	00 
 1df:	e8 00 00 00 00       	callq  1e4 <driver+0x1e4>
 1e4:	89 c0                	mov    %eax,%eax
 1e6:	8b 34 85 00 00 00 00 	mov    0x0(,%rax,4),%esi
 1ed:	44 89 e7             	mov    %r12d,%edi
 1f0:	e8 00 00 00 00       	callq  1f5 <driver+0x1f5>
 1f5:	41 89 c4             	mov    %eax,%r12d
 1f8:	e8 00 00 00 00       	callq  1fd <driver+0x1fd>
 1fd:	89 c0                	mov    %eax,%eax
 1ff:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 206:	00 
 207:	e9 4c ff ff ff       	jmpq   158 <driver+0x158>
 20c:	0f 1f 40 00          	nopl   0x0(%rax)
 210:	e8 00 00 00 00       	callq  215 <driver+0x215>
 215:	89 c0                	mov    %eax,%eax
 217:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 21e:	00 
 21f:	e8 00 00 00 00       	callq  224 <driver+0x224>
 224:	89 c0                	mov    %eax,%eax
 226:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 22d:	00 
 22e:	e8 00 00 00 00       	callq  233 <driver+0x233>
 233:	89 c0                	mov    %eax,%eax
 235:	44 89 e7             	mov    %r12d,%edi
 238:	8b 14 85 00 00 00 00 	mov    0x0(,%rax,4),%edx
 23f:	44 89 ee             	mov    %r13d,%esi
 242:	e8 00 00 00 00       	callq  247 <driver+0x247>
 247:	e9 0c ff ff ff       	jmpq   158 <driver+0x158>
 24c:	0f 1f 40 00          	nopl   0x0(%rax)
 250:	e8 00 00 00 00       	callq  255 <driver+0x255>
 255:	89 c0                	mov    %eax,%eax
 257:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 25e:	00 
 25f:	e8 00 00 00 00       	callq  264 <driver+0x264>
 264:	89 c0                	mov    %eax,%eax
 266:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 26d:	00 
 26e:	e8 00 00 00 00       	callq  273 <driver+0x273>
 273:	89 c0                	mov    %eax,%eax
 275:	45 01 ec             	add    %r13d,%r12d
 278:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 27f:	00 
 280:	e9 d3 fe ff ff       	jmpq   158 <driver+0x158>
 285:	0f 1f 00             	nopl   (%rax)
 288:	e8 00 00 00 00       	callq  28d <driver+0x28d>
 28d:	89 c0                	mov    %eax,%eax
 28f:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 296:	00 
 297:	e8 00 00 00 00       	callq  29c <driver+0x29c>
 29c:	89 c0                	mov    %eax,%eax
 29e:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 2a5:	00 
 2a6:	e8 00 00 00 00       	callq  2ab <driver+0x2ab>
 2ab:	89 c0                	mov    %eax,%eax
 2ad:	45 0f af e5          	imul   %r13d,%r12d
 2b1:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 2b8:	00 
 2b9:	e9 9a fe ff ff       	jmpq   158 <driver+0x158>
 2be:	66 90                	xchg   %ax,%ax
 2c0:	e8 00 00 00 00       	callq  2c5 <driver+0x2c5>
 2c5:	89 c0                	mov    %eax,%eax
 2c7:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 2ce:	00 
 2cf:	e8 00 00 00 00       	callq  2d4 <driver+0x2d4>
 2d4:	89 c0                	mov    %eax,%eax
 2d6:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 2dd:	00 
 2de:	e8 00 00 00 00       	callq  2e3 <driver+0x2e3>
 2e3:	31 d2                	xor    %edx,%edx
 2e5:	89 c1                	mov    %eax,%ecx
 2e7:	44 89 e0             	mov    %r12d,%eax
 2ea:	41 f7 f5             	div    %r13d
 2ed:	89 04 8d 00 00 00 00 	mov    %eax,0x0(,%rcx,4)
 2f4:	e9 5f fe ff ff       	jmpq   158 <driver+0x158>
 2f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 300:	e8 00 00 00 00       	callq  305 <driver+0x305>
 305:	89 c0                	mov    %eax,%eax
 307:	44 8b 2c 85 00 00 00 	mov    0x0(,%rax,4),%r13d
 30e:	00 
 30f:	e8 00 00 00 00       	callq  314 <driver+0x314>
 314:	89 c0                	mov    %eax,%eax
 316:	44 8b 24 85 00 00 00 	mov    0x0(,%rax,4),%r12d
 31d:	00 
 31e:	e8 00 00 00 00       	callq  323 <driver+0x323>
 323:	89 c0                	mov    %eax,%eax
 325:	45 21 ec             	and    %r13d,%r12d
 328:	41 f7 d4             	not    %r12d
 32b:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 332:	00 
 333:	e9 20 fe ff ff       	jmpq   158 <driver+0x158>
 338:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 33f:	00 
 340:	e8 00 00 00 00       	callq  345 <driver+0x345>
 345:	89 c0                	mov    %eax,%eax
 347:	8b 3c 85 00 00 00 00 	mov    0x0(,%rax,4),%edi
 34e:	e8 00 00 00 00       	callq  353 <driver+0x353>
 353:	41 89 c4             	mov    %eax,%r12d
 356:	e8 00 00 00 00       	callq  35b <driver+0x35b>
 35b:	89 c0                	mov    %eax,%eax
 35d:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 364:	00 
 365:	e9 ee fd ff ff       	jmpq   158 <driver+0x158>
 36a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 370:	e8 00 00 00 00       	callq  375 <driver+0x375>
 375:	89 c0                	mov    %eax,%eax
 377:	8b 3c 85 00 00 00 00 	mov    0x0(,%rax,4),%edi
 37e:	e8 00 00 00 00       	callq  383 <driver+0x383>
 383:	e9 d0 fd ff ff       	jmpq   158 <driver+0x158>
 388:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 38f:	00 
 390:	e8 00 00 00 00       	callq  395 <driver+0x395>
 395:	89 c0                	mov    %eax,%eax
 397:	8b 3c 85 00 00 00 00 	mov    0x0(,%rax,4),%edi
 39e:	81 ff ff 00 00 00    	cmp    $0xff,%edi
 3a4:	0f 87 ae fd ff ff    	ja     158 <driver+0x158>
 3aa:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 3b1 <driver+0x3b1>
 3b1:	e8 00 00 00 00       	callq  3b6 <driver+0x3b6>
 3b6:	e9 9d fd ff ff       	jmpq   158 <driver+0x158>
 3bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 3c0:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 3c7 <driver+0x3c7>
 3c7:	e8 00 00 00 00       	callq  3cc <driver+0x3cc>
 3cc:	41 89 c4             	mov    %eax,%r12d
 3cf:	e8 00 00 00 00       	callq  3d4 <driver+0x3d4>
 3d4:	89 c0                	mov    %eax,%eax
 3d6:	44 89 24 85 00 00 00 	mov    %r12d,0x0(,%rax,4)
 3dd:	00 
 3de:	e9 75 fd ff ff       	jmpq   158 <driver+0x158>
 3e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 3e8:	e8 00 00 00 00       	callq  3ed <driver+0x3ed>
 3ed:	89 c0                	mov    %eax,%eax
 3ef:	8b 1c 85 00 00 00 00 	mov    0x0(,%rax,4),%ebx
 3f6:	e8 00 00 00 00       	callq  3fb <driver+0x3fb>
 3fb:	85 db                	test   %ebx,%ebx
 3fd:	75 44                	jne    443 <driver+0x443>
 3ff:	89 c0                	mov    %eax,%eax
 401:	8b 2c 85 00 00 00 00 	mov    0x0(,%rax,4),%ebp
 408:	e9 53 fd ff ff       	jmpq   160 <driver+0x160>
 40d:	0f 1f 00             	nopl   (%rax)
 410:	e8 00 00 00 00       	callq  415 <driver+0x415>
 415:	41 89 c4             	mov    %eax,%r12d
 418:	e8 00 00 00 00       	callq  41d <driver+0x41d>
 41d:	42 89 04 a5 00 00 00 	mov    %eax,0x0(,%r12,4)
 424:	00 
 425:	e9 2e fd ff ff       	jmpq   158 <driver+0x158>
 42a:	ba 4b 00 00 00       	mov    $0x4b,%edx
 42f:	be 00 00 00 00       	mov    $0x0,%esi
 434:	bf 00 00 00 00       	mov    $0x0,%edi
 439:	e8 00 00 00 00       	callq  43e <driver+0x43e>
 43e:	e9 11 fc ff ff       	jmpq   54 <driver+0x54>
 443:	89 df                	mov    %ebx,%edi
 445:	e8 00 00 00 00       	callq  44a <driver+0x44a>
 44a:	e9 11 fd ff ff       	jmpq   160 <driver+0x160>

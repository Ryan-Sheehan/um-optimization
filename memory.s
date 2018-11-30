
memory.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <init_segments>:
   0:	53                   	push   %rbx
   1:	e8 00 00 00 00       	callq  6 <init_segments+0x6>
   6:	bf 0a 00 00 00       	mov    $0xa,%edi
   b:	48 89 c3             	mov    %rax,%rbx
   e:	e8 00 00 00 00       	callq  13 <init_segments+0x13>
  13:	48 89 de             	mov    %rbx,%rsi
  16:	48 89 c7             	mov    %rax,%rdi
  19:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 20 <init_segments+0x20>
  20:	e8 00 00 00 00       	callq  25 <init_segments+0x25>
  25:	c7 05 00 00 00 00 01 	movl   $0x1,0x0(%rip)        # 2f <init_segments+0x2f>
  2c:	00 00 00 
  2f:	e8 00 00 00 00       	callq  34 <init_segments+0x34>
  34:	5b                   	pop    %rbx
  35:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 3c <init_segments+0x3c>
  3c:	c3                   	retq   
  3d:	0f 1f 00             	nopl   (%rax)

0000000000000040 <map_segment>:
  40:	55                   	push   %rbp
  41:	53                   	push   %rbx
  42:	48 83 ec 08          	sub    $0x8,%rsp
  46:	e8 00 00 00 00       	callq  4b <map_segment+0xb>
  4b:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 52 <map_segment+0x12>
  52:	48 89 c5             	mov    %rax,%rbp
  55:	e8 00 00 00 00       	callq  5a <map_segment+0x1a>
  5a:	85 c0                	test   %eax,%eax
  5c:	75 32                	jne    90 <map_segment+0x50>
  5e:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 65 <map_segment+0x25>
  65:	e8 00 00 00 00       	callq  6a <map_segment+0x2a>
  6a:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 71 <map_segment+0x31>
  71:	48 89 ea             	mov    %rbp,%rdx
  74:	89 c6                	mov    %eax,%esi
  76:	48 89 c3             	mov    %rax,%rbx
  79:	e8 00 00 00 00       	callq  7e <map_segment+0x3e>
  7e:	48 83 c4 08          	add    $0x8,%rsp
  82:	89 d8                	mov    %ebx,%eax
  84:	5b                   	pop    %rbx
  85:	5d                   	pop    %rbp
  86:	c3                   	retq   
  87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  8e:	00 00 
  90:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 97 <map_segment+0x57>
  97:	48 89 ee             	mov    %rbp,%rsi
  9a:	e8 00 00 00 00       	callq  9f <map_segment+0x5f>
  9f:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # a5 <map_segment+0x65>
  a5:	8d 50 01             	lea    0x1(%rax),%edx
  a8:	89 15 00 00 00 00    	mov    %edx,0x0(%rip)        # ae <map_segment+0x6e>
  ae:	48 83 c4 08          	add    $0x8,%rsp
  b2:	5b                   	pop    %rbx
  b3:	5d                   	pop    %rbp
  b4:	c3                   	retq   
  b5:	90                   	nop
  b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  bd:	00 00 00 

00000000000000c0 <mem_put>:
  c0:	55                   	push   %rbp
  c1:	53                   	push   %rbx
  c2:	89 f3                	mov    %esi,%ebx
  c4:	89 fe                	mov    %edi,%esi
  c6:	89 d5                	mov    %edx,%ebp
  c8:	48 83 ec 08          	sub    $0x8,%rsp
  cc:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # d3 <mem_put+0x13>
  d3:	e8 00 00 00 00       	callq  d8 <mem_put+0x18>
  d8:	48 83 c4 08          	add    $0x8,%rsp
  dc:	89 ea                	mov    %ebp,%edx
  de:	89 de                	mov    %ebx,%esi
  e0:	5b                   	pop    %rbx
  e1:	5d                   	pop    %rbp
  e2:	48 89 c7             	mov    %rax,%rdi
  e5:	e9 00 00 00 00       	jmpq   ea <mem_put+0x2a>
  ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000000f0 <mem_get>:
  f0:	53                   	push   %rbx
  f1:	89 f3                	mov    %esi,%ebx
  f3:	89 fe                	mov    %edi,%esi
  f5:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # fc <mem_get+0xc>
  fc:	e8 00 00 00 00       	callq  101 <mem_get+0x11>
 101:	89 de                	mov    %ebx,%esi
 103:	48 89 c7             	mov    %rax,%rdi
 106:	5b                   	pop    %rbx
 107:	e9 00 00 00 00       	jmpq   10c <mem_get+0x1c>
 10c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000110 <load_program_mem>:
 110:	41 54                	push   %r12
 112:	55                   	push   %rbp
 113:	31 f6                	xor    %esi,%esi
 115:	53                   	push   %rbx
 116:	89 fb                	mov    %edi,%ebx
 118:	48 83 ec 10          	sub    $0x10,%rsp
 11c:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 123 <load_program_mem+0x13>
 123:	e8 00 00 00 00       	callq  128 <load_program_mem+0x18>
 128:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 12f <load_program_mem+0x1f>
 12f:	89 de                	mov    %ebx,%esi
 131:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
 136:	e8 00 00 00 00       	callq  13b <load_program_mem+0x2b>
 13b:	48 89 c7             	mov    %rax,%rdi
 13e:	49 89 c4             	mov    %rax,%r12
 141:	e8 00 00 00 00       	callq  146 <load_program_mem+0x36>
 146:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
 14b:	89 c5                	mov    %eax,%ebp
 14d:	89 c6                	mov    %eax,%esi
 14f:	e8 00 00 00 00       	callq  154 <load_program_mem+0x44>
 154:	85 ed                	test   %ebp,%ebp
 156:	74 27                	je     17f <load_program_mem+0x6f>
 158:	31 db                	xor    %ebx,%ebx
 15a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 160:	89 de                	mov    %ebx,%esi
 162:	4c 89 e7             	mov    %r12,%rdi
 165:	e8 00 00 00 00       	callq  16a <load_program_mem+0x5a>
 16a:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
 16f:	89 de                	mov    %ebx,%esi
 171:	89 c2                	mov    %eax,%edx
 173:	83 c3 01             	add    $0x1,%ebx
 176:	e8 00 00 00 00       	callq  17b <load_program_mem+0x6b>
 17b:	39 dd                	cmp    %ebx,%ebp
 17d:	75 e1                	jne    160 <load_program_mem+0x50>
 17f:	48 83 c4 10          	add    $0x10,%rsp
 183:	5b                   	pop    %rbx
 184:	5d                   	pop    %rbp
 185:	41 5c                	pop    %r12
 187:	c3                   	retq   
 188:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 18f:	00 

0000000000000190 <unmap_segment>:
 190:	53                   	push   %rbx
 191:	89 fe                	mov    %edi,%esi
 193:	89 fb                	mov    %edi,%ebx
 195:	31 d2                	xor    %edx,%edx
 197:	48 83 ec 10          	sub    $0x10,%rsp
 19b:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 1a2 <unmap_segment+0x12>
 1a2:	e8 00 00 00 00       	callq  1a7 <unmap_segment+0x17>
 1a7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
 1ac:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
 1b1:	e8 00 00 00 00       	callq  1b6 <unmap_segment+0x26>
 1b6:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 1bd <unmap_segment+0x2d>
 1bd:	89 de                	mov    %ebx,%esi
 1bf:	e8 00 00 00 00       	callq  1c4 <unmap_segment+0x34>
 1c4:	48 83 c4 10          	add    $0x10,%rsp
 1c8:	5b                   	pop    %rbx
 1c9:	c3                   	retq   
 1ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000001d0 <free_segments>:
 1d0:	55                   	push   %rbp
 1d1:	53                   	push   %rbx
 1d2:	31 db                	xor    %ebx,%ebx
 1d4:	48 83 ec 18          	sub    $0x18,%rsp
 1d8:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 1df <free_segments+0xf>
 1df:	e8 00 00 00 00       	callq  1e4 <free_segments+0x14>
 1e4:	85 c0                	test   %eax,%eax
 1e6:	89 c5                	mov    %eax,%ebp
 1e8:	7e 2f                	jle    219 <free_segments+0x49>
 1ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 1f0:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 1f7 <free_segments+0x27>
 1f7:	89 de                	mov    %ebx,%esi
 1f9:	e8 00 00 00 00       	callq  1fe <free_segments+0x2e>
 1fe:	48 85 c0             	test   %rax,%rax
 201:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
 206:	74 0a                	je     212 <free_segments+0x42>
 208:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
 20d:	e8 00 00 00 00       	callq  212 <free_segments+0x42>
 212:	83 c3 01             	add    $0x1,%ebx
 215:	39 dd                	cmp    %ebx,%ebp
 217:	75 d7                	jne    1f0 <free_segments+0x20>
 219:	bf 00 00 00 00       	mov    $0x0,%edi
 21e:	e8 00 00 00 00       	callq  223 <free_segments+0x53>
 223:	bf 00 00 00 00       	mov    $0x0,%edi
 228:	e8 00 00 00 00       	callq  22d <free_segments+0x5d>
 22d:	48 83 c4 18          	add    $0x18,%rsp
 231:	5b                   	pop    %rbx
 232:	5d                   	pop    %rbp
 233:	c3                   	retq   

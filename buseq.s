
buseq.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <BUSeq_new>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	89 fd                	mov    %edi,%ebp
   4:	bf 08 00 00 00       	mov    $0x8,%edi
   9:	48 83 ec 08          	sub    $0x8,%rsp
   d:	e8 00 00 00 00       	callq  12 <BUSeq_new+0x12>
  12:	89 ef                	mov    %ebp,%edi
  14:	be 08 00 00 00       	mov    $0x8,%esi
  19:	48 89 c3             	mov    %rax,%rbx
  1c:	e8 00 00 00 00       	callq  21 <BUSeq_new+0x21>
  21:	48 85 c0             	test   %rax,%rax
  24:	48 89 03             	mov    %rax,(%rbx)
  27:	74 0d                	je     36 <BUSeq_new+0x36>
  29:	89 6b 0c             	mov    %ebp,0xc(%rbx)
  2c:	48 83 c4 08          	add    $0x8,%rsp
  30:	48 89 d8             	mov    %rbx,%rax
  33:	5b                   	pop    %rbx
  34:	5d                   	pop    %rbp
  35:	c3                   	retq   
  36:	bf 01 00 00 00       	mov    $0x1,%edi
  3b:	e8 00 00 00 00       	callq  40 <BUSeq_free>

0000000000000040 <BUSeq_free>:
  40:	53                   	push   %rbx
  41:	48 8b 07             	mov    (%rdi),%rax
  44:	48 85 c0             	test   %rax,%rax
  47:	74 1c                	je     65 <BUSeq_free+0x25>
  49:	48 89 fb             	mov    %rdi,%rbx
  4c:	48 8b 38             	mov    (%rax),%rdi
  4f:	e8 00 00 00 00       	callq  54 <BUSeq_free+0x14>
  54:	48 8b 3b             	mov    (%rbx),%rdi
  57:	e8 00 00 00 00       	callq  5c <BUSeq_free+0x1c>
  5c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  63:	5b                   	pop    %rbx
  64:	c3                   	retq   
  65:	bf 01 00 00 00       	mov    $0x1,%edi
  6a:	e8 00 00 00 00       	callq  6f <BUSeq_free+0x2f>
  6f:	90                   	nop

0000000000000070 <BUSeq_get>:
  70:	48 83 ec 08          	sub    $0x8,%rsp
  74:	48 85 ff             	test   %rdi,%rdi
  77:	74 13                	je     8c <BUSeq_get+0x1c>
  79:	39 77 08             	cmp    %esi,0x8(%rdi)
  7c:	76 0e                	jbe    8c <BUSeq_get+0x1c>
  7e:	48 8b 07             	mov    (%rdi),%rax
  81:	89 f6                	mov    %esi,%esi
  83:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
  87:	48 83 c4 08          	add    $0x8,%rsp
  8b:	c3                   	retq   
  8c:	bf 01 00 00 00       	mov    $0x1,%edi
  91:	e8 00 00 00 00       	callq  96 <BUSeq_get+0x26>
  96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  9d:	00 00 00 

00000000000000a0 <BUSeq_length>:
  a0:	48 85 ff             	test   %rdi,%rdi
  a3:	74 04                	je     a9 <BUSeq_length+0x9>
  a5:	8b 47 08             	mov    0x8(%rdi),%eax
  a8:	c3                   	retq   
  a9:	50                   	push   %rax
  aa:	bf 01 00 00 00       	mov    $0x1,%edi
  af:	e8 00 00 00 00       	callq  b4 <BUSeq_length+0x14>
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  bd:	00 00 00 

00000000000000c0 <BUSeq_put>:
  c0:	48 83 ec 08          	sub    $0x8,%rsp
  c4:	48 85 ff             	test   %rdi,%rdi
  c7:	74 19                	je     e2 <BUSeq_put+0x22>
  c9:	39 77 0c             	cmp    %esi,0xc(%rdi)
  cc:	76 14                	jbe    e2 <BUSeq_put+0x22>
  ce:	48 8b 07             	mov    (%rdi),%rax
  d1:	89 f6                	mov    %esi,%esi
  d3:	48 8d 0c f0          	lea    (%rax,%rsi,8),%rcx
  d7:	48 8b 01             	mov    (%rcx),%rax
  da:	48 89 11             	mov    %rdx,(%rcx)
  dd:	48 83 c4 08          	add    $0x8,%rsp
  e1:	c3                   	retq   
  e2:	bf 01 00 00 00       	mov    $0x1,%edi
  e7:	e8 00 00 00 00       	callq  ec <BUSeq_put+0x2c>
  ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000000f0 <BUSeq_addhi>:
  f0:	48 85 ff             	test   %rdi,%rdi
  f3:	41 54                	push   %r12
  f5:	55                   	push   %rbp
  f6:	53                   	push   %rbx
  f7:	74 57                	je     150 <BUSeq_addhi+0x60>
  f9:	8b 57 08             	mov    0x8(%rdi),%edx
  fc:	48 89 fd             	mov    %rdi,%rbp
  ff:	49 89 f4             	mov    %rsi,%r12
 102:	3b 57 0c             	cmp    0xc(%rdi),%edx
 105:	74 19                	je     120 <BUSeq_addhi+0x30>
 107:	48 8b 07             	mov    (%rdi),%rax
 10a:	8d 4a 01             	lea    0x1(%rdx),%ecx
 10d:	89 4d 08             	mov    %ecx,0x8(%rbp)
 110:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 114:	5b                   	pop    %rbx
 115:	5d                   	pop    %rbp
 116:	41 5c                	pop    %r12
 118:	c3                   	retq   
 119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 120:	8d 34 12             	lea    (%rdx,%rdx,1),%esi
 123:	48 8b 3f             	mov    (%rdi),%rdi
 126:	48 89 f3             	mov    %rsi,%rbx
 129:	48 c1 e6 03          	shl    $0x3,%rsi
 12d:	e8 00 00 00 00       	callq  132 <BUSeq_addhi+0x42>
 132:	48 85 c0             	test   %rax,%rax
 135:	48 89 45 00          	mov    %rax,0x0(%rbp)
 139:	74 15                	je     150 <BUSeq_addhi+0x60>
 13b:	8b 55 08             	mov    0x8(%rbp),%edx
 13e:	89 5d 0c             	mov    %ebx,0xc(%rbp)
 141:	8d 4a 01             	lea    0x1(%rdx),%ecx
 144:	89 4d 08             	mov    %ecx,0x8(%rbp)
 147:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 14b:	5b                   	pop    %rbx
 14c:	5d                   	pop    %rbp
 14d:	41 5c                	pop    %r12
 14f:	c3                   	retq   
 150:	bf 01 00 00 00       	mov    $0x1,%edi
 155:	e8 00 00 00 00       	callq  15a <BUSeq_addhi+0x6a>

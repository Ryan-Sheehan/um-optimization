
buseq.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <BUSeq_new>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	89 fd                	mov    %edi,%ebp
   4:	bf 10 00 00 00       	mov    $0x10,%edi
   9:	48 83 ec 08          	sub    $0x8,%rsp
   d:	e8 00 00 00 00       	callq  12 <BUSeq_new+0x12>
  12:	89 ef                	mov    %ebp,%edi
  14:	be 08 00 00 00       	mov    $0x8,%esi
  19:	48 89 c3             	mov    %rax,%rbx
  1c:	e8 00 00 00 00       	callq  21 <BUSeq_new+0x21>
  21:	48 85 c0             	test   %rax,%rax
  24:	48 89 03             	mov    %rax,(%rbx)
  27:	74 14                	je     3d <BUSeq_new+0x3d>
  29:	89 6b 0c             	mov    %ebp,0xc(%rbx)
  2c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%rbx)
  33:	48 83 c4 08          	add    $0x8,%rsp
  37:	48 89 d8             	mov    %rbx,%rax
  3a:	5b                   	pop    %rbx
  3b:	5d                   	pop    %rbp
  3c:	c3                   	retq   
  3d:	bf 01 00 00 00       	mov    $0x1,%edi
  42:	e8 00 00 00 00       	callq  47 <BUSeq_new+0x47>
  47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4e:	00 00 

0000000000000050 <BUSeq_free>:
  50:	53                   	push   %rbx
  51:	48 8b 07             	mov    (%rdi),%rax
  54:	48 85 c0             	test   %rax,%rax
  57:	74 1c                	je     75 <BUSeq_free+0x25>
  59:	48 89 fb             	mov    %rdi,%rbx
  5c:	48 8b 38             	mov    (%rax),%rdi
  5f:	e8 00 00 00 00       	callq  64 <BUSeq_free+0x14>
  64:	48 8b 3b             	mov    (%rbx),%rdi
  67:	e8 00 00 00 00       	callq  6c <BUSeq_free+0x1c>
  6c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  73:	5b                   	pop    %rbx
  74:	c3                   	retq   
  75:	bf 01 00 00 00       	mov    $0x1,%edi
  7a:	e8 00 00 00 00       	callq  7f <BUSeq_free+0x2f>
  7f:	90                   	nop

0000000000000080 <BUSeq_get>:
  80:	48 83 ec 08          	sub    $0x8,%rsp
  84:	48 85 ff             	test   %rdi,%rdi
  87:	74 13                	je     9c <BUSeq_get+0x1c>
  89:	39 77 08             	cmp    %esi,0x8(%rdi)
  8c:	76 0e                	jbe    9c <BUSeq_get+0x1c>
  8e:	48 8b 07             	mov    (%rdi),%rax
  91:	89 f6                	mov    %esi,%esi
  93:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
  97:	48 83 c4 08          	add    $0x8,%rsp
  9b:	c3                   	retq   
  9c:	bf 01 00 00 00       	mov    $0x1,%edi
  a1:	e8 00 00 00 00       	callq  a6 <BUSeq_get+0x26>
  a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  ad:	00 00 00 

00000000000000b0 <BUSeq_length>:
  b0:	48 85 ff             	test   %rdi,%rdi
  b3:	74 04                	je     b9 <BUSeq_length+0x9>
  b5:	8b 47 08             	mov    0x8(%rdi),%eax
  b8:	c3                   	retq   
  b9:	50                   	push   %rax
  ba:	bf 01 00 00 00       	mov    $0x1,%edi
  bf:	e8 00 00 00 00       	callq  c4 <BUSeq_length+0x14>
  c4:	66 90                	xchg   %ax,%ax
  c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  cd:	00 00 00 

00000000000000d0 <BUSeq_put>:
  d0:	48 83 ec 08          	sub    $0x8,%rsp
  d4:	48 85 ff             	test   %rdi,%rdi
  d7:	74 19                	je     f2 <BUSeq_put+0x22>
  d9:	39 77 0c             	cmp    %esi,0xc(%rdi)
  dc:	76 14                	jbe    f2 <BUSeq_put+0x22>
  de:	48 8b 07             	mov    (%rdi),%rax
  e1:	89 f6                	mov    %esi,%esi
  e3:	48 8d 0c f0          	lea    (%rax,%rsi,8),%rcx
  e7:	48 8b 01             	mov    (%rcx),%rax
  ea:	48 89 11             	mov    %rdx,(%rcx)
  ed:	48 83 c4 08          	add    $0x8,%rsp
  f1:	c3                   	retq   
  f2:	bf 01 00 00 00       	mov    $0x1,%edi
  f7:	e8 00 00 00 00       	callq  fc <BUSeq_put+0x2c>
  fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000100 <BUSeq_addhi>:
 100:	48 85 ff             	test   %rdi,%rdi
 103:	41 54                	push   %r12
 105:	55                   	push   %rbp
 106:	53                   	push   %rbx
 107:	74 57                	je     160 <BUSeq_addhi+0x60>
 109:	8b 57 08             	mov    0x8(%rdi),%edx
 10c:	48 89 fd             	mov    %rdi,%rbp
 10f:	49 89 f4             	mov    %rsi,%r12
 112:	3b 57 0c             	cmp    0xc(%rdi),%edx
 115:	74 19                	je     130 <BUSeq_addhi+0x30>
 117:	48 8b 07             	mov    (%rdi),%rax
 11a:	8d 4a 01             	lea    0x1(%rdx),%ecx
 11d:	89 4d 08             	mov    %ecx,0x8(%rbp)
 120:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 124:	5b                   	pop    %rbx
 125:	5d                   	pop    %rbp
 126:	41 5c                	pop    %r12
 128:	c3                   	retq   
 129:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 130:	8d 34 12             	lea    (%rdx,%rdx,1),%esi
 133:	48 8b 3f             	mov    (%rdi),%rdi
 136:	48 89 f3             	mov    %rsi,%rbx
 139:	48 c1 e6 03          	shl    $0x3,%rsi
 13d:	e8 00 00 00 00       	callq  142 <BUSeq_addhi+0x42>
 142:	48 85 c0             	test   %rax,%rax
 145:	48 89 45 00          	mov    %rax,0x0(%rbp)
 149:	74 15                	je     160 <BUSeq_addhi+0x60>
 14b:	8b 55 08             	mov    0x8(%rbp),%edx
 14e:	89 5d 0c             	mov    %ebx,0xc(%rbp)
 151:	8d 4a 01             	lea    0x1(%rdx),%ecx
 154:	89 4d 08             	mov    %ecx,0x8(%rbp)
 157:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 15b:	5b                   	pop    %rbx
 15c:	5d                   	pop    %rbp
 15d:	41 5c                	pop    %r12
 15f:	c3                   	retq   
 160:	bf 01 00 00 00       	mov    $0x1,%edi
 165:	e8 00 00 00 00       	callq  16a <BUSeq_addhi+0x6a>

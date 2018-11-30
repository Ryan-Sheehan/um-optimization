
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
  50:	55                   	push   %rbp
  51:	53                   	push   %rbx
  52:	48 83 ec 08          	sub    $0x8,%rsp
  56:	48 8b 1f             	mov    (%rdi),%rbx
  59:	48 85 db             	test   %rbx,%rbx
  5c:	74 22                	je     80 <BUSeq_free+0x30>
  5e:	48 89 fd             	mov    %rdi,%rbp
  61:	48 8b 3b             	mov    (%rbx),%rdi
  64:	e8 00 00 00 00       	callq  69 <BUSeq_free+0x19>
  69:	48 89 df             	mov    %rbx,%rdi
  6c:	e8 00 00 00 00       	callq  71 <BUSeq_free+0x21>
  71:	48 c7 45 00 00 00 00 	movq   $0x0,0x0(%rbp)
  78:	00 
  79:	48 83 c4 08          	add    $0x8,%rsp
  7d:	5b                   	pop    %rbx
  7e:	5d                   	pop    %rbp
  7f:	c3                   	retq   
  80:	bf 01 00 00 00       	mov    $0x1,%edi
  85:	e8 00 00 00 00       	callq  8a <BUSeq_free+0x3a>
  8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000090 <BUSeq_get>:
  90:	48 83 ec 08          	sub    $0x8,%rsp
  94:	48 85 ff             	test   %rdi,%rdi
  97:	74 13                	je     ac <BUSeq_get+0x1c>
  99:	39 77 08             	cmp    %esi,0x8(%rdi)
  9c:	76 0e                	jbe    ac <BUSeq_get+0x1c>
  9e:	48 8b 07             	mov    (%rdi),%rax
  a1:	89 f6                	mov    %esi,%esi
  a3:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
  a7:	48 83 c4 08          	add    $0x8,%rsp
  ab:	c3                   	retq   
  ac:	bf 01 00 00 00       	mov    $0x1,%edi
  b1:	e8 00 00 00 00       	callq  b6 <BUSeq_get+0x26>
  b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  bd:	00 00 00 

00000000000000c0 <BUSeq_length>:
  c0:	48 85 ff             	test   %rdi,%rdi
  c3:	74 04                	je     c9 <BUSeq_length+0x9>
  c5:	8b 47 08             	mov    0x8(%rdi),%eax
  c8:	c3                   	retq   
  c9:	50                   	push   %rax
  ca:	bf 01 00 00 00       	mov    $0x1,%edi
  cf:	e8 00 00 00 00       	callq  d4 <BUSeq_length+0x14>
  d4:	66 90                	xchg   %ax,%ax
  d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  dd:	00 00 00 

00000000000000e0 <BUSeq_put>:
  e0:	48 83 ec 08          	sub    $0x8,%rsp
  e4:	48 85 ff             	test   %rdi,%rdi
  e7:	74 19                	je     102 <BUSeq_put+0x22>
  e9:	39 77 0c             	cmp    %esi,0xc(%rdi)
  ec:	76 14                	jbe    102 <BUSeq_put+0x22>
  ee:	48 8b 07             	mov    (%rdi),%rax
  f1:	89 f6                	mov    %esi,%esi
  f3:	48 8d 0c f0          	lea    (%rax,%rsi,8),%rcx
  f7:	48 8b 01             	mov    (%rcx),%rax
  fa:	48 89 11             	mov    %rdx,(%rcx)
  fd:	48 83 c4 08          	add    $0x8,%rsp
 101:	c3                   	retq   
 102:	bf 01 00 00 00       	mov    $0x1,%edi
 107:	e8 00 00 00 00       	callq  10c <BUSeq_put+0x2c>
 10c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000110 <BUSeq_addhi>:
 110:	48 85 ff             	test   %rdi,%rdi
 113:	41 54                	push   %r12
 115:	55                   	push   %rbp
 116:	53                   	push   %rbx
 117:	74 57                	je     170 <BUSeq_addhi+0x60>
 119:	8b 57 08             	mov    0x8(%rdi),%edx
 11c:	48 89 fd             	mov    %rdi,%rbp
 11f:	49 89 f4             	mov    %rsi,%r12
 122:	3b 57 0c             	cmp    0xc(%rdi),%edx
 125:	74 19                	je     140 <BUSeq_addhi+0x30>
 127:	48 8b 07             	mov    (%rdi),%rax
 12a:	8d 4a 01             	lea    0x1(%rdx),%ecx
 12d:	89 4d 08             	mov    %ecx,0x8(%rbp)
 130:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 134:	5b                   	pop    %rbx
 135:	5d                   	pop    %rbp
 136:	41 5c                	pop    %r12
 138:	c3                   	retq   
 139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 140:	8d 34 12             	lea    (%rdx,%rdx,1),%esi
 143:	48 8b 3f             	mov    (%rdi),%rdi
 146:	48 89 f3             	mov    %rsi,%rbx
 149:	48 c1 e6 03          	shl    $0x3,%rsi
 14d:	e8 00 00 00 00       	callq  152 <BUSeq_addhi+0x42>
 152:	48 85 c0             	test   %rax,%rax
 155:	48 89 45 00          	mov    %rax,0x0(%rbp)
 159:	74 15                	je     170 <BUSeq_addhi+0x60>
 15b:	8b 55 08             	mov    0x8(%rbp),%edx
 15e:	89 5d 0c             	mov    %ebx,0xc(%rbp)
 161:	8d 4a 01             	lea    0x1(%rdx),%ecx
 164:	89 4d 08             	mov    %ecx,0x8(%rbp)
 167:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 16b:	5b                   	pop    %rbx
 16c:	5d                   	pop    %rbp
 16d:	41 5c                	pop    %r12
 16f:	c3                   	retq   
 170:	bf 01 00 00 00       	mov    $0x1,%edi
 175:	e8 00 00 00 00       	callq  17a <BUSeq_addhi+0x6a>

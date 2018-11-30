
buarray.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <BUArray_new>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	89 fd                	mov    %edi,%ebp
   4:	bf 10 00 00 00       	mov    $0x10,%edi
   9:	48 83 ec 08          	sub    $0x8,%rsp
   d:	e8 00 00 00 00       	callq  12 <BUArray_new+0x12>
  12:	89 ef                	mov    %ebp,%edi
  14:	be 04 00 00 00       	mov    $0x4,%esi
  19:	48 89 c3             	mov    %rax,%rbx
  1c:	e8 00 00 00 00       	callq  21 <BUArray_new+0x21>
  21:	48 85 c0             	test   %rax,%rax
  24:	48 89 03             	mov    %rax,(%rbx)
  27:	74 0d                	je     36 <BUArray_new+0x36>
  29:	89 6b 08             	mov    %ebp,0x8(%rbx)
  2c:	48 83 c4 08          	add    $0x8,%rsp
  30:	48 89 d8             	mov    %rbx,%rax
  33:	5b                   	pop    %rbx
  34:	5d                   	pop    %rbp
  35:	c3                   	retq   
  36:	bf 01 00 00 00       	mov    $0x1,%edi
  3b:	e8 00 00 00 00       	callq  40 <BUArray_free>

0000000000000040 <BUArray_free>:
  40:	53                   	push   %rbx
  41:	48 8b 07             	mov    (%rdi),%rax
  44:	48 85 c0             	test   %rax,%rax
  47:	74 1c                	je     65 <BUArray_free+0x25>
  49:	48 89 fb             	mov    %rdi,%rbx
  4c:	48 8b 38             	mov    (%rax),%rdi
  4f:	e8 00 00 00 00       	callq  54 <BUArray_free+0x14>
  54:	48 8b 3b             	mov    (%rbx),%rdi
  57:	e8 00 00 00 00       	callq  5c <BUArray_free+0x1c>
  5c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  63:	5b                   	pop    %rbx
  64:	c3                   	retq   
  65:	bf 01 00 00 00       	mov    $0x1,%edi
  6a:	e8 00 00 00 00       	callq  6f <BUArray_free+0x2f>
  6f:	90                   	nop

0000000000000070 <BUArray_get>:
  70:	48 83 ec 08          	sub    $0x8,%rsp
  74:	48 85 ff             	test   %rdi,%rdi
  77:	74 12                	je     8b <BUArray_get+0x1b>
  79:	39 77 08             	cmp    %esi,0x8(%rdi)
  7c:	76 0d                	jbe    8b <BUArray_get+0x1b>
  7e:	48 8b 07             	mov    (%rdi),%rax
  81:	89 f6                	mov    %esi,%esi
  83:	8b 04 b0             	mov    (%rax,%rsi,4),%eax
  86:	48 83 c4 08          	add    $0x8,%rsp
  8a:	c3                   	retq   
  8b:	bf 01 00 00 00       	mov    $0x1,%edi
  90:	e8 00 00 00 00       	callq  95 <BUArray_get+0x25>
  95:	90                   	nop
  96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  9d:	00 00 00 

00000000000000a0 <BUArray_put>:
  a0:	48 83 ec 08          	sub    $0x8,%rsp
  a4:	48 85 ff             	test   %rdi,%rdi
  a7:	74 17                	je     c0 <BUArray_put+0x20>
  a9:	39 77 08             	cmp    %esi,0x8(%rdi)
  ac:	76 12                	jbe    c0 <BUArray_put+0x20>
  ae:	48 8b 07             	mov    (%rdi),%rax
  b1:	89 f6                	mov    %esi,%esi
  b3:	48 8d 0c b0          	lea    (%rax,%rsi,4),%rcx
  b7:	8b 01                	mov    (%rcx),%eax
  b9:	89 11                	mov    %edx,(%rcx)
  bb:	48 83 c4 08          	add    $0x8,%rsp
  bf:	c3                   	retq   
  c0:	bf 01 00 00 00       	mov    $0x1,%edi
  c5:	e8 00 00 00 00       	callq  ca <BUArray_put+0x2a>
  ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000000d0 <BUArray_length>:
  d0:	48 85 ff             	test   %rdi,%rdi
  d3:	74 04                	je     d9 <BUArray_length+0x9>
  d5:	8b 47 08             	mov    0x8(%rdi),%eax
  d8:	c3                   	retq   
  d9:	50                   	push   %rax
  da:	bf 01 00 00 00       	mov    $0x1,%edi
  df:	e8 00 00 00 00       	callq  e4 <BUArray_length+0x14>
  e4:	66 90                	xchg   %ax,%ax
  e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  ed:	00 00 00 

00000000000000f0 <BUArray_reloc>:
  f0:	41 54                	push   %r12
  f2:	55                   	push   %rbp
  f3:	89 f6                	mov    %esi,%esi
  f5:	53                   	push   %rbx
  f6:	48 8b 2f             	mov    (%rdi),%rbp
  f9:	48 89 fb             	mov    %rdi,%rbx
  fc:	49 89 f4             	mov    %rsi,%r12
  ff:	48 c1 e6 02          	shl    $0x2,%rsi
 103:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
 107:	e8 00 00 00 00       	callq  10c <BUArray_reloc+0x1c>
 10c:	48 89 45 00          	mov    %rax,0x0(%rbp)
 110:	48 8b 03             	mov    (%rbx),%rax
 113:	48 83 38 00          	cmpq   $0x0,(%rax)
 117:	74 09                	je     122 <BUArray_reloc+0x32>
 119:	44 89 60 08          	mov    %r12d,0x8(%rax)
 11d:	5b                   	pop    %rbx
 11e:	5d                   	pop    %rbp
 11f:	41 5c                	pop    %r12
 121:	c3                   	retq   
 122:	bf 01 00 00 00       	mov    $0x1,%edi
 127:	e8 00 00 00 00       	callq  12c <BUArray_reloc+0x3c>

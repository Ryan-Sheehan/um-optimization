
buarray.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <BUArray_new>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	89 fd                	mov    %edi,%ebp
   4:	bf 10 00 00 00       	mov    $0x10,%edi
   9:	48 83 ec 08          	sub    $0x8,%rsp
   d:	e8 00 00 00 00       	callq  12 <BUArray_new+0x12>
  12:	48 85 c0             	test   %rax,%rax
  15:	74 24                	je     3b <BUArray_new+0x3b>
  17:	89 ef                	mov    %ebp,%edi
  19:	be 04 00 00 00       	mov    $0x4,%esi
  1e:	48 89 c3             	mov    %rax,%rbx
  21:	e8 00 00 00 00       	callq  26 <BUArray_new+0x26>
  26:	48 85 c0             	test   %rax,%rax
  29:	48 89 03             	mov    %rax,(%rbx)
  2c:	74 0d                	je     3b <BUArray_new+0x3b>
  2e:	89 6b 08             	mov    %ebp,0x8(%rbx)
  31:	48 83 c4 08          	add    $0x8,%rsp
  35:	48 89 d8             	mov    %rbx,%rax
  38:	5b                   	pop    %rbx
  39:	5d                   	pop    %rbp
  3a:	c3                   	retq   
  3b:	bf 01 00 00 00       	mov    $0x1,%edi
  40:	e8 00 00 00 00       	callq  45 <BUArray_new+0x45>
  45:	90                   	nop
  46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4d:	00 00 00 

0000000000000050 <BUArray_free>:
  50:	53                   	push   %rbx
  51:	48 8b 07             	mov    (%rdi),%rax
  54:	48 85 c0             	test   %rax,%rax
  57:	74 1c                	je     75 <BUArray_free+0x25>
  59:	48 89 fb             	mov    %rdi,%rbx
  5c:	48 8b 38             	mov    (%rax),%rdi
  5f:	e8 00 00 00 00       	callq  64 <BUArray_free+0x14>
  64:	48 8b 3b             	mov    (%rbx),%rdi
  67:	e8 00 00 00 00       	callq  6c <BUArray_free+0x1c>
  6c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  73:	5b                   	pop    %rbx
  74:	c3                   	retq   
  75:	bf 01 00 00 00       	mov    $0x1,%edi
  7a:	e8 00 00 00 00       	callq  7f <BUArray_free+0x2f>
  7f:	90                   	nop

0000000000000080 <BUArray_get>:
  80:	48 83 ec 08          	sub    $0x8,%rsp
  84:	48 85 ff             	test   %rdi,%rdi
  87:	74 12                	je     9b <BUArray_get+0x1b>
  89:	39 77 08             	cmp    %esi,0x8(%rdi)
  8c:	76 0d                	jbe    9b <BUArray_get+0x1b>
  8e:	48 8b 07             	mov    (%rdi),%rax
  91:	89 f6                	mov    %esi,%esi
  93:	8b 04 b0             	mov    (%rax,%rsi,4),%eax
  96:	48 83 c4 08          	add    $0x8,%rsp
  9a:	c3                   	retq   
  9b:	bf 01 00 00 00       	mov    $0x1,%edi
  a0:	e8 00 00 00 00       	callq  a5 <BUArray_get+0x25>
  a5:	90                   	nop
  a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  ad:	00 00 00 

00000000000000b0 <BUArray_put>:
  b0:	48 83 ec 08          	sub    $0x8,%rsp
  b4:	48 85 ff             	test   %rdi,%rdi
  b7:	74 17                	je     d0 <BUArray_put+0x20>
  b9:	39 77 08             	cmp    %esi,0x8(%rdi)
  bc:	76 12                	jbe    d0 <BUArray_put+0x20>
  be:	48 8b 07             	mov    (%rdi),%rax
  c1:	89 f6                	mov    %esi,%esi
  c3:	48 8d 0c b0          	lea    (%rax,%rsi,4),%rcx
  c7:	8b 01                	mov    (%rcx),%eax
  c9:	89 11                	mov    %edx,(%rcx)
  cb:	48 83 c4 08          	add    $0x8,%rsp
  cf:	c3                   	retq   
  d0:	bf 01 00 00 00       	mov    $0x1,%edi
  d5:	e8 00 00 00 00       	callq  da <BUArray_put+0x2a>
  da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000000e0 <BUArray_length>:
  e0:	48 85 ff             	test   %rdi,%rdi
  e3:	74 04                	je     e9 <BUArray_length+0x9>
  e5:	8b 47 08             	mov    0x8(%rdi),%eax
  e8:	c3                   	retq   
  e9:	50                   	push   %rax
  ea:	bf 01 00 00 00       	mov    $0x1,%edi
  ef:	e8 00 00 00 00       	callq  f4 <BUArray_length+0x14>
  f4:	66 90                	xchg   %ax,%ax
  f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  fd:	00 00 00 

0000000000000100 <BUArray_reloc>:
 100:	41 54                	push   %r12
 102:	55                   	push   %rbp
 103:	89 f6                	mov    %esi,%esi
 105:	53                   	push   %rbx
 106:	48 8b 2f             	mov    (%rdi),%rbp
 109:	48 89 fb             	mov    %rdi,%rbx
 10c:	49 89 f4             	mov    %rsi,%r12
 10f:	48 c1 e6 02          	shl    $0x2,%rsi
 113:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
 117:	e8 00 00 00 00       	callq  11c <BUArray_reloc+0x1c>
 11c:	48 89 45 00          	mov    %rax,0x0(%rbp)
 120:	48 8b 03             	mov    (%rbx),%rax
 123:	48 83 38 00          	cmpq   $0x0,(%rax)
 127:	74 09                	je     132 <BUArray_reloc+0x32>
 129:	44 89 60 08          	mov    %r12d,0x8(%rax)
 12d:	5b                   	pop    %rbx
 12e:	5d                   	pop    %rbp
 12f:	41 5c                	pop    %r12
 131:	c3                   	retq   
 132:	bf 01 00 00 00       	mov    $0x1,%edi
 137:	e8 00 00 00 00       	callq  13c <BUArray_reloc+0x3c>

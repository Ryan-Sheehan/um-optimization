
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
  15:	48 89 c3             	mov    %rax,%rbx
  18:	74 4e                	je     68 <BUArray_new+0x68>
  1a:	89 ef                	mov    %ebp,%edi
  1c:	be 04 00 00 00       	mov    $0x4,%esi
  21:	e8 00 00 00 00       	callq  26 <BUArray_new+0x26>
  26:	48 85 c0             	test   %rax,%rax
  29:	48 89 03             	mov    %rax,(%rbx)
  2c:	74 12                	je     40 <BUArray_new+0x40>
  2e:	89 6b 08             	mov    %ebp,0x8(%rbx)
  31:	48 83 c4 08          	add    $0x8,%rsp
  35:	48 89 d8             	mov    %rbx,%rax
  38:	5b                   	pop    %rbx
  39:	5d                   	pop    %rbp
  3a:	c3                   	retq   
  3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40:	ba 19 00 00 00       	mov    $0x19,%edx
  45:	be 00 00 00 00       	mov    $0x0,%esi
  4a:	bf 00 00 00 00       	mov    $0x0,%edi
  4f:	e8 00 00 00 00       	callq  54 <BUArray_new+0x54>
  54:	89 6b 08             	mov    %ebp,0x8(%rbx)
  57:	48 83 c4 08          	add    $0x8,%rsp
  5b:	48 89 d8             	mov    %rbx,%rax
  5e:	5b                   	pop    %rbx
  5f:	5d                   	pop    %rbp
  60:	c3                   	retq   
  61:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  68:	ba 17 00 00 00       	mov    $0x17,%edx
  6d:	be 00 00 00 00       	mov    $0x0,%esi
  72:	bf 00 00 00 00       	mov    $0x0,%edi
  77:	e8 00 00 00 00       	callq  7c <BUArray_new+0x7c>
  7c:	eb 9c                	jmp    1a <BUArray_new+0x1a>
  7e:	66 90                	xchg   %ax,%ax

0000000000000080 <BUArray_free>:
  80:	53                   	push   %rbx
  81:	48 8b 07             	mov    (%rdi),%rax
  84:	48 89 fb             	mov    %rdi,%rbx
  87:	48 85 c0             	test   %rax,%rax
  8a:	74 1c                	je     a8 <BUArray_free+0x28>
  8c:	48 8b 38             	mov    (%rax),%rdi
  8f:	e8 00 00 00 00       	callq  94 <BUArray_free+0x14>
  94:	48 8b 3b             	mov    (%rbx),%rdi
  97:	e8 00 00 00 00       	callq  9c <BUArray_free+0x1c>
  9c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  a3:	5b                   	pop    %rbx
  a4:	c3                   	retq   
  a5:	0f 1f 00             	nopl   (%rax)
  a8:	ba 21 00 00 00       	mov    $0x21,%edx
  ad:	be 00 00 00 00       	mov    $0x0,%esi
  b2:	bf 00 00 00 00       	mov    $0x0,%edi
  b7:	e8 00 00 00 00       	callq  bc <BUArray_free+0x3c>
  bc:	48 8b 03             	mov    (%rbx),%rax
  bf:	eb cb                	jmp    8c <BUArray_free+0xc>
  c1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  cd:	00 00 00 

00000000000000d0 <BUArray_get>:
  d0:	55                   	push   %rbp
  d1:	53                   	push   %rbx
  d2:	48 89 fd             	mov    %rdi,%rbp
  d5:	89 f3                	mov    %esi,%ebx
  d7:	48 83 ec 08          	sub    $0x8,%rsp
  db:	48 85 ff             	test   %rdi,%rdi
  de:	74 40                	je     120 <BUArray_get+0x50>
  e0:	39 5d 08             	cmp    %ebx,0x8(%rbp)
  e3:	76 13                	jbe    f8 <BUArray_get+0x28>
  e5:	48 8b 45 00          	mov    0x0(%rbp),%rax
  e9:	8b 04 98             	mov    (%rax,%rbx,4),%eax
  ec:	48 83 c4 08          	add    $0x8,%rsp
  f0:	5b                   	pop    %rbx
  f1:	5d                   	pop    %rbp
  f2:	c3                   	retq   
  f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  f8:	ba 2b 00 00 00       	mov    $0x2b,%edx
  fd:	be 00 00 00 00       	mov    $0x0,%esi
 102:	bf 00 00 00 00       	mov    $0x0,%edi
 107:	e8 00 00 00 00       	callq  10c <BUArray_get+0x3c>
 10c:	48 8b 45 00          	mov    0x0(%rbp),%rax
 110:	8b 04 98             	mov    (%rax,%rbx,4),%eax
 113:	48 83 c4 08          	add    $0x8,%rsp
 117:	5b                   	pop    %rbx
 118:	5d                   	pop    %rbp
 119:	c3                   	retq   
 11a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 120:	ba 2a 00 00 00       	mov    $0x2a,%edx
 125:	be 00 00 00 00       	mov    $0x0,%esi
 12a:	bf 00 00 00 00       	mov    $0x0,%edi
 12f:	e8 00 00 00 00       	callq  134 <BUArray_get+0x64>
 134:	eb aa                	jmp    e0 <BUArray_get+0x10>
 136:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 13d:	00 00 00 

0000000000000140 <BUArray_put>:
 140:	48 85 ff             	test   %rdi,%rdi
 143:	41 54                	push   %r12
 145:	41 89 d4             	mov    %edx,%r12d
 148:	55                   	push   %rbp
 149:	48 89 fd             	mov    %rdi,%rbp
 14c:	53                   	push   %rbx
 14d:	89 f3                	mov    %esi,%ebx
 14f:	74 2f                	je     180 <BUArray_put+0x40>
 151:	39 5d 08             	cmp    %ebx,0x8(%rbp)
 154:	77 14                	ja     16a <BUArray_put+0x2a>
 156:	ba 33 00 00 00       	mov    $0x33,%edx
 15b:	be 00 00 00 00       	mov    $0x0,%esi
 160:	bf 00 00 00 00       	mov    $0x0,%edi
 165:	e8 00 00 00 00       	callq  16a <BUArray_put+0x2a>
 16a:	48 8b 45 00          	mov    0x0(%rbp),%rax
 16e:	48 8d 14 98          	lea    (%rax,%rbx,4),%rdx
 172:	8b 02                	mov    (%rdx),%eax
 174:	44 89 22             	mov    %r12d,(%rdx)
 177:	5b                   	pop    %rbx
 178:	5d                   	pop    %rbp
 179:	41 5c                	pop    %r12
 17b:	c3                   	retq   
 17c:	0f 1f 40 00          	nopl   0x0(%rax)
 180:	ba 32 00 00 00       	mov    $0x32,%edx
 185:	be 00 00 00 00       	mov    $0x0,%esi
 18a:	bf 00 00 00 00       	mov    $0x0,%edi
 18f:	e8 00 00 00 00       	callq  194 <BUArray_put+0x54>
 194:	eb bb                	jmp    151 <BUArray_put+0x11>
 196:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 19d:	00 00 00 

00000000000001a0 <BUArray_length>:
 1a0:	48 85 ff             	test   %rdi,%rdi
 1a3:	53                   	push   %rbx
 1a4:	48 89 fb             	mov    %rdi,%rbx
 1a7:	74 07                	je     1b0 <BUArray_length+0x10>
 1a9:	8b 43 08             	mov    0x8(%rbx),%eax
 1ac:	5b                   	pop    %rbx
 1ad:	c3                   	retq   
 1ae:	66 90                	xchg   %ax,%ax
 1b0:	ba 3c 00 00 00       	mov    $0x3c,%edx
 1b5:	be 00 00 00 00       	mov    $0x0,%esi
 1ba:	bf 00 00 00 00       	mov    $0x0,%edi
 1bf:	e8 00 00 00 00       	callq  1c4 <BUArray_length+0x24>
 1c4:	eb e3                	jmp    1a9 <BUArray_length+0x9>
 1c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 1cd:	00 00 00 

00000000000001d0 <BUArray_reloc>:
 1d0:	41 54                	push   %r12
 1d2:	55                   	push   %rbp
 1d3:	89 f6                	mov    %esi,%esi
 1d5:	53                   	push   %rbx
 1d6:	4c 8b 27             	mov    (%rdi),%r12
 1d9:	48 89 fb             	mov    %rdi,%rbx
 1dc:	48 89 f5             	mov    %rsi,%rbp
 1df:	48 c1 e6 02          	shl    $0x2,%rsi
 1e3:	49 8b 3c 24          	mov    (%r12),%rdi
 1e7:	e8 00 00 00 00       	callq  1ec <BUArray_reloc+0x1c>
 1ec:	49 89 04 24          	mov    %rax,(%r12)
 1f0:	48 8b 03             	mov    (%rbx),%rax
 1f3:	48 83 38 00          	cmpq   $0x0,(%rax)
 1f7:	74 0f                	je     208 <BUArray_reloc+0x38>
 1f9:	89 68 08             	mov    %ebp,0x8(%rax)
 1fc:	5b                   	pop    %rbx
 1fd:	5d                   	pop    %rbp
 1fe:	41 5c                	pop    %r12
 200:	c3                   	retq   
 201:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 208:	ba 44 00 00 00       	mov    $0x44,%edx
 20d:	be 00 00 00 00       	mov    $0x0,%esi
 212:	bf 00 00 00 00       	mov    $0x0,%edi
 217:	e8 00 00 00 00       	callq  21c <BUArray_reloc+0x4c>
 21c:	48 8b 03             	mov    (%rbx),%rax
 21f:	89 68 08             	mov    %ebp,0x8(%rax)
 222:	5b                   	pop    %rbx
 223:	5d                   	pop    %rbp
 224:	41 5c                	pop    %r12
 226:	c3                   	retq   

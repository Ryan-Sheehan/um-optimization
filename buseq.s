
buseq.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <BUSeq_new>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	89 fd                	mov    %edi,%ebp
   4:	bf 10 00 00 00       	mov    $0x10,%edi
   9:	48 83 ec 08          	sub    $0x8,%rsp
   d:	e8 00 00 00 00       	callq  12 <BUSeq_new+0x12>
  12:	48 85 c0             	test   %rax,%rax
  15:	48 89 c3             	mov    %rax,%rbx
  18:	74 46                	je     60 <BUSeq_new+0x60>
  1a:	89 ef                	mov    %ebp,%edi
  1c:	be 08 00 00 00       	mov    $0x8,%esi
  21:	e8 00 00 00 00       	callq  26 <BUSeq_new+0x26>
  26:	48 85 c0             	test   %rax,%rax
  29:	48 89 03             	mov    %rax,(%rbx)
  2c:	74 1a                	je     48 <BUSeq_new+0x48>
  2e:	89 6b 0c             	mov    %ebp,0xc(%rbx)
  31:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%rbx)
  38:	48 83 c4 08          	add    $0x8,%rsp
  3c:	48 89 d8             	mov    %rbx,%rax
  3f:	5b                   	pop    %rbx
  40:	5d                   	pop    %rbp
  41:	c3                   	retq   
  42:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  48:	ba 20 00 00 00       	mov    $0x20,%edx
  4d:	be 00 00 00 00       	mov    $0x0,%esi
  52:	bf 00 00 00 00       	mov    $0x0,%edi
  57:	e8 00 00 00 00       	callq  5c <BUSeq_new+0x5c>
  5c:	eb d0                	jmp    2e <BUSeq_new+0x2e>
  5e:	66 90                	xchg   %ax,%ax
  60:	ba 1e 00 00 00       	mov    $0x1e,%edx
  65:	be 00 00 00 00       	mov    $0x0,%esi
  6a:	bf 00 00 00 00       	mov    $0x0,%edi
  6f:	e8 00 00 00 00       	callq  74 <BUSeq_new+0x74>
  74:	eb a4                	jmp    1a <BUSeq_new+0x1a>
  76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  7d:	00 00 00 

0000000000000080 <BUSeq_free>:
  80:	53                   	push   %rbx
  81:	48 8b 07             	mov    (%rdi),%rax
  84:	48 89 fb             	mov    %rdi,%rbx
  87:	48 85 c0             	test   %rax,%rax
  8a:	74 1c                	je     a8 <BUSeq_free+0x28>
  8c:	48 8b 38             	mov    (%rax),%rdi
  8f:	e8 00 00 00 00       	callq  94 <BUSeq_free+0x14>
  94:	48 8b 3b             	mov    (%rbx),%rdi
  97:	e8 00 00 00 00       	callq  9c <BUSeq_free+0x1c>
  9c:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  a3:	5b                   	pop    %rbx
  a4:	c3                   	retq   
  a5:	0f 1f 00             	nopl   (%rax)
  a8:	ba 29 00 00 00       	mov    $0x29,%edx
  ad:	be 00 00 00 00       	mov    $0x0,%esi
  b2:	bf 00 00 00 00       	mov    $0x0,%edi
  b7:	e8 00 00 00 00       	callq  bc <BUSeq_free+0x3c>
  bc:	48 8b 03             	mov    (%rbx),%rax
  bf:	eb cb                	jmp    8c <BUSeq_free+0xc>
  c1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  cd:	00 00 00 

00000000000000d0 <BUSeq_get>:
  d0:	55                   	push   %rbp
  d1:	53                   	push   %rbx
  d2:	48 89 fd             	mov    %rdi,%rbp
  d5:	89 f3                	mov    %esi,%ebx
  d7:	48 83 ec 08          	sub    $0x8,%rsp
  db:	48 85 ff             	test   %rdi,%rdi
  de:	74 40                	je     120 <BUSeq_get+0x50>
  e0:	39 5d 08             	cmp    %ebx,0x8(%rbp)
  e3:	76 13                	jbe    f8 <BUSeq_get+0x28>
  e5:	48 8b 45 00          	mov    0x0(%rbp),%rax
  e9:	48 8b 04 d8          	mov    (%rax,%rbx,8),%rax
  ed:	48 83 c4 08          	add    $0x8,%rsp
  f1:	5b                   	pop    %rbx
  f2:	5d                   	pop    %rbp
  f3:	c3                   	retq   
  f4:	0f 1f 40 00          	nopl   0x0(%rax)
  f8:	ba 33 00 00 00       	mov    $0x33,%edx
  fd:	be 00 00 00 00       	mov    $0x0,%esi
 102:	bf 00 00 00 00       	mov    $0x0,%edi
 107:	e8 00 00 00 00       	callq  10c <BUSeq_get+0x3c>
 10c:	48 8b 45 00          	mov    0x0(%rbp),%rax
 110:	48 8b 04 d8          	mov    (%rax,%rbx,8),%rax
 114:	48 83 c4 08          	add    $0x8,%rsp
 118:	5b                   	pop    %rbx
 119:	5d                   	pop    %rbp
 11a:	c3                   	retq   
 11b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 120:	ba 32 00 00 00       	mov    $0x32,%edx
 125:	be 00 00 00 00       	mov    $0x0,%esi
 12a:	bf 00 00 00 00       	mov    $0x0,%edi
 12f:	e8 00 00 00 00       	callq  134 <BUSeq_get+0x64>
 134:	eb aa                	jmp    e0 <BUSeq_get+0x10>
 136:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 13d:	00 00 00 

0000000000000140 <BUSeq_length>:
 140:	48 85 ff             	test   %rdi,%rdi
 143:	53                   	push   %rbx
 144:	48 89 fb             	mov    %rdi,%rbx
 147:	74 07                	je     150 <BUSeq_length+0x10>
 149:	8b 43 08             	mov    0x8(%rbx),%eax
 14c:	5b                   	pop    %rbx
 14d:	c3                   	retq   
 14e:	66 90                	xchg   %ax,%ax
 150:	ba 39 00 00 00       	mov    $0x39,%edx
 155:	be 00 00 00 00       	mov    $0x0,%esi
 15a:	bf 00 00 00 00       	mov    $0x0,%edi
 15f:	e8 00 00 00 00       	callq  164 <BUSeq_length+0x24>
 164:	eb e3                	jmp    149 <BUSeq_length+0x9>
 166:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 16d:	00 00 00 

0000000000000170 <BUSeq_put>:
 170:	48 85 ff             	test   %rdi,%rdi
 173:	41 54                	push   %r12
 175:	49 89 d4             	mov    %rdx,%r12
 178:	55                   	push   %rbp
 179:	48 89 fd             	mov    %rdi,%rbp
 17c:	53                   	push   %rbx
 17d:	89 f3                	mov    %esi,%ebx
 17f:	74 2f                	je     1b0 <BUSeq_put+0x40>
 181:	39 5d 0c             	cmp    %ebx,0xc(%rbp)
 184:	77 14                	ja     19a <BUSeq_put+0x2a>
 186:	ba 41 00 00 00       	mov    $0x41,%edx
 18b:	be 00 00 00 00       	mov    $0x0,%esi
 190:	bf 00 00 00 00       	mov    $0x0,%edi
 195:	e8 00 00 00 00       	callq  19a <BUSeq_put+0x2a>
 19a:	48 8b 45 00          	mov    0x0(%rbp),%rax
 19e:	48 8d 14 d8          	lea    (%rax,%rbx,8),%rdx
 1a2:	48 8b 02             	mov    (%rdx),%rax
 1a5:	4c 89 22             	mov    %r12,(%rdx)
 1a8:	5b                   	pop    %rbx
 1a9:	5d                   	pop    %rbp
 1aa:	41 5c                	pop    %r12
 1ac:	c3                   	retq   
 1ad:	0f 1f 00             	nopl   (%rax)
 1b0:	ba 40 00 00 00       	mov    $0x40,%edx
 1b5:	be 00 00 00 00       	mov    $0x0,%esi
 1ba:	bf 00 00 00 00       	mov    $0x0,%edi
 1bf:	e8 00 00 00 00       	callq  1c4 <BUSeq_put+0x54>
 1c4:	eb bb                	jmp    181 <BUSeq_put+0x11>
 1c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 1cd:	00 00 00 

00000000000001d0 <BUSeq_addhi>:
 1d0:	48 85 ff             	test   %rdi,%rdi
 1d3:	41 54                	push   %r12
 1d5:	49 89 f4             	mov    %rsi,%r12
 1d8:	55                   	push   %rbp
 1d9:	48 89 fd             	mov    %rdi,%rbp
 1dc:	53                   	push   %rbx
 1dd:	74 59                	je     238 <BUSeq_addhi+0x68>
 1df:	8b 55 08             	mov    0x8(%rbp),%edx
 1e2:	3b 55 0c             	cmp    0xc(%rbp),%edx
 1e5:	74 19                	je     200 <BUSeq_addhi+0x30>
 1e7:	48 8b 45 00          	mov    0x0(%rbp),%rax
 1eb:	8d 4a 01             	lea    0x1(%rdx),%ecx
 1ee:	89 4d 08             	mov    %ecx,0x8(%rbp)
 1f1:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 1f5:	5b                   	pop    %rbx
 1f6:	5d                   	pop    %rbp
 1f7:	41 5c                	pop    %r12
 1f9:	c3                   	retq   
 1fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 200:	8d 34 12             	lea    (%rdx,%rdx,1),%esi
 203:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
 207:	48 89 f3             	mov    %rsi,%rbx
 20a:	48 c1 e6 03          	shl    $0x3,%rsi
 20e:	e8 00 00 00 00       	callq  213 <BUSeq_addhi+0x43>
 213:	48 85 c0             	test   %rax,%rax
 216:	48 89 45 00          	mov    %rax,0x0(%rbp)
 21a:	74 34                	je     250 <BUSeq_addhi+0x80>
 21c:	8b 55 08             	mov    0x8(%rbp),%edx
 21f:	89 5d 0c             	mov    %ebx,0xc(%rbp)
 222:	8d 4a 01             	lea    0x1(%rdx),%ecx
 225:	89 4d 08             	mov    %ecx,0x8(%rbp)
 228:	4c 89 24 d0          	mov    %r12,(%rax,%rdx,8)
 22c:	5b                   	pop    %rbx
 22d:	5d                   	pop    %rbp
 22e:	41 5c                	pop    %r12
 230:	c3                   	retq   
 231:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 238:	ba 4a 00 00 00       	mov    $0x4a,%edx
 23d:	be 00 00 00 00       	mov    $0x0,%esi
 242:	bf 00 00 00 00       	mov    $0x0,%edi
 247:	e8 00 00 00 00       	callq  24c <BUSeq_addhi+0x7c>
 24c:	eb 91                	jmp    1df <BUSeq_addhi+0xf>
 24e:	66 90                	xchg   %ax,%ax
 250:	ba 54 00 00 00       	mov    $0x54,%edx
 255:	be 00 00 00 00       	mov    $0x0,%esi
 25a:	bf 00 00 00 00       	mov    $0x0,%edi
 25f:	e8 00 00 00 00       	callq  264 <BUSeq_addhi+0x94>
 264:	48 8b 45 00          	mov    0x0(%rbp),%rax
 268:	eb b2                	jmp    21c <BUSeq_addhi+0x4c>

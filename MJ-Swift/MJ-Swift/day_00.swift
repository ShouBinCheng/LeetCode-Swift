//
//  day.swift
//  MJ-Swift
//
//  Created by 程守斌 on 2023/2/24.
//

import Foundation


//MARK: -  day 00 汇编语言
func day_00() {
    
    /// 程序的本质
    /*
     - 通常，CPU 会先将内存中的数据存储到寄存器中，然后再对寄存器中的数据进行运算
     - 假设内存中有块红色的空间的值是 3，现在想把它的值加 1，并将结果存储到蓝色内存空间
     - CPU 首先会将红色内存空间的值放到 rax 寄存器中：movq 红色内存空间， %rax
     - 然后让 rax 寄存器与 1 相加：addq ￥0x1，%rax
     - 最后将至赋值给内存空间：movq %rax，蓝色内存空间
     */
    
    
    /// 寄存器
    /*
     - 有 16 个常用寄存器
     - rax、rbx、rcx、rdx、rsi、rdi、rbp、rsp、
     - r8、r9、r10、r11、r12、r13、r14、15
     
     - 寄存器的具体用途
     - rax、rdx 常作为函数返回值使用
     - rdi、rsi、rdx、rcx、r8、r9 等寄存器常用于存放函数参数
     - rsp、rbp 用于栈操作
     - rip 作为指令指针
     - 存储着 CPU 下一条要执行的指令的地址
     - 一旦 CPU 读取一条指令，rip 会自动指向下一条指令（存储下一条指令的地址）
     
     */
    
    
     
    /// lldb 常用指令
    /*
     - 读取寄存器的值
     - register read/格式
     - register read/x

     - 修改寄存器的值
     register write 寄存器名称 数值
     register write rax 0

     - 读取内存中的值
     - x/数量-格式-字节大小 内存地址
     - x/3xw 0x0000010

     - 修改内存中的值
     - memory write 内存地址 数值
     - memory write 0x0000010 10

     - 格式
     - x 是 16 进制，f 是浮点，d 是十进制

     - 字节大小
     - b - byte 1 字节
     - h - half word 2 字节
     - w - word 4 字节
     - g - giant word 8 字节

     - expression 表达式
     - 可以简写：expr 表达式
     - expression $rax
     - expression $rax = 1

     - po 表达式
     - print 表达式
     - po/x $rax
     - po (int)$rax
     */
    
    
    /// lldb 常用指令
    /*
     - thread step-over、next、n
     - 单步运行，把子函数当做整体一步执行（源码级别）
     
     - thread step-in、step、s
     - 单步运行，遇到子函数会进入子函数（源码级别）
     
     - thread step-inst-over、nexti、ni
     - 单步运行，把子函数当做整体一步执行（汇编级别）
     
     - thread step-inst、stepi、si
     - 单步运行，遇到子函数会进入子函数（汇编级别)
     
     - thread step-out、finish
     - 直接执行完当前函数的所有代码，返回到上一个函数（遇到断点会卡住）
     */
    
    
    /// 规律
    /*
     - 内存地址格式为：0x4ddc(%rip), 一般是全局变量，全局区（数据段）
     - 内存地址格式为：-0x78(%rbp), 一般是局部变量，栈空间
     - 内存地址格式为：0x10(%rax), 一般是堆空间
     */
    
    
    /// 汇编 Debug
    /// 在 Xcode 顶部导航栏，选择 Debug -> Debug Workflow -> Always Show Disassembly
    
    
    /// swiftc
    /*
     - 一些操作
     - 生成语法树：swiftc -dump-ast main.swift
     - 生成最简洁的 SIL 代码：swiftc -emit-sil main.swift
     - 生成 LLVM IR 代码：swiftc -emit-ir main.swift -o main.ll
     - 生存汇编代码：swiftc -emit-assembly main.swift -o main.s
     
     - 对汇编代码进行分析，可以真正掌握编程语言的本质
     */
}

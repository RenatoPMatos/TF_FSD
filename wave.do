onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /nanoCPU_TB/CPU/ck
add wave -noupdate /nanoCPU_TB/CPU/rst
add wave -noupdate -divider memoria
add wave -noupdate /nanoCPU_TB/CPU/we
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/address
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/dataR
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/dataW
add wave -noupdate -divider {estado e inst}
add wave -noupdate /nanoCPU_TB/CPU/EA
add wave -noupdate /nanoCPU_TB/CPU/inst
add wave -noupdate -divider {PC e IR}
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/IR
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/PC
add wave -noupdate -divider registradores
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[0]}
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[1]}
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[2]}
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[3]}
add wave -noupdate -divider memoria
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(0)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(1)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(2)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(3)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(4)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(5)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(6)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(7)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(8)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(9)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(10)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(11)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(12)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(13)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(14)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(15)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(16)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(17)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(18)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(19)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(20)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(21)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(22)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(23)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(24)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(25)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(26)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(27)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(28)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(29)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(30)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(31)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(32)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(33)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(34)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(35)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(36)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(37)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(38)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(39)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(40)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(41)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(42)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(43)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(44)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(45)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(46)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(47)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(48)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(49)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(50)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(51)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(52)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(53)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(54)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(55)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(56)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(57)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(58)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(59)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(60)


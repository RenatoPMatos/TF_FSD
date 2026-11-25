/*
 * TEST BENCH PARA A NANO CPU - VERSÃO DO ALUNO - Prof. Fernando Gehm Moraes - 16/novembro/2026
*/

  timeunit 1ns;
  timeprecision 1ps;

module nanoCPU_TB;

  import nanoCPU_pkg::*;


  // number of memory positions printed at the end of the simulation
  localparam int K = 60;

  logic ck, rst, we, ce;
  logic [15:0] dataR, dataW;
  logic [7:0] address;

  // Memory array signal for 256 x 16-bit positions
  typedef logic [15:0] memory_array_t [0:255];
  memory_array_t memory;

  // programa inicial: inicializa R0 e R1 (slide 15)
  // nas atividades, acrescentar novas instruções neste vetor
  memory_array_t memoryB = '{
      0: 'h01E0,   // R0 = PMEM[30]
      1: 'h01F1,   // R1 = PMEM[31]
      2: 'h0202,   // R2 = PMEM[32]
      3: 'h0213,   // R3 = PMEM[33]
      4: 'h6003,   // R0 = R0 + R3
      5: 'h5101,   // R1 = R0 - R1
      6: 'h4300,   // R3 = R0 xor R0
      7: 'h7210,   // R2 = R1 < R0
      8: 'h10F0,   // PMEM[15] = R0
      9: 'h1101,   // PMEM[16] = R1
     10: 'h1112,   // PMEM[17] = R2
     11: 'h3FF2,   // branch para 255 se R2[0] = 1
     20: 'hF000,   // fim (iEND)
     30: 'h1111,
     31: 'h2222,
     32: 'h3333,
     33: 'h4444,
    255: 'h2140,   // jump incondicional para 20
    default: 'h0000
  };

  initial memory = memoryB;  // program to load into the memory

  // Generate clock and reset signals
  initial begin
    ck = 1'b0;
    rst = 1'b1;
    #2 rst = 1'b0;
  end

  always #1 ck = ~ck;

  // Waveform dump (open with: gtkwave dump.fst)
  initial begin
    $dumpfile("dump.fst");
    $dumpvars(0, nanoCPU_TB);
  end

  // End of simulation: CPU reached the 'fim' state
  // prints the registers and the first K memory positions, 5 per line:
  initial begin
    bit is_code;
    instType inst;
    string info;

    wait (CPU.EA == CPU.fim);
    @(posedge ck);

    $display("Fim da simulacao: \n R0 = %h   R1 = %h    R2 = %h   R3 = %h",
                 CPU.reg_bank[0], CPU.reg_bank[1], CPU.reg_bank[2], CPU.reg_bank[3]);

    $display("Memoria - primeiras %0d posicoes (end: conteudo instrucao/dado):", K);
    is_code = 1;
    for (int i = 0; i < K; i++) begin
      inst = instType'(memory[i][15:12]);    // opcode -> instruction
      info = is_code ? inst.name() : $sformatf("%0d", memory[i]);
      while (info.len() < 10) info = {info, " "};   // fixed column width
      $write("%3d: %h %s", i, memory[i], info);
      if (i % 5 == 4 || i == K-1)
        $write("\n");
      else
        $write("| ");
      if (inst == iEND)
        is_code = 0;
    end
    # 10  $finish;
  end

  // Instantiate the NanoCPU
  NanoCPU CPU (
    .ck(ck),
    .rst(rst),
    .address(address),
    .dataR(dataR),
    .dataW(dataW),
    .ce(ce),
    .we(we)
  );

  // Write to memory
  always @(posedge ck) begin
    if (we) begin
      memory[address] <= dataW;
    end
  end

  // Read from memory
  assign dataR = memory[address];

endmodule

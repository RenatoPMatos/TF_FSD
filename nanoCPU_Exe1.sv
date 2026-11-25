/*
 * NANO CPU   --------  VERSÃO DO ALUNO (código mínimo, com acesso indireto à memória)
 * Fernando Gehm Moraes
 * 16/novembro/2026
 *
 * As partes a completar estão indicadas por comentários "// Atividade xx - <tópico>"
*/
  timeunit 1ns;
  timeprecision 1ps;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Instruction set - shared by the CPU and the test bench
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
package nanoCPU_pkg;
   typedef enum logic [3:0] {
      iREAD      = 4'h0,
      iWRITE     = 4'h1,
      iJMP       = 4'h2,
      iBRANCH    = 4'h3,
      iXOR       = 4'h4,
      iSUB       = 4'h5,
      iADD       = 4'h6,
      iLESS      = 4'h7,
      // Atividade 7 - INC e DEC: incluir as instruções (opcodes 8 e 9)
      iREAD_IND  = 4'hA,
      iWRITE_IND = 4'hB,
      iEND       = 4'hF
   } instType;
endpackage

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// N-bit register (default 16 bits)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module Register #(parameter int N = 16) (
   input logic ck, rst, we,
   input logic [N-1:0] D,
   output logic [N-1:0] Q
);
   always_ff @(posedge ck or posedge rst) begin
      if (rst) begin
         Q <= '0;
      end else if (we) begin
         Q <= D;
      end
   end

endmodule

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// NanoCPU description
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module NanoCPU
   import nanoCPU_pkg::*;
(
   input  logic ck, rst,
   output logic [7:0]  address,
   input  logic [15:0] dataR,
   output logic [15:0] dataW,
   output logic ce, we
);
   instType inst;

   // EAs for the control FSM
   typedef enum logic [3:0] {
      IDLE, FETCH, EXEC, LD, WRITE, ALU, JMP, BRANCH, fim
   } EAType;
   EAType EA;

   logic [15:0] reg_bank [3:0];    // 4 16-bit registers
   logic wPC, wIR, wReg;
   logic [3:0] wen;
   logic [1:0] addReg;
   logic [15:0] IR, RS1, RS2, muxRegIn, outalu;
   logic [7:0]  muxPC, PC;

   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   // data-path - responsible to execute the current instruction
   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   // memory interface
   assign dataW = outalu;
   assign address = (EA==FETCH)  ? PC :
                    (inst==iREAD_IND || inst==iWRITE_IND) ? RS1[7:0] : IR[11:4];
   assign ce = 1'b1;
   assign we = 1'b0;          // Atividade 5 - escrita na memória: we ativo no estado WRITE

   // register bank - 4 general purpose registers
   generate
      for (genvar i = 0; i < 4; i++) begin
         Register #(16) reg_inst (.ck(ck), .rst(rst), .we(wen[i]), .D(muxRegIn), .Q(reg_bank[i]));
         assign wen[i] = addReg==i && wReg;
      end
   endgenerate

   assign addReg   = IR[1:0]; // Atividade 1 - banco de registradores: mux ausente (IR[1:0] em LD, senão IR[9:8])
   assign muxRegIn = dataR;   // Atividade 1 - banco de registradores: mux ausente (dataR em LD, senão outalu)

   assign RS1 = reg_bank[IR[5:4]];    // reg bank output multiplexers
   assign RS2 = reg_bank[IR[1:0]];

   // arithmetic and logic unit
   always_comb begin
      case (inst)
         iWRITE, iWRITE_IND: outalu = RS2;  // data to be written is the second register
         // Atividade 3 - ULA: completar as operações XOR, SUB e LESS
         // Atividade 7 - INC e DEC: incluir as operações de incremento e decremento
         default: outalu = RS1 + RS2;
      endcase
   end

   // IR and PC registers
   Register #(16) R_IR (.ck(ck), .rst(rst), .we(wIR), .D(dataR), .Q(IR));
   Register #(8)  R_PC (.ck(ck), .rst(rst), .we(wPC), .D(muxPC), .Q(PC));

   assign  muxPC = PC + 1;    // Atividade 6 - saltos: IR[11:4] se (EA == JMP) ou (EA == BRANCH && RS2[0])

   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   // control block  - manages the execution of instructions
   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   assign inst = instType'(IR[15:12]);    // decode the current instruction (opcode -> instruction)

   assign wPC =  (EA == LD || EA == ALU || EA == WRITE || EA == JMP || EA == BRANCH);
   assign wReg = (EA == LD || EA == ALU);
   assign wIR =  (EA == FETCH);

   always_ff @(posedge ck or posedge rst) begin
      if (rst)
         EA <= IDLE;
      else begin
         case (EA)
            IDLE:    EA <= FETCH;
            FETCH:   EA <= EXEC;
            EXEC:    case (inst)
                        iEND:               EA <= fim;
                        iREAD, iREAD_IND:   EA <= LD;
                        default:            EA <= ALU;
                     endcase
            fim:     EA <= fim;
            default: EA <= FETCH;
         endcase
      end
   end

endmodule

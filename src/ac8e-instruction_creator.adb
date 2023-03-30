with Ac8e.Instruction.Clear_Screen;
with Ac8e.Instruction.Return_From_Subroutine;
with Ac8e.Instruction.Jump;
with Ac8e.Instruction.Call_Subroutine;
with Ac8e.Instruction.Call_Sys;

package body Ac8e.Instruction_Creator is
   type Machine_Code_Nibbles is
      record
         Nibble_1 : Byte;
         Nibble_2 : Byte;
         Nibble_3 : Byte;
         Nibble_4 : Byte;
      end record;

   procedure To_Machine_Code_Nibbles (Op : Machine_Code;
                                      Nibbles : out Machine_Code_Nibbles) is
   begin
      Nibbles.Nibble_1 := Op (Op'First) / 16;
      Nibbles.Nibble_2 := Op (Op'First) mod 16;
      Nibbles.Nibble_3 := Op (Op'First + 1) / 16;
      Nibbles.Nibble_4 := Op (Op'First + 1) mod 16;
   end To_Machine_Code_Nibbles;

   function Opcode_0 (Op : Machine_Code)
      return Ac8e.Instruction.Instruction_Type'Class is
   begin
      if Op (1) = 16#00# and then Op (2) = 16#E0# then
         declare
            use Ac8e.Instruction.Clear_Screen;
            Cls : Clear_Screen_Type;
         begin
            Create (Op => Op, C => Cls);
            return Cls;
         end;
      elsif Op (1) = 16#00# and then Op (2) = 16#EE# then
         declare
            use Ac8e.Instruction.Return_From_Subroutine;
            Rts : Return_From_Subroutine_Type;
         begin
            Create (Op => Op, R => Rts);
            return Rts;
         end;
      else
         declare
            use Ac8e.Instruction.Call_Sys;
            C : Call_Sys_Type;
         begin
            Create (Op => Op, C => C);
            return C;
         end;
      end if;
   end Opcode_0;

   function Create (Op : Machine_Code)
      return Ac8e.Instruction.Instruction_Type'Class is
      Op_Nibbles : Machine_Code_Nibbles;
   begin
      To_Machine_Code_Nibbles (Op => Op, Nibbles => Op_Nibbles);
      case Op_Nibbles.Nibble_1 is
         when 0 => return Opcode_0 (Op => Op);
         when 1 =>
            declare
               use Ac8e.Instruction.Jump;
               J : Jump_Type;
            begin
               Create (Op => Op, J => J);
               return J;
            end;
         when 2 =>
            declare
               use Ac8e.Instruction.Call_Subroutine;
               Cs : Call_Subroutine_Type;
            begin
               Create (Op => Op, C => Cs);
               return Cs;
            end;
         when others =>
            declare
               I : Ac8e.Instruction.Instruction_Type;
            begin
               Ac8e.Instruction.Create (Op => Op, I => I);
               return I;
            end;
      end case;
   end Create;
end Ac8e.Instruction_Creator;

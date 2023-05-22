with Ac8e.Instruction_Decoder;

package body Ac8e.Instruction is
   package ID renames Ac8e.Instruction_Decoder;

   function Create (Op : Machine_Code) return Decoded_Instruction is
      (Machine_Instruction => Op,
       Operation => ID.Op_Code (Op),
       X => ID.X (Op),
       Y => ID.Y (Op),
       NNN => ID.NNN (Op),
       KK => ID.KK (Op),
       N => ID.N (Op));

   function Is_Instruction (Op : Machine_Code) return Boolean is
      Operation : constant Op_Code := ID.Op_Code (Op);
      N : constant Byte := ID.N (Op);
      KK : constant Byte := ID.KK (Op);
      Result : Boolean := False;
   begin
      case Operation is
         when 0 | 1 | 2 | 3 | 4 | 6 | 7 | 16#A# | 16#B# | 16#C# | 16#D# =>
            Result := True;
         when 5 =>
            if N = 0 then
               Result := True;
            end if;
         when 8 =>
            if N in 0 .. 7 or else N = 16#E# then
               Result := True;
            end if;
         when 9 =>
            if N = 0 then
               Result := True;
            end if;
         when 16#E# =>
            if KK = 16#A1# then
               Result := True;
            end if;
         when 16#F# =>
            if KK in 16#07# | 16#0A# | 16#15# | 16#18# | 16#1E# | 16#29# | 16#33# | 16#55# | 16#65# then
               Result := True;
            end if;
      end case;
               
      return Result;
   end Is_Instruction;
end Ac8e.Instruction;

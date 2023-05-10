package body Ac8e.Registers is

   procedure Set_V (X : Zero_To_Fifteen; Value : Byte) is
   begin
      Vx (X) := Value;
   end Set_V;

end Ac8e.Registers;

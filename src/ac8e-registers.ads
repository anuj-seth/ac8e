with Ac8e.Random_Access_Memory;

package Ac8e.Registers is
   package RAM renames Ac8e.Random_Access_Memory;

   subtype Zero_To_Fifteen is Natural range 0 .. 15;

   procedure Set_V (X : Zero_To_Fifteen;
                    Value : Byte);

private
   Vx : array (Zero_To_Fifteen) of Byte;
   I : RAM.Memory_Location;
   PC : RAM.Memory_Location;
   SP : Zero_To_Fifteen;
   Stack : array (Zero_To_Fifteen) of RAM.Memory_Location;
   Delay_Timer, Sound_Time : Byte;
end Ac8e.Registers;

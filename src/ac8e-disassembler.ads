with Ac8e.Random_Access_Memory;

package Ac8e.Disassembler is
   package RAM renames Ac8e.Random_Access_Memory;

   procedure Disassemble (From_Address : RAM.Memory_Location;
                          Instructions : Natural);
end Ac8e.Disassembler;

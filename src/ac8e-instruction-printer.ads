package Ac8e.Instruction.Printer is
   function Put (I : Decoded_Instruction)
      return String;
private
   --  commenting this out leads to a compiler bug showing up
   function Printer_Not_Implemented (I : Decoded_Instruction)
      return String;
end Ac8e.Instruction.Printer;

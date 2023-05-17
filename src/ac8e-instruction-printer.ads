package Ac8e.Instruction.Printer is
   function Put (I : Instruction_Type)
      return String;
private
   --  commenting this out leads to a compiler bug showing up
   function Printer_Not_Implemented (I : Instruction_Type)
      return String;
end Ac8e.Instruction.Printer;

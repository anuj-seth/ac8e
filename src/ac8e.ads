with Ada.Text_IO;

package Ac8e is
   type Nibble is mod 2**4;
   package Nibble_IO is
      new Ada.Text_IO.Modular_IO (Num => Nibble);

   type Byte is mod 2**8;
   type Byte_Array is array (Natural range <>) of Byte;
   subtype Machine_Code is Byte_Array (1 .. 2);
end Ac8e;

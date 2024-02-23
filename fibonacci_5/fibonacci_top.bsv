import Fibonacci::*;
import Vector::*;

// Recompile and rerun?
// make clean fibonacci_top; ./fibonacci_top

typedef enum {
    Rising,
    Falling,
    Random,
    RandomBiased
} State deriving (Bits, Eq);

module fibonacci_top(Empty);  // Version 2.0: Variable number, our top module uses only once.
    Fibonacci fibonacci <- mkFibonacci;
    Reg#(Bit#(16)) count <- mkReg(0);
    Reg#(State) state <- mkReg(Falling);

    // Some helper functions
    function Action call_start(Bit#(8) n);
    action  // BSC is a little annoying; action/endaction are implicit in methods, but not functions
        fibonacci.start(n);
        count <= count + 1;
    endaction
    endfunction

    function Action call_get(Bit#(32) expected);
    action
        let val <- fibonacci.get();
        if (val != expected) begin
            $display("bad: %0d != %0d", val, expected);
            $finish(1);
        end
        count <= count + 1;
    endaction
    endfunction

    // see gen_test.py
    rule rising0 if (state == Rising && count == 0); call_start(1); endrule
    rule rising1 if (state == Rising && count == 1); call_get(1); endrule
    rule rising2 if (state == Rising && count == 2); call_start(2); endrule
    rule rising3 if (state == Rising && count == 3); call_get(2); endrule
    rule rising4 if (state == Rising && count == 4); call_start(3); endrule
    rule rising5 if (state == Rising && count == 5); call_get(3); endrule
    rule rising6 if (state == Rising && count == 6); call_start(4); endrule
    rule rising7 if (state == Rising && count == 7); call_get(5); endrule
    rule rising8 if (state == Rising && count == 8); call_start(5); endrule
    rule rising9 if (state == Rising && count == 9); call_get(8); endrule
    rule rising10 if (state == Rising && count == 10); call_start(6); endrule
    rule rising11 if (state == Rising && count == 11); call_get(13); endrule
    rule rising12 if (state == Rising && count == 12); call_start(7); endrule
    rule rising13 if (state == Rising && count == 13); call_get(21); endrule
    rule rising14 if (state == Rising && count == 14); call_start(8); endrule
    rule rising15 if (state == Rising && count == 15); call_get(34); endrule
    rule rising16 if (state == Rising && count == 16); call_start(9); endrule
    rule rising17 if (state == Rising && count == 17); call_get(55); endrule
    rule rising18 if (state == Rising && count == 18); call_start(10); endrule
    rule rising19 if (state == Rising && count == 19); call_get(89); endrule
    rule rising20 if (state == Rising && count == 20); call_start(11); endrule
    rule rising21 if (state == Rising && count == 21); call_get(144); endrule
    rule rising22 if (state == Rising && count == 22); call_start(12); endrule
    rule rising23 if (state == Rising && count == 23); call_get(233); endrule
    rule rising24 if (state == Rising && count == 24); call_start(13); endrule
    rule rising25 if (state == Rising && count == 25); call_get(377); endrule
    rule rising26 if (state == Rising && count == 26); call_start(14); endrule
    rule rising27 if (state == Rising && count == 27); call_get(610); endrule
    rule rising28 if (state == Rising && count == 28); call_start(15); endrule
    rule rising29 if (state == Rising && count == 29); call_get(987); endrule
    rule rising30 if (state == Rising && count == 30); call_start(16); endrule
    rule rising31 if (state == Rising && count == 31); call_get(1597); endrule
    rule rising32 if (state == Rising && count == 32); call_start(17); endrule
    rule rising33 if (state == Rising && count == 33); call_get(2584); endrule
    rule rising34 if (state == Rising && count == 34); call_start(18); endrule
    rule rising35 if (state == Rising && count == 35); call_get(4181); endrule
    rule rising36 if (state == Rising && count == 36); call_start(19); endrule
    rule rising37 if (state == Rising && count == 37); call_get(6765); endrule
    rule rising38 if (state == Rising && count == 38); call_start(20); endrule
    rule rising39 if (state == Rising && count == 39); call_get(10946); endrule
    rule rising40 if (state == Rising && count == 40); call_start(21); endrule
    rule rising41 if (state == Rising && count == 41); call_get(17711); endrule
    rule rising42 if (state == Rising && count == 42); call_start(22); endrule
    rule rising43 if (state == Rising && count == 43); call_get(28657); endrule
    rule rising44 if (state == Rising && count == 44); call_start(23); endrule
    rule rising45 if (state == Rising && count == 45); call_get(46368); endrule
    rule rising46 if (state == Rising && count == 46); call_start(24); endrule
    rule rising47 if (state == Rising && count == 47); call_get(75025); endrule
    rule rising48 if (state == Rising && count == 48); call_start(25); endrule
    rule rising49 if (state == Rising && count == 49); call_get(121393); endrule
    rule rising50 if (state == Rising && count == 50); call_start(26); endrule
    rule rising51 if (state == Rising && count == 51); call_get(196418); endrule
    rule rising52 if (state == Rising && count == 52); call_start(27); endrule
    rule rising53 if (state == Rising && count == 53); call_get(317811); endrule
    rule rising54 if (state == Rising && count == 54); call_start(28); endrule
    rule rising55 if (state == Rising && count == 55); call_get(514229); endrule
    rule rising56 if (state == Rising && count == 56); call_start(29); endrule
    rule rising57 if (state == Rising && count == 57); call_get(832040); endrule
    rule rising58 if (state == Rising && count == 58); call_start(30); endrule
    rule rising59 if (state == Rising && count == 59); call_get(1346269); endrule
    rule rising60 if (state == Rising && count == 60); call_start(31); endrule
    rule rising61 if (state == Rising && count == 61); call_get(2178309); endrule
    rule rising62 if (state == Rising && count == 62); call_start(32); endrule
    rule rising63 if (state == Rising && count == 63); call_get(3524578); endrule
    rule rising64 if (state == Rising && count == 64); call_start(33); endrule
    rule rising65 if (state == Rising && count == 65); call_get(5702887); endrule
    rule rising66 if (state == Rising && count == 66); call_start(34); endrule
    rule rising67 if (state == Rising && count == 67); call_get(9227465); endrule
    rule rising68 if (state == Rising && count == 68); call_start(35); endrule
    rule rising69 if (state == Rising && count == 69); call_get(14930352); endrule
    rule rising70 if (state == Rising && count == 70); call_start(36); endrule
    rule rising71 if (state == Rising && count == 71); call_get(24157817); endrule
    rule rising72 if (state == Rising && count == 72); call_start(37); endrule
    rule rising73 if (state == Rising && count == 73); call_get(39088169); endrule
    rule rising74 if (state == Rising && count == 74); call_start(38); endrule
    rule rising75 if (state == Rising && count == 75); call_get(63245986); endrule
    rule rising76 if (state == Rising && count == 76); call_start(39); endrule
    rule rising77 if (state == Rising && count == 77); call_get(102334155); endrule
    rule rising78 if (state == Rising && count == 78); call_start(40); endrule
    rule rising79 if (state == Rising && count == 79); call_get(165580141); endrule
    rule rising80 if (state == Rising && count == 80); call_start(41); endrule
    rule rising81 if (state == Rising && count == 81); call_get(267914296); endrule
    rule rising82 if (state == Rising && count == 82); call_start(42); endrule
    rule rising83 if (state == Rising && count == 83); call_get(433494437); endrule
    rule rising84 if (state == Rising && count == 84); call_start(43); endrule
    rule rising85 if (state == Rising && count == 85); call_get(701408733); endrule
    rule finish_rising if (state == Rising && count == 86); $display("Done"); $finish(0); endrule
        
    rule falling0 if (state == Falling && count == 0); call_start(43); endrule
    rule falling1 if (state == Falling && count == 1); call_get(701408733); endrule
    rule falling2 if (state == Falling && count == 2); call_start(42); endrule
    rule falling3 if (state == Falling && count == 3); call_get(433494437); endrule
    rule falling4 if (state == Falling && count == 4); call_start(41); endrule
    rule falling5 if (state == Falling && count == 5); call_get(267914296); endrule
    rule falling6 if (state == Falling && count == 6); call_start(40); endrule
    rule falling7 if (state == Falling && count == 7); call_get(165580141); endrule
    rule falling8 if (state == Falling && count == 8); call_start(39); endrule
    rule falling9 if (state == Falling && count == 9); call_get(102334155); endrule
    rule falling10 if (state == Falling && count == 10); call_start(38); endrule
    rule falling11 if (state == Falling && count == 11); call_get(63245986); endrule
    rule falling12 if (state == Falling && count == 12); call_start(37); endrule
    rule falling13 if (state == Falling && count == 13); call_get(39088169); endrule
    rule falling14 if (state == Falling && count == 14); call_start(36); endrule
    rule falling15 if (state == Falling && count == 15); call_get(24157817); endrule
    rule falling16 if (state == Falling && count == 16); call_start(35); endrule
    rule falling17 if (state == Falling && count == 17); call_get(14930352); endrule
    rule falling18 if (state == Falling && count == 18); call_start(34); endrule
    rule falling19 if (state == Falling && count == 19); call_get(9227465); endrule
    rule falling20 if (state == Falling && count == 20); call_start(33); endrule
    rule falling21 if (state == Falling && count == 21); call_get(5702887); endrule
    rule falling22 if (state == Falling && count == 22); call_start(32); endrule
    rule falling23 if (state == Falling && count == 23); call_get(3524578); endrule
    rule falling24 if (state == Falling && count == 24); call_start(31); endrule
    rule falling25 if (state == Falling && count == 25); call_get(2178309); endrule
    rule falling26 if (state == Falling && count == 26); call_start(30); endrule
    rule falling27 if (state == Falling && count == 27); call_get(1346269); endrule
    rule falling28 if (state == Falling && count == 28); call_start(29); endrule
    rule falling29 if (state == Falling && count == 29); call_get(832040); endrule
    rule falling30 if (state == Falling && count == 30); call_start(28); endrule
    rule falling31 if (state == Falling && count == 31); call_get(514229); endrule
    rule falling32 if (state == Falling && count == 32); call_start(27); endrule
    rule falling33 if (state == Falling && count == 33); call_get(317811); endrule
    rule falling34 if (state == Falling && count == 34); call_start(26); endrule
    rule falling35 if (state == Falling && count == 35); call_get(196418); endrule
    rule falling36 if (state == Falling && count == 36); call_start(25); endrule
    rule falling37 if (state == Falling && count == 37); call_get(121393); endrule
    rule falling38 if (state == Falling && count == 38); call_start(24); endrule
    rule falling39 if (state == Falling && count == 39); call_get(75025); endrule
    rule falling40 if (state == Falling && count == 40); call_start(23); endrule
    rule falling41 if (state == Falling && count == 41); call_get(46368); endrule
    rule falling42 if (state == Falling && count == 42); call_start(22); endrule
    rule falling43 if (state == Falling && count == 43); call_get(28657); endrule
    rule falling44 if (state == Falling && count == 44); call_start(21); endrule
    rule falling45 if (state == Falling && count == 45); call_get(17711); endrule
    rule falling46 if (state == Falling && count == 46); call_start(20); endrule
    rule falling47 if (state == Falling && count == 47); call_get(10946); endrule
    rule falling48 if (state == Falling && count == 48); call_start(19); endrule
    rule falling49 if (state == Falling && count == 49); call_get(6765); endrule
    rule falling50 if (state == Falling && count == 50); call_start(18); endrule
    rule falling51 if (state == Falling && count == 51); call_get(4181); endrule
    rule falling52 if (state == Falling && count == 52); call_start(17); endrule
    rule falling53 if (state == Falling && count == 53); call_get(2584); endrule
    rule falling54 if (state == Falling && count == 54); call_start(16); endrule
    rule falling55 if (state == Falling && count == 55); call_get(1597); endrule
    rule falling56 if (state == Falling && count == 56); call_start(15); endrule
    rule falling57 if (state == Falling && count == 57); call_get(987); endrule
    rule falling58 if (state == Falling && count == 58); call_start(14); endrule
    rule falling59 if (state == Falling && count == 59); call_get(610); endrule
    rule falling60 if (state == Falling && count == 60); call_start(13); endrule
    rule falling61 if (state == Falling && count == 61); call_get(377); endrule
    rule falling62 if (state == Falling && count == 62); call_start(12); endrule
    rule falling63 if (state == Falling && count == 63); call_get(233); endrule
    rule falling64 if (state == Falling && count == 64); call_start(11); endrule
    rule falling65 if (state == Falling && count == 65); call_get(144); endrule
    rule falling66 if (state == Falling && count == 66); call_start(10); endrule
    rule falling67 if (state == Falling && count == 67); call_get(89); endrule
    rule falling68 if (state == Falling && count == 68); call_start(9); endrule
    rule falling69 if (state == Falling && count == 69); call_get(55); endrule
    rule falling70 if (state == Falling && count == 70); call_start(8); endrule
    rule falling71 if (state == Falling && count == 71); call_get(34); endrule
    rule falling72 if (state == Falling && count == 72); call_start(7); endrule
    rule falling73 if (state == Falling && count == 73); call_get(21); endrule
    rule falling74 if (state == Falling && count == 74); call_start(6); endrule
    rule falling75 if (state == Falling && count == 75); call_get(13); endrule
    rule falling76 if (state == Falling && count == 76); call_start(5); endrule
    rule falling77 if (state == Falling && count == 77); call_get(8); endrule
    rule falling78 if (state == Falling && count == 78); call_start(4); endrule
    rule falling79 if (state == Falling && count == 79); call_get(5); endrule
    rule falling80 if (state == Falling && count == 80); call_start(3); endrule
    rule falling81 if (state == Falling && count == 81); call_get(3); endrule
    rule falling82 if (state == Falling && count == 82); call_start(2); endrule
    rule falling83 if (state == Falling && count == 83); call_get(2); endrule
    rule falling84 if (state == Falling && count == 84); call_start(1); endrule
    rule falling85 if (state == Falling && count == 85); call_get(1); endrule
    rule finish_falling if (state == Falling && count == 86); $display("Done"); $finish(0); endrule
            
        
endmodule
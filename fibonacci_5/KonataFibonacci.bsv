typedef Bit#(32) KonataID;

function Action tickKonata(File f);
    action 
        $fdisplay(f, "C\t1");
    endaction
endfunction

function ActionValue#(KonataID) startKonata(File f, Reg#(KonataID) id);
    // Include the declaration of the instr
    actionvalue
        id <= id + 1;
        $fdisplay(f,"I\t%d\t%d\t%d",id,id,0);
        // $fdisplay(f,"S\t%d\t%d\t%s",counter,0,"S");
        return id;
    endactionvalue
endfunction

function Action codeKonata(File f, KonataID id, String code);
    action
        $fdisplay(f,"S\t%d\t%d\t%s",id,0, code);
    endaction
endfunction

function Action commitKonata(File f, KonataID id);
    action
        // konataCmt <= konataCmt + 1;
        $fdisplay(f,"R\t%d\t%d\t%d", id, id,0);
    endaction
endfunction
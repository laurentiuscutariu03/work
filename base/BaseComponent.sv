
`ifndef __BASECOMPONENT_SV__
`define __BASECOMPONENT_SV__      

 class CBaseComponent extends CBaseObject;
    string strName;
    static CBaseComponent root;
        CBaseComponent parrent;
    CBaseComponent child[$];

        bit bReady2Finish;

        function new(CBaseComponent parrent, string strName);

        this.strName = strName;
        this.parrent = parrent;
        if( parrent != null)
          parrent.child.push_back(this);
        else
              root = this; //o singura componenta in virful ierarhiei
                bReady2Finish = 1;
    endfunction

    function string GetLongName();
        if( parrent == null )
            GetLongName = strName;
        else
            GetLongName = {parrent.GetLongName(),".",strName};
    endfunction

    static function string DisplayTree();
        if( root != null )
            DisplayTree = root.DisplayTreeRec();
        else
            DisplayTree = "Empty";
    endfunction    

    function string DisplayTreeRec(int indent = 0);
        DisplayTreeRec = "";
        repeat(indent)
            DisplayTreeRec = {DisplayTreeRec, "    "};
        DisplayTreeRec = {DisplayTreeRec, strName};
        foreach( child[i] )
            DisplayTreeRec = { DisplayTreeRec,  "\n", child[i].DisplayTreeRec(indent+1) };
    endfunction

    function string display(string strMsg, string strFile, int nLine);
                string strLine;  strLine.itoa(nLine); 
        display = {GetCurrentTime(), " ", GetLongName(), ":\n\t", 
                strMsg, "\n",
            "from file: ", strFile, " line: ", strLine};
    endfunction

endclass

`define DISPLAY(strMsg)  display(strMsg, `__FILE__, `__LINE__)


`endif //__BASECOMPONENT_SV__    


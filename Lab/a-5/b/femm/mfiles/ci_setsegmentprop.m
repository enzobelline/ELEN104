% ActiveFEMM (C)2006 David Meeker, dmeeker@ieee.org

function ci_setsegmentprop(pn,es,am,hi,gr, inconductor)
callfemm(['ci_setsegmentprop(' , quotec(pn) , numc(es) , numc(am) , numc(hi) , numc(gr) , quote(inconductor) , ')']);


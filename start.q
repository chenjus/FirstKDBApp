\l wapi.q
start[`;`]; 
//tab:([sym:()]; rt_last:())
tab:1_([sym:`TMP`DIFF]; rt_last:0.0 0.0)
evaluate:{$[99h=abs[type x];$[not `func in key x;'"dictionary must contain `func in key";(value x`func) . value `func _ x];'"cannot handle this type"]}
evaluatetrapped:{@[evaluate;x;{'"failed to execute ",(-3!x)," : ",y}[x]]};
.z.ws:{evaluatetrapped[-9!x];}
sub:{histData::wsi[(`$x),(`$y);`$"close";`$(string .z.d)," 09:29:00";`$(string .z.d)," 15:00:00";`]`data; mydata::update windcode:`DIFF,close:({0-x[0]-x[1]*1.5} each raze value each value select close by dt from histData) from select windcode by dt from histData; values::select dt,windcode,close from histData;`values insert 0!mydata;neg[.z.w] -8!values;cancelrequest[0];wsqsub[(`$x),(`$y);`$"rt_last";`]}
//sub:{neg[.z.w] -8!wsi[(`$x),(`$y);`$"close";`$(string .z.d)," 09:29:00";`$(string .z.d)," 15:00:00";`]`data}
sendData:{neg[x] -8!y;}
f:{0-x[1]-x[2]*1.5}
onwsqsub:{`tab upsert 1!select sym,rt_last from x`data;update rt_last:eval(f;value flip value tab) from `tab where sym=`DIFF;sendData\:[key .z.W;tab]}


//update windcode:`DIFF,close:({0-x[0]-x[1]*1.5} each raze value each value select close by dt from hd) from select windcode by dt from hd
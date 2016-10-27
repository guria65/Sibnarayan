 fibo=function(n){
   x=rep(NA,n)
   x[1]=1;x[2]=2;i=3
   while(i<=n){
     x[i]=x[i-1]+x[i-2]
     i=i+1
   }
   x
 }
 x=fibo(500)
 a=1/(1+exp(-x))
 r=rep(NA,499)
  for(i in 5:499)r[i]=x[i+1]/x[i]
 table(format(r,nsmall = 5))
 
 
 
 
 library(Hmisc)
object=scan('~/Documents/TEXTEX/sib.txt',character(0),sep=" ")
cat(latex(object,
            #title="sib8",#first.word(deparse(substitute(object))),
            file="sib.tex",#paste(title, ".tex", sep=""),
            append=FALSE, label="sib",#title,
            # rowlabel=title, rowlabel.just="l",
            cgroup=NULL, n.cgroup=NULL,
            rgroup=NULL, n.rgroup=NULL,
            cgroupTexCmd="bfseries",
            rgroupTexCmd="bfseries",
            rownamesTexCmd=NULL,
            colnamesTexCmd=NULL,
            cellTexCmds=NULL,
            rowname, cgroup.just=rep("c",length(n.cgroup)),
            colheads=NULL,
            extracolheads=NULL, extracolsize='scriptsize',
            dcolumn=FALSE, numeric.dollar=!dcolumn, cdot=FALSE,
            longtable=FALSE, draft.longtable=TRUE, ctable=FALSE, booktabs=FALSE,
            table.env=TRUE, here=FALSE, lines.page=40,
            caption=NULL, caption.lot=NULL, caption.loc=c('top','bottom'),
            star=FALSE,
            double.slash=FALSE,
            vbar=FALSE, collabel.just=rep("c",nc), na.blank=TRUE,
            insert.bottom=NULL, insert.bottom.width=NULL,
            insert.top=NULL,
            first.hline.double=!(booktabs | ctable),
            where='!tbp', size=NULL,
            center=c('center','centering','centerline','none'),
            landscape=FALSE,
            multicol=TRUE,
            math.row.names=FALSE, math.col.names=FALSE,
            hyperref=NULL,
            ...) # x is a matrix or data.frame
      )
rm(list=ls())
data=read.delim("Fig1_main_data.txt",header=F)
colnames(data)=c("sample","pos","major","minor","mc","mb","cc","cb","type")

mcx=c()
for (maf in data$mc) {if (maf>0.5) mcx=c(mcx,(1-maf)) else mcx=c(mcx,maf)}
mbx=c()
for (maf in data$mb) {if (maf>0.5) mbx=c(mbx,(1-maf)) else mbx=c(mbx,maf)}
ccx=c()
for (maf in data$cc) {if (maf>0.5) ccx=c(ccx,(1-maf)) else ccx=c(ccx,maf)}
cbx=c()
for (maf in data$cb) {if (maf>0.5) cbx=c(cbx,(1-maf)) else cbx=c(cbx,maf)}

data$mcx=mcx
data$mbx=mbx
data$ccx=ccx
data$cbx=cbx

data$mother=((data$mcx)+(data$mbx))/2
data$child=((data$ccx)+(data$cbx))/2

pdf("Fig1_main.pdf",height=3.42,width=3.42)

par(mfrow=c(2,2))
#par(mar=c(4.1,5,4,4))
#par(oma=c(0,0,0,0))

par(oma=c(0,0,0,0))
par(mar=c(3,2.5,2,1))

par(mgp=c(1.5,0.25,0.25))
par(tck=-0.05)


plot(data$ccx,data$cbx,pch=20,col="#00000078",axes=F,xlab="het. allele frequency (cheek)",ylab="het. allele frequency (blood)",cex.lab=0.85,cex=2,xlim=c(0,1),ylim=c(0,1))
abline(lm(data$ccx~data$cbx), col="darkgrey",lwd=1)


mylabel=bquote(italic(R)^2 == .(round(summary(lm(data$ccx~data$cbx))$r.squared,2)))
text(-0.125,0.7, pos=4,labels=mylabel,font=2,cex=1)
#text(0,0.8, pos=4,labels=paste("corr.coeff.",round(cor(data$ccx,data$cbx),2),sep="="),font=2,cex=0.75)
text(-0.125,0.9,labels="CHILD",cex=1,pos=4)
mtext("A",3,0.5,at=0,cex=1,font=1)
axis(1,at=c(0,0.5,1))
axis(2,at=c(0,0.5,1))



plot(data$mc,data$mb,pch=20,col="#00000078",axes=F,xlab="het. allele frequency (cheek)",ylab="het. allele frequency (blood)",cex.lab=0.85,cex=2,xlim=c(0,1),ylim=c(0,1))
abline(lm(mc~mb,data=data), col="darkgray",lwd=1)
mylabel=bquote(italic(R)^2 == .(round(summary(lm(data$mc~data$mb))$r.squared,2)))
text(-0.125,0.7, pos=4,labels=mylabel,font=2,cex=1)
text(-0.125,0.9,labels="MOTHER",cex=1,pos=4)
mtext("B",3,0.5,at=0,cex=1,font=1)
axis(1,at=c(0,0.5,1))
axis(2,at=c(0,0.5,1))

plot(data$mc,data$ccx,pch=20,col="#00000078",axes=F,xlab="het. allele frequency (mother)",ylab="het. allele frequency (child)",cex.lab=0.85,cex=2,xlim=c(0,1),ylim=c(0,1))
abline(lm(data$mc~data$ccx), col="darkgray",lwd=1)
mylabel=bquote(italic(R)^2 == .(round(summary(lm(data$mc~data$ccx))$r.squared,2)))
text(-0.125,0.7, pos=4,labels=mylabel,font=2,cex=1)
text(-0.125,0.9,labels="CHEEK",cex=1,pos=4)
mtext("C",3,0.5,at=0,cex=1,font=1)
axis(1,at=c(0,0.5,1))
axis(2,at=c(0,0.5,1))


plot(data$mb,data$cbx,pch=20,col="#00000078",axes=F,xlab="het. allele frequency (mother)",ylab="het. allele frequency (child)",cex.lab=0.85,cex=2,xlim=c(0,1),ylim=c(0,1))
abline(lm(data$mb~data$cbx), col="darkgray",lwd=1)
mylabel=bquote(italic(R)^2 == .(round(summary(lm(data$mb~data$cbx))$r.squared,2)))
text(-0.125,0.7, pos=4,labels=mylabel,font=2,cex=1)
text(-0.125,0.9,labels="BLOOD",cex=1,pos=4)
mtext("D",3,0.5,at=0,cex=1,font=1)
axis(1,at=c(0,0.5,1))
axis(2,at=c(0,0.5,1))



dev.off()



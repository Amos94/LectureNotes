# R script for creating plots in chapter 3
# Run as "Rsript makeplots.R"
# Author: Philip Schulz

# create vectors and compute mean
x = seq(1:8)
y = c(0.09, .21, .28, .23, .12, .04, .02, .01)
mu = sum(x*y)

# open stream to file
png("distribution.png", width=8, height=8, units="in", res=300)

# plot y against x
plot(x,y,yaxp=c(0,0.35,7),xlab="Z",ylab="P(Z=z)", cex=1.5)
# connect points and x-axis
segments(x0=x, y0=rep(0,8), y1=y, lwd=5)
# insert red lines
abline(v=2,col="red",lwd=2)
abline(v=5,col="red",lwd=2)
# put arrow underneath x-axis to indicate mean
arrows(mu,-0.03,mu,-.001,xpd=T)
# close stream and save to file
dev.off()

# compute cdf
z = cumsum(y)

# open stream to file
png("cdf.png", width=8, height=8, units="in", res=300)

# plot z against x
plot(x,z,ylab="F(z)",xlab="Z")
# add vertical strokes
for (i in (1:length(x)-1)) { lines(c(x[i],x[i]+1),c(z[i],z[i])) }
# close stream and save to file
dev.off()

# add constant and scale X
additive_constant = 3
scale_factor = 2

# calculate new expectation
new_x = x*scale_factor+additive_constant
new_mu = sum(new_x*y)

all_x = c(x,new_x)
all_y = c(y,y)

png("scaledRV.png", width=8, height=8, units="in", res=300)

plot(all_x, all_y, xlab="Z/X", ylab="P(Z=z)/P(X=x)")
segments(x0=x, y0=rep(0,8), y1=y, col="blue")
segments(x0=new_x, y0=rep(0,8), y1=y, col="red")
arrows(mu,-0.03,mu,-.001,xpd=T, col="blue")
arrows(new_mu,-0.03,new_mu,-.001,xpd=T, col="red")
dev.off()
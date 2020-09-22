n <-c(1, 3, 5)
o<-c(2,4,6)

n+o
6->x
5->y
x+y
x %/% y
8->y


vec<- c(1,2,3)

mat<-matrix(c(1:4),nrow = 2, ncol = 3,byrow = T,dimnames = list(c('r1','r2'),c('c1','c2','c3')))
mat
mat<-matrix(c(1:4),nrow = 2, ncol = 3,byrow = F,dimnames = list(c('r1','r2'),c('c1','c2','c3')))
mat


arr<-array(c(1:6),dim = c(2,2,3))
arr


ce<-data.frame(x=c(1:3),y=c('a','b','c'))
ce
ce[1,1]
ce[1,]
ce[c(1,3),2]
ce[c(1,3),1]
ce[c(1,3),]

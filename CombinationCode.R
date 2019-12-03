#### Parameter combination ####
# Model
# X = L*u + Th*o
# where L = lambda - the weighing parameter for utlity
# Th = theta - the weighing parameter for originality
# u = utility rating
# o = originality rating

#### DATA #### 
# prepare data so that both, utility and originality, have a separate column. Index these in the for-loop. 
# simulated data

data <- matrix(data = sample(x = 1:5, size = 100,replace = T), ncol = 2, nrow = 50)[,1:2] 
data <- cbind(seq(1:50), data)



## Creativity function
creativity <- function(u, o, La, Th){
  creativityScore <- numeric()
  creativityScore <- La*u + Th*o
  return(creativityScore)
  
}

## Combining the scores

Th <- rep(seq(0.1, 0.9, by = 0.1))
La <- rep(seq(0.9, 0.1, by = -0.1))
creativityScores <- matrix(ncol = 9, nrow = nrow(data))

for(i in 1:9){
  
  creativityScores[,i] <- creativity(data[,2],data[,3], La[i], Th[i])
  colnames(creativityScores) <- c("Originality0.1", "Originality0.2", "Originality0.3", "Originality0.4", 
                                  "Originality0.5", "Originality0.6", "Originality0.7" ,"Originality0.8" ,
                                  "Originality0.9")}




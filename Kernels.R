#--------------------------------
overlap.kernel = function(x,y){
  d = length(x)
  (sum(x==y)/d)
}
class(overlap.kernel) = "kernel"
#--------------------------------
SMC.kernel = function(x,y){
  d = length(x)
  (sum(x==y & (x==-1 | x==0))/d) 
}
class(SMC.kernel) = "kernel"
#--------------------------------
aux_h = function(z,alpha){
  (1-z**alpha)**(1/alpha)
}

#--------------------------------
univariate.kernel = function(x,y,p,alpha){
  if (x == y){
    aux_h(p[x+2],alpha)
  } else{0}
}
#--------------------------------
multivariate.kernel = function(P,alpha,gamma){
  kernel= function(x,y){
    aux = 0
    d = length(x)
    for(i in 1: d){
      aux = aux+univariate.kernel(x[i],y[i],P[i,],alpha)
    }
    exp(gamma/d * aux)
  } 
  return (new("kernel",.Data=kernel, kpar= list(P,alpha,gamma)))
}
#--------------------------------
multivariate_id.kernel = function(P,alpha){
  kernel = function(x,y){
    aux = 0
    d = length(x)
    for(i in 1: d){
      aux = aux+univariate.kernel(x[i],y[i],P[i,],alpha)
    }
    aux/d
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
multivariate_center.kernel =function(P,alpha,gamma){
  kernel = function(x,y){
    aux = 0
    d = length(x)
    for(i in 1: d){
      aux = aux+2*univariate.kernel(x[i],y[i],P[i,],alpha) - univariate.kernel(x[i],x[i],P[i,],alpha) - univariate.kernel(y[i],y[i],P[i,],alpha)
    }
    exp(gamma/d * aux)
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha,gamma)))
}

#--------------------------------
aux_abcd = function(x,y,P,alpha){
  sum_a = 0
  sum_b = 0
  sum_c = 0
  sum_d = 0
  for (i in 1:length(x)){
    #Matching values
    if(x[i] == y[i]){
       sum_a = sum_a + univariate.kernel(x[i],y[i],P[i,],alpha)
    }
    else {
      sum_b = sum_b +aux_h(P[i,x+2],alpha)
      sum_c = sum_c +aux_h(P[i,y+2],alpha)
      sum_d = sum_d + (1-aux_h(P[i,x+2],alpha)+1-aux_h(P[i,y+2],alpha))
    }
  }
  c(2*sum_a,sum_b,sum_c,sum_d)
}
#--------------------------------
aux_abcd_freq = function(x,y){
  sum_a = 0
  sum_b = 0
  sum_c = 0
  sum_d = 0
  for (i in 1:length(x)){
    #Matching values
    if(x[i] == y[i]){
      if(x[i] != 1){ sum_a = (sum_a + 1)}
      else{ sum_d = (sum_d + 1)}
    }
    # De bueno a malo
    else if(x[i] > y[i]){ sum_b = (sum_b +1)}
    # De malo a bueno
    else{sum_c = (sum_c +1)}
  }
  c(sum_a,sum_b,sum_c,sum_d)
}
#--------------------------------
GL_3.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    a/(a+b+c)
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_4.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    d = abcd[4]
    (a+d)/(a+b+c+d)
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_5.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    a/(a+2*(b+c))
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_6.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    d = abcd[4]
    (a+d)/(a+2*(b+c)+d)
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_7.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    a/(a+1/2*(b+c))
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_9.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    d = abcd[4]
    (a-b-c+d)/(a+b+c+d)
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_12.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    a/sqrt((a+b)*(a+c))
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_13.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    d = abcd[4]
    den = sqrt((a+b)*(a+c)*(d+b)*(d+c))
    if(den == 0){1}
    else {a/den}
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}

#--------------------------------
GL_14.kernel = function(P,alpha,freq){
  kernel = function(x,y){
    if (freq){abcd = aux_abcd_freq(x,y)}
    else{abcd = aux_abcd(x,y,P,alpha)}
    a = abcd[1]
    b = abcd[2]
    c = abcd[3]
    d = abcd[4]
    den = sqrt((a+b)*(a+c)*(d+b)*(d+c))
    if(den == 0){1}
    else{(a*d - b*c)/den}
  }
  return (new("kernel",.Data=kernel, kpar= list(P,alpha)))
}





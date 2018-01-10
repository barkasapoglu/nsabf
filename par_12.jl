workspace()

n=10

mx=zeros(1000,1000,n+1)

for i=1:n+1
  mx[:,:,i]=ones(1000,1000)
end


function parolel(n)
  a = SharedArray(Float64,n)
  @parallel for i=1:n

    e=mx[:,:,i]*mx[:,:,i+1]
    a[i] = e[1]
  end
  return a

end

function seroal(n)

  b=zeros(n,1)
  for i=1:n

    g=mx[:,:,i]*mx[:,:,i+1]
    b[i] = g[1]
  end
  return b

end

#@time as=seroal(n)

@time ap=parolel(n)

#tic(); parolel(n); toc()

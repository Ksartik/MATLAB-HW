n = input('Enter the dimension of the board');
noAttackQueens(n);

function a = noAttackQueens(n)
  q = queens(n,n);
  sz = size(q);
  Nconfigs = sz(3);
  for i=1:Nconfigs
    A = q(1:n,1:n,i);
    mat2gray(A);
    imshow(1-A);
    pause(2);
  end
  a = Nconfigs;
end

function q = queens(n,k)
  if(k==1)
    for i = 1:n
      q(1:n,1,i) = zeros(n,1);
      q(i,1,i)= 1;
    end
  else
    count = 1;
    qpr = queens(n,k-1);
    l = length(qpr);
    for i = 1: l
      qpr(1:n,k,i) = zeros(n,1);
      for j = 1:n
        if(safe(j,qpr(1:n,1:k-1,i)))
          q(1:n,1:k,count) = qpr(1:n,1:k,i);
          q(j,k,count) = 1;
          count = count + 1;
        end
      end
    end
  end
end

function b = safe(i,A)
  sz = size(A);
  c = sz(2);
  n = sz(1);
  for j = 1:c
    for k = 1:n
      if(A(k,j)==1)
        if((k==i)||(abs(k-i)== c+1-j))
          b = false;
          return;
        end
      end
    end
  end
  b = true;
end
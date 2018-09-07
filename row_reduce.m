function row_reduce(A)
  [r,c] = size(A);
  z = zeros(1,c);
  i = 1;
  for j = 1:c
    if(i > r)
      break;
    end
    if(A(i,:)==z)
      k = i+1;
      while((k <= r) && isequal(A(k,:),z))
        k = k+1;
      end
      if(k > r)
        break;
      else
        A = swap_row(A,i,k);
      end
    elseif(A(i,j) == 0)
      k = i+1;
      while((k <= r) && (A(k,j)==0))
        k = k + 1;
      end
      if (k > r)
        continue;
      else
        A = swap_row(A,i,k);
      end
    else
      e = A(i,j);
      A = factor_row(A, 1/e, i);
      for k = 1: r
        if(k ~= i)
          A = add_rows(A,k,-A(k,j),i);
        end
      end
    end
    i = i + 1;
  end
  disp(A);
end

function B = swap_row(A,i,j)
  sz = size(A);
  c = sz(2);
  T(1:c) = A(j,:);
  A(j,:) = A(i,:);
  A(i,:) = T(1:c);
  B = A;
end

function B = factor_row(A,alpha,i)
  A(i,:) = alpha .* A(i,:);
  B = A;
end

function B = add_rows(A,i,beta,j)
  A(i,:) = A(i,:) + beta .* A(j,:);
  B = A;
end

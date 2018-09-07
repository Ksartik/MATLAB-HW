function string2histogram(A)
    chars = [];
    charsCount = [];
    for i = 1: length(A)
        t = 0;
        l = length(chars);
        for j = 1: l
            if(isequal(A(i),chars{j}))
                charsCount(j) = charsCount(j) + 1;
                t = 1;
            end
        end
        if(t == 0)
            chars{l+1} = A(i);
            charsCount(l+1) = 1;
        end
    end
    bar(1:length(chars), charsCount);
    axis tight;
    %set(gca, 'xTick', 1:length(chars));
    set(gca, 'xTickLabel', chars);
    %set(gcf,'position',[30 50 950 600]);
end

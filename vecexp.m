function z = vecexp(a, b)
    z = ones(size(b));
    for i = 1:size(b)
        z(i) = a^b(i);
    end
end
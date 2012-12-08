function result = translate(str)
    global findvars;
    findvars = true;
    last = parseString(str);
    result = last{1};
end


function result = evaluate(str, var, value, error, mantis)
    global findvars;
    global absErrors;
    global relErrors;
    global values;
    global allStep;
    values = containers.Map;
    absErrors = containers.Map;
    relErrors = containers.Map;
    for i = 1 : length(var)
        values(var{i}) = value(i);
        absErrors(var{i}) = error(i);
        relErrors(var{i}) = error(i) / value(i);
    end
    findvars = false;
    allStep = {};
    parseString(str);
    result = allStep();
%     for i = 1 : length(allStep)
%         a = allStep(i);
%         a{1}
%     end
end

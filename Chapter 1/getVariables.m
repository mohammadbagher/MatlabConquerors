function result = getVariables(str)
    global findvars;
    global variables;
    findvars = true;
    variables = containers.Map;
    parseString(str);
    result = keys(variables);
end

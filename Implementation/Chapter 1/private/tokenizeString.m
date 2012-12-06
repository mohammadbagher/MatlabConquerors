function result = tokenizeString(input)
    string = '';
    last = ' ';
    for i = 1 : size(input, 2)
        if(isletter(input(i)))
            if(~isletter(last))
                string(end + 1) = ' ';
            end
        elseif(strcmp('.', input(i)) || isstrprop(input(i), 'digit'))
            if(~isstrprop(last, 'digit') && ~isletter(last) && ~strcmp('.', last))
                string(end + 1) = ' ';
            end
        else
            string(end + 1) = ' ';
        end
        string(end + 1) = input(i);
        last = input(i);
    end
    tokens = {};
    while not(isempty(string))
        [tokens{end+1},string] = strtok(string, ' \t');
    end
    result = tokens;
end

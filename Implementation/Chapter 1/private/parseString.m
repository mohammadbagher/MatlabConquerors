% each parser function return these four values in order in a cell vevtor:
% name, value, abs error, rel error.

function result = parseString(str)
    global tokens;
    global head;
    
    
    tokens = tokenizeString(str);
    head = 1;
    result = parse_e();
    if(head ~= length(tokens) + 1)
        sprintf('error in the input.')
    end
end

function result = parse_e()
    res_t = parse_t();
    res_e_prim = parse_e_prim();
    
    name = [char(res_t(1)) char(res_e_prim(1))];
    value = cell2mat(res_t(2)) + cell2mat(res_e_prim(2));
    abs_error = cell2mat(res_t(3)) + cell2mat(res_e_prim(3));
    rel_error = abs_error / value;
    %rel_error = max(cell2mat(res_t(4)), cell2mat(res_e_prim(4)));
    if(~isempty(res_e_prim{1}))
        addStep(name, value, abs_error, rel_error);
    end
    result = {name, value, abs_error, rel_error};
end

function result = parse_e_prim()
    if(match('+'))
        res_t = parse_t();
        res_e_prim = parse_e_prim();
        
        name = [' + ' char(res_t(1)) char(res_e_prim(1))];
        value = cell2mat(res_t(2)) + cell2mat(res_e_prim(2));
        abs_error = cell2mat(res_t(3)) + cell2mat(res_e_prim(3));
        rel_error = abs_error / value;
        %rel_error = max(cell2mat(res_t(4)), cell2mat(res_e_prim(4)));
        if(~isempty(res_e_prim{1}))
            addStep(name, value, abs_error, rel_error);
        end
        result = {name, value, abs_error, rel_error};
    elseif(match('-'))
        res_t = parse_t();
        res_e_prim = parse_e_prim();
        
        name = [' - ' char(res_t(1)) ' ' char(res_e_prim(1))];
        value = cell2mat(res_e_prim(2)) - cell2mat(res_t(2));
        abs_error = cell2mat(res_t(3)) + cell2mat(res_e_prim(3));
        rel_error = abs_error / value;
        %vale = cell2mat(res_e_prim(2));
        %valt = cell2mat(res_t(2));
        %rel_error = valt * cell2mat(res_t(4)) / (vale - valt) + vale * cell2mat(res_e_prim(4)) / (vale - valt);
        if(~isempty(res_e_prim{1}))
            addStep(name, value, abs_error, rel_error);
        end
        result = {name, value, abs_error, rel_error};
    else
        result = {'', 0, 0, 0};
    end
end

function result = parse_t()
    res_p = parse_p();
    res_t_prim = parse_t_prim();
    
    name = [char(res_p(1)) char(res_t_prim(1))];
    value = cell2mat(res_p(2)) * cell2mat(res_t_prim(2));
    abs_error = cell2mat(res_t_prim(2)) * cell2mat(res_p(3)) + cell2mat(res_p(2)) * cell2mat(res_t_prim(3));
    rel_error = abs_error / value;
    if(~isempty(res_t_prim{1}))
        addStep(name, value, abs_error, rel_error);
    end
    result = {name, value, abs_error, rel_error};
end

function result = parse_t_prim()
    if(match('*'))
        res_p = parse_p();
        res_t_prim = parse_t_prim();
        
        name = [' * ' char(res_p(1)) char(res_t_prim(1))];
        value = cell2mat(res_p(2)) * cell2mat(res_t_prim(2));
        abs_error = cell2mat(res_t_prim(2)) * cell2mat(res_p(3)) + cell2mat(res_p(2)) * cell2mat(res_t_prim(3));
        rel_error = abs_error / value;
        if(~isempty(res_t_prim{1}))
            addStep(name, value, abs_error, rel_error);
        end
        result = {name, value, abs_error, rel_error};
        
    elseif(match('/'))
        res_p = parse_p();
        res_t_prim = parse_t_prim();
        
        name = [' / ' char(res_p(1)) char(res_t_prim(1))];
        value = cell2mat(res_t_prim(2)) / cell2mat(res_p(2));
        abs_error = cell2mat(res_t_prim(2)) * cell2mat(res_p(3)) + cell2mat(res_p(2)) * cell2mat(res_t_prim(3));
        abs_error = abs_error / (cell2mat(res_p(2)) ^ 2);
        rel_error = abs_error / value;
        if(~isempty(res_t_prim{1}))
            addStep(name, value, abs_error, rel_error);
        end
        result = {name, value, abs_error, rel_error};
    else
        result = {'', 1, 0, 0};
    end
end

function result = parse_p()
    base = parse_a();
    if(match('^'))
        pow = parse_a();
        name = [char(base(1)) ' ^ ' char(pow(1))];
        value = cell2mat(base(2)) ^ cell2mat(pow(2));
        abs_error = cell2mat(base(2)) ^ (cell2mat(pow(2)) - 1);
        abs_error = abs_error * cell2mat(pow(2));
        abs_error = abs_error * cell2mat(base(3));
        rel_error = abs_error / value;
        addStep(name, value, abs_error, rel_error);
        result = {name, value, abs_error, rel_error};
    else
        result = base;
    end
end

function result = parse_a()
    global variables;
    global findvars;
    global absErrors;
    global relErrors;
    global values;
    if(match('('))
        result = parse_e();
        if(~match(')'))
            sprintf('error in the input. no matched close parenthese.')
        end
        result{1} = ['(' result{1} ')'];
    elseif(match('{'))
        result = parse_e();
        if(~match('}'))
            sprintf('error in the input. no matched close bracket.')
        end
        result{1} = ['(' result{1} ')'];
    elseif (match('\'))
        char(get_token());  % read \frac word to /dev/null
        soorat = parse_a();
        makhraj = parse_a();
        
        name = [soorat{1} ' / ' makhraj{1}];
        value = soorat{2} / makhraj{2};
        abs_error = soorat{2} * makhraj{3} + makhraj{2} * soorat{3};
        abs_error = abs_error / makhraj{2} ^ 2;
        rel_error = abs_error / value;
        if(~isempty(soorat{1}))
            addStep(name, value, abs_error, rel_error);
        end
        result = {name, value, abs_error, rel_error};
    elseif (match_identifier())
        name = char(get_token());
        if(findvars)
            variables(name) = '0';
            result = {name, randi([1, 10000]) + 100, 0, 0};
        else
            addStep(name, values(name), absErrors(name), relErrors(name));
            result = {name, values(name), absErrors(name), relErrors(name)};
        end
    elseif (match_number())
        num = str2num(char(get_token()));
        result = {num2str(num), num, 0, 0};
    else
        result = {'var', randi([1, 10000]) + 100, 0, 0};
        sprintf('error: no atomix expression')
    end
end


function result = match_identifier()
    global tokens;
    global head;
    if(head > size(tokens, 2))
        result = false;
    else
        token = char(tokens(head));
        if(isletter(token(1)))
            result = true;
        else
            result = false;
        end
    end
end

function result = match_number()
    global tokens;
    global head;
    if(head > size(tokens, 2))
        result = false;
    else
        token = char(tokens(head));
        if(isstrprop(token(1), 'digit'))
            result = true;
        else
            result = false;
        end
    end
end

function result = get_token()
    global tokens;
    global head;
    result = tokens(head);
    head = head + 1;
end

function result = match(str)
    global tokens;
    global head;
    if(head > size(tokens, 2))
        result = false;
    elseif (strcmp(tokens(head), str))
        head = head + 1;
        result = true;
    else
        result = false;
    end
end

function addStep(name, val, abs, rel)
    global allStep;
    allStep{end+1} = {name, val, abs, rel};
end

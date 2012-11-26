function result = parse( str )
%PARSE parser of arithmetic equations
%   parser of chapter 1

    global tokens, global head;
    tokens = tokenizeString(str);
    head = 1;
    parse_e()
end

function result = parse_e()
    res_t = parse_t();
    res_e_prim = parse_e_prim();
    result = res_t + res_e_prim;
end

function result = parse_e_prim()
    if(match('+'))
        res_t = parse_t();
        res_e_prim = parse_e_prim();
        %sprintf('add %d %d', res_e_prim, res_t)
        result = res_e_prim + res_t;
    elseif(match('-'))
        res_t = parse_t();
        res_e_prim = parse_e_prim();
        result = res_e_prim - res_t;
    else
        result = 0;
    end
end
function result = parse_t()
    res_p = parse_p();
    res_t_prim = parse_t_prim();
    result = res_p * res_t_prim;
    %sprintf('res_p = %d, res_t_prim = %d', res_p, res_t_prim)
end

function result = parse_t_prim()
    if(match('*'))
        res_p = parse_p();
        res_t_prim = parse_t_prim();
        result = res_t_prim * res_p;
    elseif(match('/'))
        res_p = parse_p();
        res_t_prim = parse_t_prim();
        result = res_t_prim / res_p;
        %sprintf('res_p = %d, res_t_prim = %d', res_p, res_t_prim)
    else
        result = 1;
    end
end

function result = parse_p()
    base = parse_a();
    if(match('^'))
        pow = parse_a();
        result = base ^ pow;
    else
        result = base;
    end
end

function result = parse_a()
    if(match('('))
        result = parse_e();
        if(~match(')'))
            sprintf('error in the input. no matched close parentheses.')
        end
    elseif (match_identifier())
        result = 0;
        name = char(get_token());
        sprintf('identifier found: %s', name)
    elseif (match_number())
        num = str2num(char(get_token()));
        result = num;
        sprintf('number found: %d', num)
    else
        result = 0;
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


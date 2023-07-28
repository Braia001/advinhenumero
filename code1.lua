function abertura_do_jogo()
    print("Bem Vindo ao jogo Advinhe o Numero\
    Este jogo foi criado pelo Brayan\
    Como forma de ensinar lua para a galera do Yotube\
    \n A licença deste software é a GPL3.0")
end

function manual()
    print("Voce deseja ler o manual do jogo (sim ou não)?")
        local resposta = io.read()
        if resposta == "sim" then
            print("Este é um jogo de advinhação onde o computador irá\
            escolher um número aleatório, que o jogador precisará\
            descobrir por simples processo de tentativas e erro.")
        end
    end

function cria_numero_aleatorio()
    seed = os.clock()*10000000
    math.randomseed(seed)
    return math.random(1,100)
end

function captura_palpite()
    while true do
        print("\nDigite um palpite : ")
        palpite = io.read()
        if type(tonumber (palpite)) == "number" then
            palpite = tonumber(palpite)
            if palpite > 100 or palpite < 1 then
                print("seu palpite foi invalido, use um numero entre 1 e 100")
            else
                return palpite
            end
        else
            print("Por favor, digite um numero válido.")
        end
    end
end

function compara_com_palpite(num_do_computador, palpite)
    if num_do_computador == palpite then
        return true
    else
        if num_do_computador < palpite then variacao = "maior" else 
            print("Não, este não é o número que eu estava pensando: (")
            print("O Número que voce disse é "..variacao.."que o que eu estava pensado.")
            return false
    end
end

function imprime_interacao(numero, resultado_da_tentativa)
    if resultado_da_tentativa then
        print("Parabens! Eu realmente estava pensando no numero"..numero)
    else
        print("Nao, nao e este numero que eu estava pensando: (")
        print("que tal tentar novamente?")
    end
    return not resultado_da_tentativa
end

function partida(numero_secreto)
    palpite = captura_palpite()
    return imprime_interacao(numero_secreto, compara_com_palpite(numero_secreto, palpite))
end

function loop_principal()
    numero_secreto = cria_numero_aleatorio()
    --print(numero_secreto) // mostra o resultado
    continua_jogando = true
    while continua_jogando do
        continua_jogando = partida(numero_secreto)
    end
end

function jogo()
    repete_o_jogo = true
    repeat
        loop_principal()
        print("Deseja jogar novamente(sim ou nao)?")
        resposta = io.read()
        if resposta == "nao" then
            repete_o_jogo = false
        end
    until not repete_o_jogo
end

abertura_do_jogo()
manual()
jogo()

end


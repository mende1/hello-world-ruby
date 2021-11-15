# 1. Escreva um programa que imprima todos os números pares
# entre 2 e 50. Para saber se o número é par, basta você ver se o
# resto da divisão do número por 2 é igual a 0.

def pares_2_a_50
    ans = []
    for val in 2..50
        ans << val if val % 2 == 0
    end
    puts "\nTodos os números pares entre 2 e 50:\n#{ans}\n\n"
end


# 2. Escreva um programa que imprima a soma de todos os
# números de 1 até 100. Ou seja, ele calculará o resultado de
# 1+2+3+4+...+100 .

def soma_ate_100
    sum = 0
    for i in 1..100
        sum += i
    end
    puts "\nA soma de todos os números de 1 até 100 é:    #{sum}"
    puts
end


# 3. Escreva um programa que peça um inteiro ao usuário, e com
# esse inteiro, ele imprima, linha a linha, a tabuada daquele
# número até o 10. Por exemplo, se ele escolher o número 2, o
# programa imprimirá:
#  2x1=2, 2x2=4, 2x3=6, ...,
# 2x10=20 .

def tabuada
    puts "\nEscolha um número para ver sua tabuada: "
    num = gets.to_i

    puts
    for val in 1..10
        res = val * num
        puts "#{num} * #{val} = #{res}"
    end
    puts
end


# 4. Implemente uma calculadora. O programa deve pedir 3
# números ao usuário, a , b e operacao . Se operacao for
# igual 1, você deverá imprimir a soma de a + b . Se ela for
# 2, a subtração. Se for 3, a multiplicação. Se for 4, a divisão.

def calculadora
    puts "\nPrimeiro número: "
    a = gets.to_i

    puts "\nSegundo número: "
    b = gets.to_i

    puts "\nEscolha a operação: "
    puts "(1) Soma  (2) Subtração   (3) Multiplicação   (4) Divisão"
    op = gets.to_i

    puts

    case op
    when 1
        res = a + b
        puts "#{a} + #{b} = #{res}"
    when 2
        res = a - b
        puts "#{a} - #{b} = #{res}"
    when 3
        res = a * b
        puts "#{a} * #{b} = #{res}"
    when 4
        res = a / b.to_f
        puts "#{a} / #{b} = #{res}"
    end

    puts
end


# 5. Escreva um programa que peça um número inteiro ao
# usuário e imprima o fatorial desse número. Para calcular o
# fatorial, basta ir multiplicando pelos números anteriores até
# 1. Por exemplo, o fatorial de 4 é 4 * 3 * 2 * 1 , que é
# igual a 24.

def recursive_fatorial (num)
    return num if num == 1
    
    num * recursive_fatorial(num-1)
end


def fatorial
    puts "\nEscolha um número para ver seu fatorial: "
    num = gets.to_i
    puts

    fat = recursive_fatorial num
    puts "O fatorial de #{num.to_s} é:   #{fat.to_s}"
    puts
end


def escolhe_programa
    puts "\nEscolha o programa: "
    puts "(1) Pares de 2 até 50"
    puts "(2) Soma de 1 até 100"
    puts "(3) Tabuada de um número"
    puts "(4) Calculadora"
    puts "(5) Fatorial de um número"
    puts "(6) Sair"
    
    prog = gets.to_i
end


# Main

loop do
    prog = escolhe_programa
    case prog
        when 1
            pares_2_a_50
        when 2
            soma_ate_100
        when 3
            tabuada
        when 4
            calculadora
        when 5
            fatorial
        else break
    end
end

puts

# #1 - Karate Framework - Introduction & Setup Installation
# https://www.youtube.com/watch?v=xzq6JJZ0Oj8&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb

Feature: print hello world feature

Scenario: Hello World scenario

    * print ' Hello, world!'

Scenario: declare and print variables

    * def balance = 200
    * def fee = 20
    * def tax = 10
    # Aqui vai concatenar os dados:
    * print 'total amount ->' + balance + fee + tax
    # Aqui vai somar os dados:
    * print 'total amount ->' + (balance + fee + tax)


Scenario: calculator scenario

    * def a = 200
    * def b = 20
    * print 'mul -> ' + (a * b)
    
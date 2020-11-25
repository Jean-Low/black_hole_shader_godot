Para abrir o projeto com o shader no godot, eh nescessario baixar e abrir o godot 3

Ele pode ser baixado de graca pela steam ou pelo site deles.

E intao abrir a pasta do projeto no gerenciador de projetos do godot, e depois clicar em editar (Nao em Play, eh melhor para visualizar o projeto brincando no editor)

Caso ao abrir o projeto a cena esteja um quadrado em 2d, eh nescessario clicar no arquivo black_hole.tscn dentro da pasta black_hole para abrir a cena correta do projeto

----

O shader esta colocado em uma mesh esferica chamada "BlackHole". O cenario do Godot com os gizmos indicando as posicoes eh muito bom para ver a deformacao causada pelo shader

Ao clicar nele, eh possivel ver no inspector, dentro de Geometry, o material, clicar nele abre o material no qual o shader esta colocado, e la eh possivel acessar 2 parametros do shader, strenght e core size.
os melhores valores que encontramos sao 0.75 para core size e 1.27 para strenght

O shader em si esta dentro da pasta black_hole. eh possivel ver e editar o codigo clicando nele no FileSystem

----

O shader foi inicialmente projetado em shadergraph no unity e entao convertemos a logica para a syntax de GLSL (ou ao menos a versao de gedot que eh bem parecida)

nesse processo deixamos a logica ainda mais simplificada e otimizada. A parte mais complicada do projeto foi descobrir uma forma de mapear o que esta atraz da mesh nela, como 
se fosse um shader transparente, para entao aplicar a distorcao. Usamos isso com uma tecnica usando uma funcao que pega a cor do pixel UV de uma textura e passando a propria textura da camera como parametro.

E o efeito nao eh totalmente preciso comparado a um Black Hole de verdade, mas eh uma aproximacao boa o bastante para ser usada como efeito especial em um joog ou filme e todos conseguiriam identificar.





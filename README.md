# Aplicação Web - EMAE

Olá equipa da EMAE! Este é o documento que apresenta uma primeira visão sobre o que será a melhor aplicação web para recolher os dados relativos às medidas.

<br>

## Intervenientes
No contexto desta web app, existem 2 tipos de utilizadores:

- **Professores**: estes utilizadores apenas preenchem os campos das medidas das turmas que lecionam. Para além desta interação, podem autenticar-se na aplicação e ver avisos acerca de dados que lhe faltam preencher. 

- **Administradores**: membros da equipa de trabalho, que têm controlo total sobre a aplicação. Criam as turmas, com os alunos e disciplinas associadas. Podem também ver os dados preenchidos pelos professores e aceder a várias estatísticas sobre os dados recolhidos.

<br>

## User Stories

User stories são descrições simples de uma funcionalidade espectável da aplicação, contada do ponto de vista de um utilizador da aplicação. 

### Professores
- **US01**: Como professor, quero autenticar-me na aplicação.
- **US02**: Como professor, quero preencher os campos das medidas das turmas que leciono com os dados que recolhi.
- **US03**: Como professor, que poder editar os dados que inseri previamente.
- **US04**: Como professor, quero ser informado dos meus alunos que ainda não têm as medidas preenchidas.
- **US05**: Como professor, quero ter uma página de ajuda para saber como utilizar a aplicação.

<br>

### Administradores

- **US11**: Como administrador, quero autenticar-me na aplicação.
- **US12**: Como administrador, quero criar turmas.
- **US13**: Como administrador, quero especificar detalhes de cada turma, como o agrupamento a que pertencem.
- **US14**: Como administrador, quero associar alunos às turmas.
- **US15**: Como administrador, quero associar disciplinas às turmas.
- **US16**: Como administrador, quero conseguir agrupar os dados por ano letivo.
- **US17**: Como administrador, quero criar, modificar e eliminar contas para os professores.
- **US18**: Como administrador, quero modificar os dados de turmas, alunos e disciplinas.
- **US19**: Como administrador, quero definir os valores que os professores podem atribuir à eficácia das medida.
- **US20**: Como administrador, quero ter acesso às estatísticas das disciplinas.
- **US21**: Como administrador, quero ter acesso às estatísticas dos alunos.
- **US22**: Como administrador, quero ter acesso às estatísticas das medidas.
- **US23**: Como administrador, quero ter acesso às estatísticas das escolas.
- **US24**: Como administrador, quero ter acesso às estatísticas dos agrupamentos.
- **US25**: Como administrador, quero ter acesso às estatísticas dos anos escolar.
- **US26**: Como administrador, quero experimentar a visão do professor para verificar se os dados estão corretos.
- **US27**: Como administrador, quero preencher os dados dos meus alunos.

<br>

## Mockups

Os mockups são representações visuais de como será a aplicação. Estes são apenas uma primeira versão e, muito provavelmente, sofrerão alterações ao longo do desenvolvimento, considerando o vosso feedback.

![Autenticação](./mockups/AuthPage.png)
<p align="center">Figura 1 - Página de autenticação</p>

---

![FAQs](./mockups/FAQPage.png)
<p align="center">Figura 2 - Página de FAQs</p>

---

![Contactos](./mockups/ContactsPage.png)
<p align="center">Figura 3 - Página de contactos</p>

---

![Página Inicial Professor 1](./mockups/HomePage-Professor%20normal%201.png)
<p align="center">Figura 4 - Página inicial de um professor</p>

---

![Página Inicial Professor 2](./mockups/HomePage-Professor%20normal%202.png)
<p align="center">Figura 5 - Página inicial de um professor</p>

---

![Página Inicial Professor 3](./mockups/HomePage-Professor%20normal%203.png)
<p align="center">Figura 6 - Página inicial de um professor</p>

---

![Página Inicial Professor 4](./mockups/HomePage-Professor%20normal%204.png)
<p align="center">Figura 7 - Página inicial de um professor</p>

---

![Página Inicial Administrador 1](./mockups/Admin%20Dashboard.png)
<p align="center">Figura 8 - Página inicial de um administrador</p>

---

![Gestão de Agrupamentos 1](./mockups/Gestão%20Agrupamentos%201.png)
<p align="center">Figura 9 - Página de gestão de agrupamentos</p>

---

![Gestão de Agrupamentos 2](./mockups/Gestão%20Agrupamentos%202.png)
<p align="center">Figura 10 - Página de gestão de agrupamentos</p>

---

![Gestão de Agrupamentos 3](./mockups/Gestão%20Agrupamentos%203.png)
<p align="center">Figura 11 - Página de gestão de agrupamentos</p>

---

![Gestão de Agrupamentos 4](./mockups/Gestão%20Agrupamentos%204.png)
<p align="center">Figura 12 - Página de gestão de agrupamentos</p>

---

![Gestão de Turmas 1](./mockups/Gestão%20Turmas%201.png)
<p align="center">Figura 13 - Página de gestão de turmas</p>

---

![Gestão de Turmas 2](./mockups/Gestão%20Turmas%202.png)
<p align="center">Figura 14 - Página de gestão de turmas</p>

---

![Gestão de Turmas 3](./mockups/Gestão%20Turmas%203.png)
<p align="center">Figura 15 - Página de gestão de turmas</p>

---

![Estatisticas](./mockups/StatisticsPageBasicFilter.png) 
<p align="center">Figura 16 - Página de estatísticas</p>

---

![Estatisticas com escola aplicada](./mockups/StatisticsPageSchoolFilter.png)
<p align="center">Figura 17 - Página de estatísticas com escola aplicada</p>

---

![Estatisticas de uma medida](./mockups/StatisticsPageSpecificMeasure.png)
<p align="center">Figura 18 - Página de estatísticas de uma medida</p>

---

![Estatisticas com disciplina selecionada](./mockups/StatisticsPageSubjectFilter.png)
<p align="center">Figura 19 - Página de estatísticas com disciplina selecionada</p>

---

![Estatisticas com turma selecionada](./mockups/StatisticsPageClassFilter.png)
<p align="center">Figura 20 - Página de estatísticas com turma selecionada</p>

---

![Estatisticas de uma turma](./mockups/StatisticsPageSubjectFilter.png)
<p align="center">Figura 21 - Página de estatísticas de uma turma</p>

---

![Estatisticas os alunos de uma turma](./mockups/StatisticsPageStudentFilter.png)
<p align="center">Figura 22 - Página de estatísticas dos alunos de uma turma</p>

---

<br>

## Base de Dados

Esta será a estrutura da base de dados. Embora seja algo mais técnico, dá para dar-vos uma ideia dos objetos que farão parte da aplicação, bem como das relações entre eles. 

Um traço entre duas caixas significa que existe uma relação entre os objetos que representam e os números em cada extremidade do traço indicam o número de objetos de cada tipo que podem estar relacionados.

![Esquema da base de dados](./imagens/database_uml.png)
<p align="center">Figura 23 - Esquema da base de dados</p>


Como ler um relação entre caixas:

![Ajuda com uml](./imagens/ajudaa_uml.png)

Neste exemplo, existe uma relação entre Escola e AnoLetivo. Uma escolha pode pertencer a um ou vários anos letivos (1..\*), e um ano letivo pode conter uma ou várias escolas (1..\*).

Para além disso, a Escola também está relacionada com o Agrupamento. Neste caso, uma escola pertence a zero ou a um agrupamento (0..1), mas um agrupamento pode conter uma ou várias escolas (1..\*).

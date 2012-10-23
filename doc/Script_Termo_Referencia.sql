create table COMPONENTE  (
   ID_COMPONENTE        NUMBER(19)                      not null,
   TX_COMPONENTE        VARCHAR2(500)                   not null,
   ID_TIPO_COMPONENTE   NUMBER(19)                      not null,
   ID_COMPONENTE_PAI    NUMBER(19),
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table COMPONENTE is
'Entidade responsável por armazenar os componentes da tela.  Ex.: O componente do tipo Tabela possui propriedades, como um Label e a condição de obrigatoriedade; O componente do tipo ComboBox possui propriedades, como o Label , e eventos, como de carregar a lista.';

comment on column COMPONENTE.ID_COMPONENTE is
'Identificador único da tabela Componente.';

comment on column COMPONENTE.TX_COMPONENTE is
'Nome do Componente.';

comment on column COMPONENTE.ID_TIPO_COMPONENTE is
'Identificador da entidade Tipo_Componente que realizará o relacionamento entre as entidades Componente e Tipo_Componente.';

comment on column COMPONENTE.ID_COMPONENTE_PAI is
'Identificador da entidade Componente que realizará o auto-relacionamento. Indica se o componente é filho de outro componente na tela.';

comment on column COMPONENTE.DT_CADASTRO is
'Data de Cadastro';

comment on column COMPONENTE.FL_ATIVO is
'Flag que indica se o Componente está ativo: 0- Inativo e 1- Ativo.';

alter table COMPONENTE
   add constraint PK_COMPONENTE primary key (ID_COMPONENTE);

create table EVENTO  (
   ID_EVENTO            NUMBER(19)                      not null,
   TX_EVENTO            VARCHAR2(500)                   not null,
   ID_COMPONENTE        NUMBER(19),
   ID_TIPO_EVENTO       NUMBER(19),
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table EVENTO is
'Entidade responsável por armazenar os Eventos. Um exemplo de evento seria o carregamento da lista de um ComboBox e  um outro seria a de alterar a visibilidade de um componente, etc.';

comment on column EVENTO.ID_EVENTO is
'Identificador único da entidade Evento.';

comment on column EVENTO.TX_EVENTO is
'Texto do Evento.';

comment on column EVENTO.ID_COMPONENTE is
'Identificador da entidade Componente que realizará o relacionamento entre as entidades Componente e Evento.';

comment on column EVENTO.ID_TIPO_EVENTO is
'Identificador da entidade Tipo_Evento que realizará o relacionamento entre as entidades Tipo_Evento  e Evento.';

comment on column EVENTO.DT_CADASTRO is
'Data de Cadastro';

comment on column EVENTO.FL_ATIVO is
'Flag que indica se o Evento está ativo: 0- Inativo e 1- Ativo.';

alter table EVENTO
   add constraint PK_EVENTO primary key (ID_EVENTO);

create table MBPU_TB_DOCUMENTO_TIPO  (
   ID                   NUMBER(19),
   constraint AK_PK_ID_MBPU_TB_ unique ()
);

create table PROPRIEDADE_EVENTO  (
   ID_PROPRIEDADE_EVENTO NUMBER(19)                      not null,
   TX_PROPRIEDADE_EVENTO VARCHAR2(500)                   not null,
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table PROPRIEDADE_EVENTO is
'Entidade responsável por armazenar as Propriedades de um Evento. Como exemplo temos a propriedade  isVisible, que indica a visibilidade do componente que será afetado pelo evento.';

comment on column PROPRIEDADE_EVENTO.ID_PROPRIEDADE_EVENTO is
'Identificador único da entidade Propriedade_Evento.';

comment on column PROPRIEDADE_EVENTO.TX_PROPRIEDADE_EVENTO is
'Texto com a descrição da Propriedade.';

comment on column PROPRIEDADE_EVENTO.DT_CADASTRO is
'Data de Cadastro.';

comment on column PROPRIEDADE_EVENTO.FL_ATIVO is
'Flag que indica se a Propriedade do Evento está ativo: 0- Inativo e 1- Ativo.';

alter table PROPRIEDADE_EVENTO
   add constraint PK_PROPRIEDADE_EVENTO primary key (ID_PROPRIEDADE_EVENTO);

create unique index UI_PROPRIEDADE_EVENTO on PROPRIEDADE_EVENTO (
   TX_PROPRIEDADE_EVENTO ASC
);

create table PROPRIEDADE_RESPOSTA  (
   ID_PROPRIEDADE_RESPOSTA NUMBER(19)                      not null,
   TX_PROPRIEDADE_RESPOSTA VARCHAR2(1000)                  not null,
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table PROPRIEDADE_RESPOSTA is
'Entidade responsável por armazenar as propriedades de uma determinada resposta. Como um componente pode ter múltiplas respostas, a propriedade será utilizada para diferenciá-las. Como exemplo, temos as respostas de uma tabela que possui n linhas sendo a propriedade utilizada para determinar a ordem dessas linhas.';

comment on column PROPRIEDADE_RESPOSTA.ID_PROPRIEDADE_RESPOSTA is
'Identificador único da entidade Propriedade_Resposta.';

comment on column PROPRIEDADE_RESPOSTA.TX_PROPRIEDADE_RESPOSTA is
'Texto com a Propriedade da Resposta.';

comment on column PROPRIEDADE_RESPOSTA.DT_CADASTRO is
'Data de Cadastro.';

comment on column PROPRIEDADE_RESPOSTA.FL_ATIVO is
'Flag que indica se a Propriedade da Resposta está ativa: 0- Inativo e 1- Ativo.';

alter table PROPRIEDADE_RESPOSTA
   add constraint PK_PROPRIEDADE_RESPOSTA primary key (ID_PROPRIEDADE_RESPOSTA);

create unique index UI_PROPRIEDADE_RESPOSTA on PROPRIEDADE_RESPOSTA (
   TX_PROPRIEDADE_RESPOSTA ASC
);

create table REGEX  (
   NM_REGEX             VARCHAR2(500)                   not null,
   VL_REGEX             VARCHAR2(500)                   not null
);

comment on table REGEX is
'Entidade responsável por armazenar os REGEX.
Os REGEX são expressões regulares utilizadas para a validação de campos que serão preenchidos pelo usuário. Como por exemplo, temos a validação de um CPF e CNPJ. 
A REGEX é também utilizada para a formatação desses campos, ao ser inserido os números de um documento, o campo será formatado automaticamente, inserindo os pontos e traços.
';

comment on column REGEX.NM_REGEX is
'Nome do REGEX e identificador da tabela.';

comment on column REGEX.VL_REGEX is
'Valor do REGEX.';

alter table REGEX
   add constraint PK_REGEX primary key (NM_REGEX);

create table RESPOSTA_COMPONENTE  (
   ID_RESPOSTA_COMPONENTE NUMBER(19)                      not null,
   TX_RESPOSTA_COMPONENTE VARCHAR2(500)                   not null,
   ID_COMPONENTE        NUMBER(19)                      not null,
   ID_TR_DOC_ORIENTACAO_BASICA NUMBER(19),
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table RESPOSTA_COMPONENTE is
'Entidade responsável por armazenar as respostas que um Componente pode ter. Ex.: O Componente TextInput  pode ter como resposta qualquer texto alfanumérico; O componente CheckBox e RadioButton podem ter como resposta valores Booleanos.';

comment on column RESPOSTA_COMPONENTE.ID_RESPOSTA_COMPONENTE is
'Identificador único da entidade Resposta_Componente.';

comment on column RESPOSTA_COMPONENTE.TX_RESPOSTA_COMPONENTE is
'Texto com a Resposta do Componente.';

comment on column RESPOSTA_COMPONENTE.ID_COMPONENTE is
'Identificador da entidade Componente que realizará o relacionamento entre as entidades Componente e Valor_Componente.';

comment on column RESPOSTA_COMPONENTE.ID_TR_DOC_ORIENTACAO_BASICA is
'Identificador da entidade tr_doc_orientacao_basica que realizará o relacionamento entre as entidades tr_doc_orientacao_basica e Resposta_Componente.';

comment on column RESPOSTA_COMPONENTE.DT_CADASTRO is
'Data de Cadastro.';

comment on column RESPOSTA_COMPONENTE.FL_ATIVO is
'Flag que indica se a Resposta do Componente está ativo: 0- Inativo e 1- Ativo.';

alter table RESPOSTA_COMPONENTE
   add constraint PK_RESPOSTA_COMPONENTE primary key (ID_RESPOSTA_COMPONENTE);

create table TERMO_REFERENCIA  (
   ID_TERMO_REFERENCIA  NUMBER(19)                      not null,
   ID_COMPONENTE        NUMBER(19),
   TX_TERMO_REFERENCIA  VARCHAR2(1000)                  not null,
   ID_DOCUMENTO_TIPO    NUMBER(19),
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table TERMO_REFERENCIA is
'Entidade responsável por armazenar o relacionamento de um componente termo de referência com um tipo de documento da entrada única.';

comment on column TERMO_REFERENCIA.ID_TERMO_REFERENCIA is
'Identificador único da entidade Termo_Referencia.';

comment on column TERMO_REFERENCIA.ID_COMPONENTE is
'Identificador único da tabela Componente.';

comment on column TERMO_REFERENCIA.TX_TERMO_REFERENCIA is
'Nome do Termo de Referencia.';

comment on column TERMO_REFERENCIA.ID_DOCUMENTO_TIPO is
'Identificador da entidade tb_documento_tipo (MBPU) que realizará o relacionamento entre as entidades tb_documento_tipo e Termo_Referencia.';

comment on column TERMO_REFERENCIA.DT_CADASTRO is
'Data de Cadastro.';

comment on column TERMO_REFERENCIA.FL_ATIVO is
'Flag que indica se o termo de referência está ativo: 0- Inativo e 1- Ativo.';

alter table TERMO_REFERENCIA
   add constraint PK_TERMO_REFERENCIA primary key (ID_TERMO_REFERENCIA);

create table TIPO_COMPONENTE  (
   ID_TIPO_COMPONENTE   NUMBER(19)                      not null,
   TX_TIPO_COMPONENTE   VARCHAR2(500)                   not null,
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table TIPO_COMPONENTE is
'Entidade responsável por armazenar os Tipos de Componentes de uma Tela. Ex.: Tabelas, Campo de Texto, Formulários, ComboBox, RadioButton, etc.';

comment on column TIPO_COMPONENTE.ID_TIPO_COMPONENTE is
'Identificador único da entidade Tipo_Componente.';

comment on column TIPO_COMPONENTE.TX_TIPO_COMPONENTE is
'Nome do Tipo de Componente.';

comment on column TIPO_COMPONENTE.DT_CADASTRO is
'Data de Cadastro.';

comment on column TIPO_COMPONENTE.FL_ATIVO is
'Flag que indica se o Tipo_Componente está ativo: 0- Inativo e 1- Ativo.';

alter table TIPO_COMPONENTE
   add constraint PK_TIPO_COMPONENTE primary key (ID_TIPO_COMPONENTE);

create unique index UI_TIPO_COMPONENTE on TIPO_COMPONENTE (
   TX_TIPO_COMPONENTE ASC
);

create table TIPO_EVENTO  (
   ID_TIPO_EVENTO       NUMBER(19)                      not null,
   TX_TIPO_EVENTO       VARCHAR2(500)                   not null,
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table TIPO_EVENTO is
'Entidade responsável por armazenar  os Tipos de Eventos, podendo ser: Validador ou Evento.';

comment on column TIPO_EVENTO.ID_TIPO_EVENTO is
'Identificador único da entidade Tipo_evento.';

comment on column TIPO_EVENTO.TX_TIPO_EVENTO is
'Texto que contém o Tipo do Evento.';

comment on column TIPO_EVENTO.DT_CADASTRO is
'Data de Cadastro.';

comment on column TIPO_EVENTO.FL_ATIVO is
'Flag que indica se o Tipo do Evento está ativo: 0- Inativo e 1- Ativo.';

alter table TIPO_EVENTO
   add constraint PK_TIPO_EVENTO primary key (ID_TIPO_EVENTO);

create unique index UI_TIPO_EVENTO on TIPO_EVENTO (
   TX_TIPO_EVENTO ASC
);

create table TIPO_PROPRIEDADE  (
   ID_TIPO_PROPRIEDADE  NUMBER(19)                      not null,
   TX_TIPO_PROPRIEDADE  VARCHAR2(500)                   not null,
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table TIPO_PROPRIEDADE is
'Entidade responsável por armazenar os Tipos de Propriedade. Ex.: Label, Order, etc.';

comment on column TIPO_PROPRIEDADE.ID_TIPO_PROPRIEDADE is
'Identificador único da entidade Tipo_Propriedade.';

comment on column TIPO_PROPRIEDADE.TX_TIPO_PROPRIEDADE is
'Nome do Tipo da Propriedade.';

comment on column TIPO_PROPRIEDADE.DT_CADASTRO is
'Data de Cadastro.';

comment on column TIPO_PROPRIEDADE.FL_ATIVO is
'Flag que indica se o Tipo da Propriedade  está ativo: 0- Inativo e 1- Ativo.';

alter table TIPO_PROPRIEDADE
   add constraint PK_TIPO_PROPRIEDADE primary key (ID_TIPO_PROPRIEDADE);

create unique index UI_TIPO_PROPRIEDADE on TIPO_PROPRIEDADE (
   TX_TIPO_PROPRIEDADE ASC
);

create table TR_DOC_ORIENTACAO_BASICA  (
   ID_TR_DOC_ORIENTACAO_BASICA NUMBER(19)                      not null,
   ID_TERMO_REFERENCIA  NUMBER(19),
   ID_CARACTERIZACAO    NUMBER(19),
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table TR_DOC_ORIENTACAO_BASICA is
'Entidade responsável por armazenar o relacionamento entre o Termo de Referência e um documento de uma Orientação Básica. Tem a finalidade de ligar uma resposta de um componente de um Termo de Referência com um documento da orientação básica.';

comment on column TR_DOC_ORIENTACAO_BASICA.ID_TR_DOC_ORIENTACAO_BASICA is
'Identificador único da entidade tr_doc_orientacao_basica.';

comment on column TR_DOC_ORIENTACAO_BASICA.ID_TERMO_REFERENCIA is
'Identificador único da entidade Termo_Referencia.';

comment on column TR_DOC_ORIENTACAO_BASICA.DT_CADASTRO is
'Data de Cadastro.';

comment on column TR_DOC_ORIENTACAO_BASICA.FL_ATIVO is
'Flag que indica se o registro está ativo: 0- Inativo e 1- Ativo.';

alter table TR_DOC_ORIENTACAO_BASICA
   add constraint PK_TR_DOC_ORIENTACAO_BASICA primary key (ID_TR_DOC_ORIENTACAO_BASICA);

create table VALOR_EVENTO  (
   ID_VALOR_EVENTO      NUMBER(19)                      not null,
   TX_VALOR_EVENTO      VARCHAR2(500)                   not null,
   ID_EVENTO            NUMBER(19),
   ID_PROPRIEDADE_EVENTO NUMBER(19),
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table VALOR_EVENTO is
'Entidade responsável por armazenar os valores da propriedade do evento. Como exemplo, tem o valor da propriedade Target, que será o nome do componente que será afetado pelo evento.';

comment on column VALOR_EVENTO.ID_VALOR_EVENTO is
'Identificador único da entidade Valor_Evento.';

comment on column VALOR_EVENTO.TX_VALOR_EVENTO is
'Texto que contém o Valor do Evento.';

comment on column VALOR_EVENTO.ID_EVENTO is
'Identificador da entidade Evento que realizará o relacionamento entre as entidades Evento e Valor_Evento.';

comment on column VALOR_EVENTO.ID_PROPRIEDADE_EVENTO is
'Identificador da entidade Propriedade_Evento que realizará o relacionamento entre as entidades Propriedade_Evento  e Valor_Evento.';

comment on column VALOR_EVENTO.DT_CADASTRO is
'Data de Cadastro';

comment on column VALOR_EVENTO.FL_ATIVO is
'Flag que indica se o Valor do Evento está ativo: 0- Inativo e 1- Ativo.';

alter table VALOR_EVENTO
   add constraint PK_VALOR_EVENTO primary key (ID_VALOR_EVENTO);

create table VALOR_PROPRIEDADE  (
   ID_VALOR_PROPRIEDADE NUMBER(19)                      not null,
   TX_VALOR_PROPRIEDADE VARCHAR2(500)                   not null,
   ID_TIPO_PROPRIEDADE  NUMBER(19),
   ID_COMPONENTE        NUMBER(19),
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table VALOR_PROPRIEDADE is
'Entidade responsável por armazenar os Valores que uma Propriedade pode ter. Ex.: O Tipo de Propridade Label pode conter o seguinte valor: Identificação do Responsável pela área Ambiental; O tipo de propriedade Ordem pode conter valores numéricos.';

comment on column VALOR_PROPRIEDADE.ID_VALOR_PROPRIEDADE is
'Identificador único da entidade Valor_Propriedade.';

comment on column VALOR_PROPRIEDADE.TX_VALOR_PROPRIEDADE is
'Texto com o Valor da Propriedade.';

comment on column VALOR_PROPRIEDADE.ID_TIPO_PROPRIEDADE is
'Identificador da entidade Tipo_Propriedade que realizará o relacionamento entre as entidades Valor_propriedade e Tipo_Propriedade .';

comment on column VALOR_PROPRIEDADE.ID_COMPONENTE is
'Identificador da entidade Componente que realizará o relacionamento entre as entidades Componente e Valor_Propriedade .';

comment on column VALOR_PROPRIEDADE.DT_CADASTRO is
'Data de Cadastro.';

comment on column VALOR_PROPRIEDADE.FL_ATIVO is
'Flag que indica se o Valor da Propriedade está ativo: 0- Inativo e 1- Ativo.';

alter table VALOR_PROPRIEDADE
   add constraint PK_VALOR_PROPRIEDADE primary key (ID_VALOR_PROPRIEDADE);

create table VALOR_PROPRIEDADE_RESPOSTA  (
   ID_VALOR_PROPRIEDADE_RESPOSTA NUMBER(19)                      not null,
   ID_PROPRIEDADE_RESPOSTA NUMBER(19),
   ID_RESPOSTA_COMPONENTE NUMBER(19),
   TX_VALOR_PROPRIEDADE_RESPOSTA VARCHAR2(1000)                  not null,
   DT_CADASTRO          DATE,
   FL_ATIVO             NUMBER(1)
);

comment on table VALOR_PROPRIEDADE_RESPOSTA is
'Entidade responsável por armazenar o valor da propriedade em si. Como exemplo, temos o valor da propriedade ordem (referente a resposta de uma linha de uma tabela) que pode conter valores numéricos (1, 2, 3, etc.).';

comment on column VALOR_PROPRIEDADE_RESPOSTA.ID_VALOR_PROPRIEDADE_RESPOSTA is
'Identificador único da entidade valor_propriedade_resposta.';

comment on column VALOR_PROPRIEDADE_RESPOSTA.ID_PROPRIEDADE_RESPOSTA is
'Identificador único da entidade Propriedade_Resposta.';

comment on column VALOR_PROPRIEDADE_RESPOSTA.ID_RESPOSTA_COMPONENTE is
'Identificador único da entidade Resposta_Componente.';

comment on column VALOR_PROPRIEDADE_RESPOSTA.TX_VALOR_PROPRIEDADE_RESPOSTA is
'Texto com o Valor da Propriedade da Resposta.';

comment on column VALOR_PROPRIEDADE_RESPOSTA.DT_CADASTRO is
'Data de Cadastro.';

comment on column VALOR_PROPRIEDADE_RESPOSTA.FL_ATIVO is
'Flag que indica se o Valor da Propriedade da Resposta está ativa: 0- Inativo e 1- Ativo.';

alter table VALOR_PROPRIEDADE_RESPOSTA
   add constraint PK_VALOR_PROPRIEDADE_RESPOSTA primary key (ID_VALOR_PROPRIEDADE_RESPOSTA);

alter table COMPONENTE
   add constraint FK_C_ID_COMPONENTE foreign key (ID_COMPONENTE_PAI)
      references COMPONENTE (ID_COMPONENTE);

alter table COMPONENTE
   add constraint FK_C_ID_TIPO_COMPONENTE foreign key (ID_TIPO_COMPONENTE)
      references TIPO_COMPONENTE (ID_TIPO_COMPONENTE);

alter table EVENTO
   add constraint FK_E_ID_COMPONENTE foreign key (ID_COMPONENTE)
      references COMPONENTE (ID_COMPONENTE);

alter table EVENTO
   add constraint FK_E_ID_TIPO_EVENTO foreign key (ID_TIPO_EVENTO)
      references TIPO_EVENTO (ID_TIPO_EVENTO);

alter table RESPOSTA_COMPONENTE
   add constraint FK_RC_ID_COMPONENTE foreign key (ID_COMPONENTE)
      references COMPONENTE (ID_COMPONENTE);

alter table RESPOSTA_COMPONENTE
   add constraint FK_RC_TR_DOC_ORI_BASICA foreign key (ID_TR_DOC_ORIENTACAO_BASICA)
      references TR_DOC_ORIENTACAO_BASICA (ID_TR_DOC_ORIENTACAO_BASICA);

alter table TERMO_REFERENCIA
   add constraint FK_TR_COMPONENTE foreign key (ID_COMPONENTE)
      references COMPONENTE (ID_COMPONENTE);

alter table TERMO_REFERENCIA
   add constraint FK_TR_TB_DOC_TIPO foreign key (ID_DOCUMENTO_TIPO)
      references MBPU_TB_DOCUMENTO_TIPO (ID);

alter table TR_DOC_ORIENTACAO_BASICA
   add constraint FK_TDOB_TERMO_REFERENCIA foreign key (ID_TERMO_REFERENCIA)
      references TERMO_REFERENCIA (ID_TERMO_REFERENCIA);

alter table VALOR_EVENTO
   add constraint FK_VE_ID_EVENTO foreign key (ID_EVENTO)
      references EVENTO (ID_EVENTO);

alter table VALOR_EVENTO
   add constraint FK_VE_ID_PROPRIEDADE_EVENTO foreign key (ID_PROPRIEDADE_EVENTO)
      references PROPRIEDADE_EVENTO (ID_PROPRIEDADE_EVENTO);

alter table VALOR_PROPRIEDADE
   add constraint FK_VP_ID_COMPONENTE foreign key (ID_COMPONENTE)
      references COMPONENTE (ID_COMPONENTE);

alter table VALOR_PROPRIEDADE
   add constraint FK_VP_ID_TIPO_PROPRIEDADE foreign key (ID_TIPO_PROPRIEDADE)
      references TIPO_PROPRIEDADE (ID_TIPO_PROPRIEDADE);

alter table VALOR_PROPRIEDADE_RESPOSTA
   add constraint FK_VPR_PROPRIEDADE_RESPOSTA foreign key (ID_PROPRIEDADE_RESPOSTA)
      references PROPRIEDADE_RESPOSTA (ID_PROPRIEDADE_RESPOSTA);

alter table VALOR_PROPRIEDADE_RESPOSTA
   add constraint FK_VPR_RESPOSTA_COMPONENTE foreign key (ID_RESPOSTA_COMPONENTE)
      references RESPOSTA_COMPONENTE (ID_RESPOSTA_COMPONENTE);


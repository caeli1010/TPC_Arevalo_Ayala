/*
 Navicat Premium Data Transfer

 Source Server         : UTN
 Source Server Type    : SQL Server
 Source Server Version : 15002080
 Source Host           : CAS1\SQLEXPRESS:1433
 Source Catalog        : AREVALO_AYALA_DB
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002080
 File Encoding         : 65001

 Date: 07/07/2021 00:41:12
*/


-- ----------------------------
-- Table structure for CONVENIOS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[CONVENIOS]') AND type IN ('U'))
	DROP TABLE [dbo].[CONVENIOS]
GO

CREATE TABLE [dbo].[CONVENIOS] (
  [IDCONVENIO] int  IDENTITY(1,1) NOT NULL,
  [NOMBRE] varchar(255) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [OBSERVACIONES] varchar(255) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [ESTADO] bit  NULL
)
GO

ALTER TABLE [dbo].[CONVENIOS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of CONVENIOS
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CONVENIOS] ON
GO

SET IDENTITY_INSERT [dbo].[CONVENIOS] OFF
GO


-- ----------------------------
-- Table structure for DIAS_Y_HORARIOS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DIAS_Y_HORARIOS]') AND type IN ('U'))
	DROP TABLE [dbo].[DIAS_Y_HORARIOS]
GO

CREATE TABLE [dbo].[DIAS_Y_HORARIOS] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [DURACION] int  NOT NULL,
  [IDMEDICO] bigint  NOT NULL,
  [IDDIAS] tinyint  NOT NULL,
  [HORAS] smallint  NOT NULL,
  [ESTADO] bit  NULL
)
GO

ALTER TABLE [dbo].[DIAS_Y_HORARIOS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of DIAS_Y_HORARIOS
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DIAS_Y_HORARIOS] ON
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'1', N'20', N'1', N'1', N'2', N'1')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'3', N'25', N'4', N'2', N'4', N'1')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'4', N'25', N'4', N'3', N'4', N'1')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'5', N'25', N'4', N'4', N'4', N'0')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'6', N'25', N'4', N'5', N'4', N'1')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'7', N'15', N'10', N'1', N'2', N'1')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'8', N'15', N'10', N'4', N'4', N'1')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'9', N'15', N'10', N'5', N'6', N'1')
GO

INSERT INTO [dbo].[DIAS_Y_HORARIOS] ([ID], [DURACION], [IDMEDICO], [IDDIAS], [HORAS], [ESTADO]) VALUES (N'10', N'15', N'2', N'3', N'8', N'1')
GO

SET IDENTITY_INSERT [dbo].[DIAS_Y_HORARIOS] OFF
GO


-- ----------------------------
-- Table structure for ESPECIALIDAD_X_MEDICO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ESPECIALIDAD_X_MEDICO]') AND type IN ('U'))
	DROP TABLE [dbo].[ESPECIALIDAD_X_MEDICO]
GO

CREATE TABLE [dbo].[ESPECIALIDAD_X_MEDICO] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [IDMEDICO] bigint  NOT NULL,
  [IDESPECIALIDAD] bigint  NOT NULL,
  [IDCONVENIO] int  NOT NULL,
  [ESTADO] bit  NULL
)
GO

ALTER TABLE [dbo].[ESPECIALIDAD_X_MEDICO] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'PARA LOS COSTOS SEGUN CONVENIOS',
'SCHEMA', N'dbo',
'TABLE', N'ESPECIALIDAD_X_MEDICO',
'COLUMN', N'IDCONVENIO'
GO

EXEC sp_addextendedproperty
'MS_Description', N'EN EL FUTURO HABRA QUE HACER UN TRIGER AFTER DELETE',
'SCHEMA', N'dbo',
'TABLE', N'ESPECIALIDAD_X_MEDICO',
'COLUMN', N'ESTADO'
GO


-- ----------------------------
-- Records of ESPECIALIDAD_X_MEDICO
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ESPECIALIDAD_X_MEDICO] ON
GO

INSERT INTO [dbo].[ESPECIALIDAD_X_MEDICO] ([ID], [IDMEDICO], [IDESPECIALIDAD], [IDCONVENIO], [ESTADO]) VALUES (N'1', N'1', N'2', N'1', NULL)
GO

INSERT INTO [dbo].[ESPECIALIDAD_X_MEDICO] ([ID], [IDMEDICO], [IDESPECIALIDAD], [IDCONVENIO], [ESTADO]) VALUES (N'2', N'1', N'5', N'1', NULL)
GO

INSERT INTO [dbo].[ESPECIALIDAD_X_MEDICO] ([ID], [IDMEDICO], [IDESPECIALIDAD], [IDCONVENIO], [ESTADO]) VALUES (N'3', N'2', N'1', N'1', NULL)
GO

INSERT INTO [dbo].[ESPECIALIDAD_X_MEDICO] ([ID], [IDMEDICO], [IDESPECIALIDAD], [IDCONVENIO], [ESTADO]) VALUES (N'4', N'5', N'4', N'1', NULL)
GO

INSERT INTO [dbo].[ESPECIALIDAD_X_MEDICO] ([ID], [IDMEDICO], [IDESPECIALIDAD], [IDCONVENIO], [ESTADO]) VALUES (N'5', N'10', N'4', N'1', NULL)
GO

SET IDENTITY_INSERT [dbo].[ESPECIALIDAD_X_MEDICO] OFF
GO


-- ----------------------------
-- Table structure for ESPECIALIDADES
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ESPECIALIDADES]') AND type IN ('U'))
	DROP TABLE [dbo].[ESPECIALIDADES]
GO

CREATE TABLE [dbo].[ESPECIALIDADES] (
  [IDESPECIALIDAD] bigint  IDENTITY(1,1) NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [ESTADO] bit  NULL
)
GO

ALTER TABLE [dbo].[ESPECIALIDADES] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of ESPECIALIDADES
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] ON
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'1', N'ANALISIS CLINICOS', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'2', N'ANALISIS DE ANATOMIA PATOLOGICA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'3', N'ANALISIS DE GENETICA MEDICA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'4', N'ANALISIS DE MEDICINA NUCLEAR', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'5', N'ANALISIS DE MICROBIOLOGIA Y PARASITOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'6', N'CARDIOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'7', N'CIRUGIA GENERAL', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'8', N'DERMATOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'9', N'ENDOCRINOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'10', N'GASTROENTEROLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'11', N'MEDICO CLINICO', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'12', N'NEUMOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'13', N'NEUROLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'14', N'NUTRICION', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'15', N'ODONTOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'16', N'OFTALMOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'17', N'ONCOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'18', N'PEDIATRIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'19', N'PROCTOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'20', N'PSIQUIATRIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'21', N'REUMATOLOGIA', N'1')
GO

INSERT INTO [dbo].[ESPECIALIDADES] ([IDESPECIALIDAD], [NOMBRE], [ESTADO]) VALUES (N'22', N'UROLOGIA', N'1')
GO

SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] OFF
GO


-- ----------------------------
-- Table structure for mails_prestadores
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[mails_prestadores]') AND type IN ('U'))
	DROP TABLE [dbo].[mails_prestadores]
GO

CREATE TABLE [dbo].[mails_prestadores] (
  [id] int  NOT NULL,
  [prestador] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [email] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [matricula] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [dni] varchar(13) COLLATE Modern_Spanish_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[mails_prestadores] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of mails_prestadores
-- ----------------------------
INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'1', N'ABADI JOSE GABRIEL', N'abadidermatologia@gmail.com
', N'448685', N'23668295')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'2', N'ABRAHAN CLAUDIO ROBERTO', N'claudioabrahan@hotmail.com', N'49191', N'11455584')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'3', N'ABRAHAN MARIA SOLEDAD', N'msabrahan@yahoo.com.ar', N'453720', N'28970651')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'4', N'ALARCON SIRIA CAROLINA', N'draalarconsiria@gmail.com', N'451057', N'29580590')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'5', N'ALEJO MIRIAM ADRIANA', N'miriamadriana1961@gmail.com', N'441690', N'14772862')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'6', N'ALVAREZ SEPULVEDA PABLO', N'alvasep@hotmail.com
', NULL, N'18758355')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'7', N'ALVELO CARLOS', N'caalvelo@fibertel.com.ar', N'52010', N'8104631')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'8', N'ANGILELLO RICARDO FRANCISCO', N'ricardo_angilello59@hotmail.com', N'440618', N'12866880')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'9', N'ANGIOI GRACIELA MARGARITA', N'angioimarga@yahoo.com.ar', N'49731', N'12661908')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'10', N'ARCURI FRANCISCO', N'alpaparatto@mac.com', N'450504', N'23781948')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'11', N'ARCURI MARIA PAZ', N'consarcuri@fibertel.com.ar', NULL, N'30218043')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'12', N'ARTACHO BURGOS MARIA', N'mariaartacho@yahoo.com.ar', N'55585', N'23276518')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'13', N'AYGUAVELLA JULIO ALFONSO', N'jaygua@intramed.net', N'46510', N'64564')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'14', N'BARRIVIERA LAURA', N'laurabarriviera@gmail.com', NULL, N'27876918')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'15', N'BATASTINI ALEJANDRO FABIAN', N'alebatas@yahoo.com.ar', N'444013', N'17686989')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'16', N'BEBENROTH ROMINA', N'rominabebenroth@hotmail.com', N'452471', N'30226040')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'17', N'BELLORA ANTONIO', N'antonio@bellora.com.ar', N'28843', N'11184968')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'18', N'BERARDI VALERIA', N'valeria_0903@hotmail.com', N'446169', N'18110205')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'19', N'BETTINELLI RICARDO JORGE', N'bettinelliricardoj@hotmail.com', N'45760', N'8248978')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'20', N'BIGETTI GABRIEL', N'gabigetti@yahoo.com.ar', N'441327', N'12285304')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'21', N'BONURA CLAUDIA E.', N'claudiabonura@hotmail.com', N'442056', N'16866423')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'22', N'BUCCELLA MARIO AUGUSTO', N'marioaugustodr@hotmail.com', N'46986', N'7594257')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'23', N'BURTA DANIEL', N'danielburta@hotmail.com', N'43530', N'5928332')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'24', N'CABRERA NATALIA', N'natymcabrera@hotmail.com', N'447598', N'22416296')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'25', N'CALAJIAN PATRICIA', N'patricia_calajian@yahoo.com.ar', NULL, N'14182394')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'26', N'CAMPBELL GERALDINE', N'dra.geraldinecampbell@gmail.com', N'58215', N'27386814')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'27', N'CAMPOLONGO SILVIA', N'igvi@fibertel.com.ar', N'443167', N'17537963')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'28', N'CANEVA CECILIA', N'ccaneva@hotmail.com', N'443635', N'20355564')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'29', N'CASTRO MARCIA JIMENA', N'castromarciaj@gmail.com', N'58146', N'28229176')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'30', N'CEBALLOS MARIO RODOLFO', N'ceballosmr@hotmail.com', N'48569', N'7994135')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'31', N'CHIOZZA MIGUEL ALFREDO', N'machbachi@live.com', N'43389', N'5615238')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'32', N'COLOMBO MONICA LUISA', N'dramonicalcolombo@hotmail.com', N'444777', N'13512786')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'33', N'COLOMBO VIVIANA', N'monimorelli@hotmail.com', NULL, N'20201711')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'34', N'COMMISSI ELISA N.', N'elisacommissi@gmail.com', N'444176', N'14915754')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'35', N'CUEVAS ANABELLA', N'anabellacuevas@hotmail.com.ar', NULL, N'32763644')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'37', N'DE STEFANO EUGENIA', N'eugeniadestefano@yahoo.com.ar', N'59810', N'28711883')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'38', N'DEDIONIGI MARIA ELEONORA', N'holalele@yahoo.com', N'448036', N'22860933')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'39', N'DELGER RAFAEL', N'drrafadelger@hotmail.com', N'444105', N'16247295')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'40', N'DENETT MARIA ALEJANDRA', N'alej_denett@hotmail.com', N'451764', N'25106220')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'41', N'DI NIRO GUSTAVO A.', N'liazanezky@hotmail.com', N'441344', N'14062863')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'42', N'DI NUNZIO MARIA CLARA', N'claradinu14@yahoo.com', N'451743', N'25597929')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'43', N'DIEZ BELTRAN CLAUDIA', N'cdiezbeltran@yahoo.com.ar', N'440098', N'13859804')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'44', N'FERNANDEZ DANIEL OSCAR', N'drfernandezdaniel@gmail.com', N'52553', N'11786342')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'45', N'FINKELSZTEIN CLAUDIO', N'claudiofink@hotmail.com', N'440579', N'11987621')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'46', N'FORNARI NICOLETTA', N'n_fornari@hotmail.com', N'442904', N'6742326')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'47', N'GARCIA ANA MARIA', N'anagarcia_otero@hotmail.com', N'440064', N'13403058')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'48', N'GIULIANI ANDREA', N'andrea@clinicagiuliani.com', N'448287', N'18154579')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'49', N'GLOWKO VERONICA', N'veronicaglowko@gmail.com', N'58624', N'30934848')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'50', N'GOMEZ GRACIELA MONICA', N'aigrela2003gra@gmail.com', N'440028', N'11788936')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'51', N'GONZALEZ LIDIA ALICIA', N'gonzalezla@intramed.net', N'15952', N'11364483')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'52', N'GONZALEZ OSVALDO', N'perlafernandez@hotmail.com', NULL, N'13180417')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'53', N'GOSSN EDUARDO', N'e.gossn@hotmail.com', N'48502', N'11008358')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'54', N'GOSSN GONZALO', N'gonzalo.gossn@gmail.com', N'454619', N'32757840')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'56', N'GRAJALES AGUSTIN', N'kidepkinesio@hotmail.com', NULL, N'30460373')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'57', N'GRANDINETTI MARIELA', N'marielagtti@hotmail.com', N'449588', N'26911055')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'60', N'HAEHNEL MARIANA', N'marianahaehnel@gmail.com', N'445783', N'22177588')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'61', N'IDIART CECILIA MONICA', N'cidiart70@gmail.com', N'449956', N'21919309')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'62', N'JACOBEZ SILVIA', N'sjacobez@gmail.com', N'444489', N'18144488')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'63', N'KEREKES JORGE JOSE', N'jorgekerekes@gmail.com', N'48402', N'11165724')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'64', N'LAGO CARLOS ALBERTO', N'dr.lago@hotmail.com', N'53101', N'10401569')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'66', N'LANG WALTER GUILLERMO', N'wallang21@yahoo.com.ar', N'449392', N'22344536')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'67', N'LAZARO MARIA ALICIA', N'dra-lazaro@hotmail.com', N'35805', N'11889015')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'68', N'LINARES JUAN MARTIN', N'juanmartinlinares@hotmail.com.ar', N'447688', N'21474083')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'69', N'LINARI MARIA', N'marimelina@yahoo.com', N'446309', N'22655782')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'70', N'LOMLOMDJIAN OSCAR MIGUEL', N'interarmenia@hotmail.com', N'46996', N'8019935')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'71', N'LOPEZ VICCHI MARTIN MIGUEL', N'martinlopezvicchi@gmail.com', N'550776', N'31058301')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'72', N'MACAN ALEJANDRO', N'alejandromacan@gmail.com', N'440403', N'14820439')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'73', N'MACAN SERGIO ALEJANDRO', N'sergiomacan@yahoo.com.ar', N'58625', N'31089685')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'74', N'MAINAR ROSARIO', N'rochimainar@gmail.com', N'452100', N'30706424')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'75', N'MAINO MARIA MERCEDES', N'mercedes.maino@gmail.com', N'454978', N'30654876')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'76', N'MANDZIJ MARCELO JUAN', N'mandzijmar@hotmail.com', N'442406', N'16345172')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'77', N'MARADONA AURORA ANGELA', N'juliemaradona@hotmail.com', N'49667', N'13512875')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'78', N'MARQUEZ LUIS HORACIO', N'lhmarquez@intramed.net', N'49772', N'11317345')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'79', N'MARTINEZ PIO ERNESTO', N'piomartinez3@gmail.com', N'443626', N'18616270')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'80', N'MAURIÃ‘O HECTOR', N'hamaurino@hotmail.com', N'440976', N'7887729')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'81', N'MELMAN ARIEL JORGE', N'ariel_melman@yahoo.com.ar', N'441629', N'16219064')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'83', N'MOTTALINI BERNARDO NATALIO', N'mottalini@hotmail.com', N'47375', N'8434472')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'84', N'MURPHY CLAUDIA', N'dra.cmurphy@gmail.com', N'441481', N'13133620')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'86', N'NINI HECTOR LUIS', N'hectorlnini@hotmail.com', N'48793', N'11455600')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'87', N'NOVOA DEFELICE FEDERICO', N'fnovoa@intramed.net', N'446508', N'21571375')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'88', N'PAGLIERO MARIA PAULA', N'licmppagliero@hotmail.com', NULL, N'21732340')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'89', N'PANINI JULIO CARMELO', N'jucpanini@yahoo.com.ar', N'45826', N'8118014')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'90', N'PELEGRINA GUILLERMO', N'drguillermopelegina@gmail.com', N'450950', N'28725257')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'91', N'POZZI ROSA', N'roquel7745@hotmail.com', N'441329', N'14315282')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'92', N'PRADO ANTONIO MARIO', N'alejandranikcevich@gmail.com', N'48443', N'11770606')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'93', N'QUINN CARLOS ALBERTO', N'carlosalbertoquinn@gmail.com', N'46737', N'7642808')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'94', N'RANEA FRANCISCO', N'franranea@yahoo.com.ar', N'449212', N'23301941')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'95', N'REZZONICO GABRIELA A.', N'gabyrezzonico@hotmail.com', N'440285', N'12801263')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'96', N'RIO ANA LETICIA', N'lrcardio@hotmail.com', N'47767', N'11106157')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'97', N'RIZZA MARIO', N'drmarizza@hotmail.com', N'15903', N'4384646')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'98', N'ROCHA JUANA', N'juanarocha1@yahoo.com', NULL, N'04885285')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'101', N'RODRIGUEZ ENRIQUE', N'erodriguez@intramed.net', N'28750', N'11625805')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'102', N'RODRIGUEZ MARCELA', N'aconcagua2@hotmail.com', N'447155', N'21058861')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'103', N'ROSSI SILVIA HAYDEE', N'silviahrossi48@hotmail.com', N'45061', N'5454373')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'104', N'ROSSINI GLADYS', N'gladysnrossini@yahoo.com.ar', N'35689', N'13020728')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'105', N'SAPONARO ALBERTO', N'saponaroalberto@yahoo.com.ar', N'34767', N'10360324')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'106', N'SCHULLER HUGO ALBERTO', N'schuller@fibertel.com.ar', N'44974', N'4435170')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'107', N'SEEBER GUILLERMO', N'guillermoseeber24@hotmail.com', N'231475', N'31060337')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'108', N'SEGADE ANA MARIA', N'anamariasegade@yahoo.com.ar', NULL, N'06024301')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'109', N'SMECUOL EDGARDO G.', N'esmecuol@intramed.net', N'442411', N'12463018')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'110', N'TABLADO ANALIA', N'consultoriomyo@hotmail.com.ar', N'440020', N'11938743')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'111', N'TAMASHIRO MONICA', N'monicatamashiro@yahoo.com.ar', N'54373', N'20733400')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'112', N'TARASIUK VICTOR', N'vtarasiuk@intramed.net', N'46948', N'11047926')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'113', N'TONELLO MARIA LUJAN', N'lujantonello@hotmail.com', N'450816', N'26205521')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'114', N'TOUCEDA CLARA', N'draclaratouceda@hotmail.com', N'444225', N'20317792')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'116', N'TRUSCELLO LUCILA', N'lucilatruscello@yahoo.com.ar', NULL, N'16455766')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'117', N'VEGA GUILLERMO', N'guillermojvega@gmail.com', N'450495', N'21669618')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'118', N'VERIS ANA', N'ana-veris@hotmail.com', NULL, N'92438226')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'119', N'VILLA ANDRES MIGUEL', N'andresmvilla@gmail.com', N'454648', N'27086619')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'120', N'Villalba Pablo', N'pvillalba@intramed.net', N'448377', N'24905783')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'121', N'ZANOLLO OSVALDO LUIS', N'o.zanollo@hotmail.com', N'47141', N'10872421')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'122', N'ZENGARINI CECILIA', N'chizenga@hotmail.com', N'449871', N'23489417')
GO

INSERT INTO [dbo].[mails_prestadores] ([id], [prestador], [email], [matricula], [dni]) VALUES (N'123', N'MALUF ROBERTO JAVIER', N'robertojaviermaluf@yahoo.com', N'442492', N'14768593')
GO


-- ----------------------------
-- Table structure for MEDICOS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MEDICOS]') AND type IN ('U'))
	DROP TABLE [dbo].[MEDICOS]
GO

CREATE TABLE [dbo].[MEDICOS] (
  [IDMEDICO] bigint  IDENTITY(1,1) NOT NULL,
  [APELLIDO] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [SEXO] varchar(1) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [FECHANAC] date  NOT NULL,
  [FECHAINGRESO] date  NOT NULL,
  [EMAIL] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [DNI] varchar(13) COLLATE Modern_Spanish_CI_AS DEFAULT ((0)) NOT NULL,
  [MATRICULA] int  NULL,
  [ESTADO] bit  NULL
)
GO

ALTER TABLE [dbo].[MEDICOS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of MEDICOS
-- ----------------------------
SET IDENTITY_INSERT [dbo].[MEDICOS] ON
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'1', N'Ashley', N'Chanda', N'M', N'1965-10-03', N'2007-05-05', N'sin@mail', N'11151', N'40001', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'2', N'Avery', N'Idola', N'M', N'1977-10-20', N'2014-11-01', N'sin@mail', N'11135', N'40002', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'4', N'Berger', N'Jayme', N'F', N'1952-05-26', N'2011-09-17', N'sin@mail', N'11170', N'40004', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'5', N'Berry', N'Audra', N'F', N'1977-02-14', N'2014-04-09', N'sin@mail', N'11158', N'40005', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'6', N'Bishop', N'Reece', N'F', N'1958-02-06', N'2005-11-21', N'sin@mail', N'11145', N'40006', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'7', N'Booker', N'Kamal', N'M', N'1959-05-15', N'2011-02-01', N'sin@mail', N'11187', N'40007', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'8', N'Bridges', N'Dakota', N'M', N'1950-10-14', N'1995-04-12', N'sin@mail', N'11205', N'40008', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'9', N'Bridges', N'Iris', N'M', N'1985-12-14', N'2003-05-29', N'sin@mail', N'11144', N'40009', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'10', N'Briggs', N'Leilani', N'M', N'1989-08-22', N'2005-12-19', N'sin@mail', N'11190', N'40010', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'11', N'Bright', N'Melissa', N'M', N'1983-01-19', N'2000-08-29', N'sin@mail', N'11188', N'40011', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'12', N'Browning', N'Astra', N'F', N'1984-06-02', N'1998-11-07', N'sin@mail', N'11159', N'40012', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'13', N'Bruce', N'Ethan', N'F', N'1975-03-22', N'2007-11-26', N'sin@mail', N'11122', N'40013', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'14', N'Caldwell', N'Kasimir', N'F', N'1955-11-10', N'1999-09-09', N'sin@mail', N'11202', N'40014', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'15', N'Cannon', N'Melanie', N'M', N'1946-11-28', N'2004-03-15', N'sin@mail', N'11129', N'40015', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'16', N'Cannon', N'Stacey', N'F', N'1970-08-16', N'1996-06-22', N'sin@mail', N'11156', N'40016', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'17', N'Cash', N'Caleb', N'F', N'1976-01-05', N'2004-03-18', N'sin@mail', N'11118', N'40014', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'18', N'Castillo', N'Levi', N'M', N'1983-12-16', N'2002-06-25', N'sin@mail', N'11123', N'40015', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'19', N'Cohen', N'Justine', N'F', N'1954-04-18', N'1997-05-31', N'sin@mail', N'11192', N'40016', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'20', N'Craig', N'Rhona', N'F', N'1966-01-02', N'2014-04-03', N'sin@mail', N'11161', N'40017', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'21', N'Delacruz', N'Signe', N'M', N'1960-11-04', N'2000-02-12', N'sin@mail', N'11138', N'40018', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'22', N'Dixon', N'Byron', N'F', N'1951-10-13', N'2004-03-30', N'sin@mail', N'11178', N'40019', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'23', N'Doyle', N'Beau', N'M', N'1987-09-20', N'2016-05-18', N'sin@mail', N'11198', N'40020', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'24', N'English', N'Jonah', N'M', N'1973-05-16', N'2014-03-12', N'sin@mail', N'11162', N'40021', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'25', N'Farrell', N'Porter', N'M', N'1978-11-15', N'2015-07-15', N'sin@mail', N'11133', N'40022', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'26', N'Ferrell', N'David', N'F', N'1966-10-04', N'2000-02-16', N'sin@mail', N'11141', N'40023', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'27', N'Fischer', N'Evan', N'M', N'1973-11-24', N'2011-07-27', N'sin@mail', N'11193', N'40024', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'28', N'Fischer', N'Hakeem', N'M', N'1964-02-12', N'1996-09-01', N'sin@mail', N'11203', N'40025', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'29', N'Fletcher', N'Rebecca', N'F', N'1954-12-18', N'1997-04-09', N'sin@mail', N'11208', N'40026', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'30', N'Flores', N'Murphy', N'F', N'1950-08-26', N'2002-11-02', N'sin@mail', N'11173', N'40027', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'31', N'Flynn', N'Charity', N'F', N'1976-12-08', N'2009-11-09', N'sin@mail', N'453720', N'40028', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'32', N'Gallagher', N'Dawn', N'F', N'1975-07-13', N'2016-02-02', N'sin@mail', N'11195', N'40029', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'33', N'Gardner', N'April', N'F', N'1982-11-03', N'2013-08-18', N'sin@mail', N'11174', N'40030', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'34', N'Gray', N'Timon', N'M', N'1970-05-28', N'1999-11-20', N'sin@mail', N'11201', N'40031', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'35', N'Griffin', N'Kim', N'F', N'1974-01-25', N'2011-10-13', N'sin@mail', N'11175', N'40032', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'36', N'Grimes', N'Kai', N'M', N'1985-12-18', N'2006-04-11', N'sin@mail', N'451057', N'40033', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'37', N'Guerra', N'Robin', N'F', N'1964-08-25', N'2010-12-28', N'sin@mail', N'11209', N'40034', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'38', N'Hale', N'Nomlanga', N'M', N'1959-11-25', N'1999-01-23', N'sin@mail', N'11131', N'40035', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'39', N'Hall', N'Chantale', N'F', N'1947-07-28', N'2009-09-01', N'sin@mail', N'11183', N'40036', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'40', N'Haney', N'Kathleen', N'M', N'1958-04-14', N'2011-05-18', N'sin@mail', N'11204', N'40037', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'41', N'Hardy', N'Conan', N'M', N'1975-08-27', N'2015-02-18', N'sin@mail', N'11169', N'40038', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'42', N'Hayes', N'Maxwell', N'F', N'1957-09-04', N'1994-10-24', N'sin@mail', N'11182', N'40039', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'43', N'Herrera', N'Melanie', N'M', N'1972-12-11', N'2005-09-11', N'sin@mail', N'11186', N'40040', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'44', N'Herring', N'Janna', N'F', N'1982-08-15', N'2012-10-23', N'sin@mail', N'11167', N'40041', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'45', N'Hodge', N'Neve', N'F', N'1947-10-21', N'2016-06-16', N'sin@mail', N'11163', N'40042', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'46', N'Hood', N'Rhea', N'F', N'1963-07-28', N'2003-08-31', N'sin@mail', N'11142', N'40043', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'47', N'Hudson', N'Tarik', N'F', N'1984-09-06', N'1998-04-02', N'sin@mail', N'11207', N'40044', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'48', N'Hunter', N'Daryl', N'M', N'1965-12-19', N'1997-03-22', N'sin@mail', N'11143', N'40045', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'49', N'Jefferson', N'Jael', N'M', N'1953-04-12', N'2002-07-05', N'sin@mail', N'11124', N'40046', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'50', N'Jefferson', N'Zephr', N'M', N'1966-11-29', N'2002-12-30', N'sin@mail', N'11119', N'40047', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'51', N'Jenkins', N'Lars', N'F', N'1963-10-01', N'2002-02-08', N'sin@mail', N'11149', N'40048', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'52', N'Kelley', N'Jessica', N'F', N'1983-06-09', N'1998-06-10', N'sin@mail', N'11153', N'40049', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'53', N'Kim', N'Kareem', N'M', N'1983-04-24', N'1994-12-13', N'sin@mail', N'11148', N'40050', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'54', N'Kirby', N'Quemby', N'F', N'1973-08-01', N'2007-03-29', N'sin@mail', N'11128', N'40051', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'55', N'Lancaster', N'Tashya', N'F', N'1990-05-19', N'1997-04-22', N'sin@mail', N'11189', N'40052', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'56', N'Lara', N'Alfreda', N'M', N'1981-05-16', N'2001-03-06', N'sin@mail', N'11155', N'40053', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'57', N'Levine', N'Nomlanga', N'F', N'1985-09-24', N'2005-11-10', N'sin@mail', N'11168', N'40054', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'58', N'Little', N'Jescie', N'M', N'1947-06-28', N'1995-07-10', N'sin@mail', N'11139', N'40055', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'59', N'Lucas', N'James', N'M', N'1988-04-10', N'2001-09-12', N'sin@mail', N'11127', N'40056', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'60', N'Luna', N'Cara', N'M', N'1991-02-22', N'1997-02-14', N'sin@mail', N'11200', N'40057', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'61', N'Maddox', N'James', N'M', N'1961-09-10', N'1999-12-19', N'sin@mail', N'11130', N'40058', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'62', N'Martinez', N'Isadora', N'F', N'1958-09-14', N'2000-02-28', N'sin@mail', N'11154', N'40059', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'63', N'Mckay', N'Evelyn', N'F', N'1979-10-12', N'2000-02-25', N'sin@mail', N'11206', N'40060', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'64', N'Medina', N'Uriel', N'F', N'1979-11-29', N'2001-05-18', N'sin@mail', N'49191', N'40061', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'65', N'Mejia', N'Ora', N'M', N'1961-11-21', N'1995-12-08', N'sin@mail', N'11132', N'40062', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'66', N'Middleton', N'Hyacinth', N'F', N'1963-01-10', N'2004-05-23', N'sin@mail', N'11181', N'40063', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'67', N'Miranda', N'Kamal', N'M', N'1953-07-03', N'2014-12-08', N'sin@mail', N'11136', N'40064', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'68', N'Murray', N'Chantale', N'M', N'1956-06-03', N'2002-11-22', N'sin@mail', N'11164', N'40065', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'69', N'Obrien', N'Zelda', N'M', N'1986-12-31', N'2013-04-20', N'sin@mail', N'11134', N'40066', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'70', N'Odom', N'Kuame', N'M', N'1990-08-08', N'2005-04-30', N'sin@mail', N'11160', N'40067', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'71', N'Orr', N'Aileen', N'M', N'1949-11-11', N'2013-02-07', N'sin@mail', N'11180', N'40068', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'72', N'Ortiz', N'Cailin', N'M', N'1978-06-11', N'1995-10-09', N'sin@mail', N'11210', N'40069', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'73', N'Owen', N'Elijah', N'F', N'1983-12-13', N'2011-05-11', N'sin@mail', N'448685', N'40070', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'74', N'Palmer', N'Sage', N'M', N'1947-01-25', N'1997-05-14', N'sin@mail', N'11126', N'40071', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'75', N'Parrish', N'Yen', N'M', N'1979-03-18', N'2002-11-02', N'sin@mail', N'11177', N'40072', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'76', N'Pate', N'Martina', N'M', N'1946-05-17', N'1995-06-03', N'sin@mail', N'11125', N'40073', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'77', N'Pennington', N'Bell', N'F', N'1973-04-19', N'1996-01-11', N'sin@mail', N'11146', N'40074', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'78', N'Petersen', N'Miranda', N'M', N'1962-01-31', N'1999-09-04', N'sin@mail', N'11171', N'40075', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'79', N'Pittman', N'Hilda', N'M', N'1973-01-28', N'2015-06-28', N'sin@mail', N'11176', N'40076', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'80', N'Randall', N'Avram', N'F', N'1963-06-04', N'1996-11-14', N'sin@mail', N'11191', N'40077', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'81', N'Rasmussen', N'Winter', N'M', N'1964-03-12', N'2012-03-29', N'sin@mail', N'11194', N'40078', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'82', N'Rice', N'Flavia', N'F', N'1986-09-04', N'2007-11-23', N'sin@mail', N'11152', N'40079', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'83', N'Rosales', N'Kamal', N'F', N'1961-05-18', N'2002-11-29', N'sin@mail', N'11140', N'40080', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'84', N'Russell', N'Laith', N'F', N'1969-03-06', N'1996-09-28', N'sin@mail', N'11157', N'40081', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'85', N'Salazar', N'Angela', N'F', N'1984-02-02', N'2016-12-07', N'sin@mail', N'441690', N'40082', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'86', N'Santos', N'Jennifer', N'M', N'1961-11-19', N'2005-05-16', N'sin@mail', N'11185', N'40083', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'87', N'Shannon', N'Lisandra', N'F', N'1945-12-27', N'1995-01-06', N'sin@mail', N'11211', N'40084', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'88', N'Shepherd', N'Pamela', N'M', N'1971-09-30', N'1995-07-12', N'sin@mail', N'11197', N'40085', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'89', N'Simon', N'Knox', N'F', N'1957-05-26', N'2002-01-14', N'sin@mail', N'11172', N'40086', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'90', N'Spencer', N'Elmo', N'F', N'1956-03-21', N'1997-11-10', N'sin@mail', N'11196', N'40087', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'91', N'Summers', N'Camille', N'M', N'1968-01-27', N'2013-08-18', N'sin@mail', N'11199', N'40088', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'92', N'Sykes', N'Barrett', N'M', N'1974-06-21', N'2014-12-06', N'sin@mail', N'11147', N'40089', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'93', N'Torres', N'Angela', N'F', N'1953-05-19', N'2009-10-25', N'sin@mail', N'11166', N'40090', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'94', N'Travis', N'September', N'M', N'1954-03-09', N'2003-06-18', N'sin@mail', N'11165', N'40091', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'95', N'Vang', N'Price', N'F', N'1958-01-07', N'2013-04-01', N'sin@mail', N'11121', N'40092', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'96', N'Vaughn', N'Slade', N'M', N'1977-01-22', N'2013-09-01', N'sin@mail', N'11117', N'40093', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'97', N'Warner', N'Denton', N'M', N'1952-11-30', N'2014-03-23', N'sin@mail', N'11184', N'40094', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'98', N'Whitfield', N'Cara', N'F', N'1988-12-07', N'2015-10-02', N'sin@mail', N'11137', N'40095', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'99', N'Wood', N'Dacey', N'F', N'1951-06-06', N'2015-11-25', N'sin@mail', N'212', N'40096', N'1')
GO

INSERT INTO [dbo].[MEDICOS] ([IDMEDICO], [APELLIDO], [NOMBRE], [SEXO], [FECHANAC], [FECHAINGRESO], [EMAIL], [DNI], [MATRICULA], [ESTADO]) VALUES (N'100', N'Yang', N'Barrett', N'F', N'1968-10-23', N'2016-06-18', N'sin@mail', N'11179', N'40097', N'1')
GO

SET IDENTITY_INSERT [dbo].[MEDICOS] OFF
GO


-- ----------------------------
-- Table structure for OBRAS_SOCIALES
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[OBRAS_SOCIALES]') AND type IN ('U'))
	DROP TABLE [dbo].[OBRAS_SOCIALES]
GO

CREATE TABLE [dbo].[OBRAS_SOCIALES] (
  [IDOBRASOCIAL] int  IDENTITY(1,1) NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [ESTADO] bit  NULL
)
GO

ALTER TABLE [dbo].[OBRAS_SOCIALES] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of OBRAS_SOCIALES
-- ----------------------------
SET IDENTITY_INSERT [dbo].[OBRAS_SOCIALES] ON
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'1', N'CALABUIG HEALTH', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'2', N'DASUTEN', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'3', N'GALENO', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'4', N'IOMA', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'5', N'KLOSTER MEDICAL', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'6', N'LARA SALUD', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'7', N'OSCHOCA', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'8', N'OSDE', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'9', N'OSDEPYM', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'10', N'OSPACA', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'11', N'PAMI', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'12', N'SWISS MEDICAL', N'1')
GO

INSERT INTO [dbo].[OBRAS_SOCIALES] ([IDOBRASOCIAL], [NOMBRE], [ESTADO]) VALUES (N'13', N'UTHGRA', N'1')
GO

SET IDENTITY_INSERT [dbo].[OBRAS_SOCIALES] OFF
GO


-- ----------------------------
-- Table structure for PACIENTES
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PACIENTES]') AND type IN ('U'))
	DROP TABLE [dbo].[PACIENTES]
GO

CREATE TABLE [dbo].[PACIENTES] (
  [IDPACIENTE] bigint  IDENTITY(1,1) NOT NULL,
  [APELLIDO] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [IDOBRASOCIAL] int  NULL,
  [FECHANAC] datetime  NOT NULL,
  [SEXO] varchar(1) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [DNI] varchar(13) COLLATE Modern_Spanish_CI_AS  NULL,
  [EMAIL] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [NROCARNET] int  NULL,
  [ESTADO] tinyint DEFAULT ((1)) NULL
)
GO

ALTER TABLE [dbo].[PACIENTES] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of PACIENTES
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PACIENTES] ON
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'1', N'Alvarado', N'Felipe', N'13', N'1960-04-13 00:00:00.000', N'F', N'40053', N'SIN@MAIL.COM', N'5433', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'2', N'Alvarado', N'Sara', N'2', N'1979-08-09 00:00:00.000', N'F', N'40054', N'SIN@MAIL.COM', N'5434', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'3', N'Amato', N'Yeison', N'10', N'1949-10-07 00:00:00.000', N'F', N'40055', N'SIN@MAIL.COM', N'5435', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'4', N'Araya', N'Viola', N'3', N'1948-04-10 00:00:00.000', N'M', N'40056', N'SIN@MAIL.COM', N'5436', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'5', N'Arena', N'Alain', N'4', N'1979-10-20 00:00:00.000', N'F', N'40057', N'SIN@MAIL.COM', N'5437', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'6', N'Barone', N'Samuele', N'5', N'1985-12-26 00:00:00.000', N'M', N'40058', N'SIN@MAIL.COM', N'5438', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'7', N'Basile', N'Ainara', N'12', N'1976-01-14 00:00:00.000', N'M', N'40059', N'SIN@MAIL.COM', N'5439', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'8', N'Bellini', N'Giacomo', N'6', N'1956-11-29 00:00:00.000', N'M', N'40060', N'SIN@MAIL.COM', N'5440', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'9', N'Bernardi', N'Alice', N'13', N'1945-02-21 00:00:00.000', N'M', N'40061', N'SIN@MAIL.COM', N'5441', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'10', N'Bianco', N'Maylin', N'2', N'1989-11-03 00:00:00.000', N'F', N'40062', N'SIN@MAIL.COM', N'5442', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'11', N'Bravo', N'Gaia', N'6', N'1984-12-19 00:00:00.000', N'F', N'40063', N'SIN@MAIL.COM', N'5443', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'12', N'Bruno', N'Arantxa', N'13', N'1959-12-29 00:00:00.000', N'F', N'40064', N'SIN@MAIL.COM', N'5444', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'13', N'Bustamante', N'Lara', N'8', N'1978-12-17 00:00:00.000', N'M', N'40065', N'SIN@MAIL.COM', N'5445', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'14', N'Bustos', N'Armando', N'7', N'2010-01-30 00:00:00.000', N'M', N'40066', N'SIN@MAIL.COM', N'5446', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'15', N'Cáceres', N'Jasmín', N'1', N'1970-11-11 00:00:00.000', N'M', N'40067', N'SIN@MAIL.COM', N'5447', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'16', N'Cáceres', N'Marcello', N'10', N'1962-05-06 00:00:00.000', N'M', N'40068', N'SIN@MAIL.COM', N'5448', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'17', N'Calabrese', N'Filippo', N'4', N'1984-11-08 00:00:00.000', N'M', N'40069', N'SIN@MAIL.COM', N'5449', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'18', N'Campos', N'Evans', N'2', N'1993-06-26 00:00:00.000', N'M', N'40070', N'SIN@MAIL.COM', N'5450', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'19', N'Carrasco', N'Greta', N'8', N'1977-12-06 00:00:00.000', N'M', N'40071', N'SIN@MAIL.COM', N'5451', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'20', N'Carrasco', N'Stefano', N'10', N'1945-09-11 00:00:00.000', N'M', N'40072', N'SIN@MAIL.COM', N'5452', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'21', N'Carrasco', N'Teresa', N'12', N'1950-05-30 00:00:00.000', N'F', N'40073', N'SIN@MAIL.COM', N'5453', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'22', N'Castelli', N'Gisselle', N'6', N'1991-01-10 00:00:00.000', N'F', N'40074', N'SIN@MAIL.COM', N'5454', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'23', N'Castillo', N'Estrella', N'10', N'1948-09-25 00:00:00.000', N'F', N'40075', N'SIN@MAIL.COM', N'5455', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'24', N'castro', N'cristian', N'5', N'2020-01-02 00:00:00.000', N'f', N'40076', N'SIN@MAIL.COM', N'5456', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'25', N'Castro', N'Jordano', N'11', N'1969-08-14 00:00:00.000', N'M', N'40077', N'SIN@MAIL.COM', N'5457', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'26', N'Catalano', N'Adán', N'5', N'2005-02-08 00:00:00.000', N'M', N'40078', N'SIN@MAIL.COM', N'5458', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'27', N'Cattaneo', N'Anahís', N'10', N'2002-10-10 00:00:00.000', N'M', N'40079', N'SIN@MAIL.COM', N'5459', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'28', N'Cattaneo', N'Romina', N'8', N'1971-08-20 00:00:00.000', N'F', N'40080', N'SIN@MAIL.COM', N'5460', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'29', N'Cavallo', N'Joakin', N'4', N'1967-10-12 00:00:00.000', N'F', N'40081', N'SIN@MAIL.COM', N'5461', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'30', N'Cavallo', N'Linda', N'1', N'1974-04-02 00:00:00.000', N'M', N'40082', N'SIN@MAIL.COM', N'5462', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'31', N'Cavallo', N'Pascalle', N'3', N'1959-07-26 00:00:00.000', N'M', N'40083', N'SIN@MAIL.COM', N'5463', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'32', N'Ceccarelli', N'Angelo', N'13', N'1961-09-10 00:00:00.000', N'F', N'40084', N'SIN@MAIL.COM', N'5464', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'33', N'Colombo', N'Yesenia', N'12', N'1983-01-14 00:00:00.000', N'M', N'40085', N'SIN@MAIL.COM', N'5465', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'34', N'Conte', N'Federica', N'13', N'1961-03-13 00:00:00.000', N'M', N'40086', N'SIN@MAIL.COM', N'5466', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'35', N'Conti', N'Abram', N'10', N'2004-01-17 00:00:00.000', N'M', N'40087', N'SIN@MAIL.COM', N'5467', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'36', N'Conti', N'Lucio', N'3', N'1975-10-14 00:00:00.000', N'F', N'40088', N'SIN@MAIL.COM', N'5468', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'37', N'Conti', N'Nicolò', N'9', N'1947-01-10 00:00:00.000', N'M', N'40089', N'SIN@MAIL.COM', N'5469', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'38', N'Contreras', N'Konstanza', N'4', N'1945-03-04 00:00:00.000', N'M', N'40090', N'SIN@MAIL.COM', N'5470', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'39', N'Cortés', N'Ademir', N'10', N'1980-03-22 00:00:00.000', N'F', N'40091', N'SIN@MAIL.COM', N'5471', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'40', N'Costa', N'Lara', N'8', N'1975-07-17 00:00:00.000', N'F', N'40092', N'SIN@MAIL.COM', N'5472', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'41', N'Costantini', N'Gianluca', N'4', N'1966-05-22 00:00:00.000', N'F', N'40093', N'SIN@MAIL.COM', N'5473', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'42', N'De Angelis', N'Riccardo', N'5', N'1958-06-20 00:00:00.000', N'M', N'40094', N'SIN@MAIL.COM', N'5474', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'43', N'De Angelis', N'Sarah', N'6', N'1947-01-01 00:00:00.000', N'M', N'40095', N'SIN@MAIL.COM', N'5475', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'44', N'De Rosa', N'Camilla', N'4', N'1955-03-01 00:00:00.000', N'M', N'40096', N'SIN@MAIL.COM', N'5476', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'45', N'De Santis', N'Robin', N'4', N'1961-11-03 00:00:00.000', N'M', N'40097', N'SIN@MAIL.COM', N'5477', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'46', N'Donoso', N'Beatrice', N'11', N'2006-12-12 00:00:00.000', N'F', N'40098', N'SIN@MAIL.COM', N'5478', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'47', N'Donoso', N'Mónica', N'3', N'1954-12-25 00:00:00.000', N'F', N'40099', N'SIN@MAIL.COM', N'5479', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'48', N'Escobar', N'Francesco', N'13', N'1982-07-08 00:00:00.000', N'M', N'40100', N'SIN@MAIL.COM', N'5480', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'49', N'Espinoza', N'Aymara', N'4', N'2005-01-31 00:00:00.000', N'M', N'40101', N'SIN@MAIL.COM', N'5481', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'50', N'Espinoza', N'Daniela', N'12', N'1966-07-03 00:00:00.000', N'M', N'40102', N'SIN@MAIL.COM', N'5482', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'51', N'Fabbri', N'Samuele', N'9', N'1963-10-06 00:00:00.000', N'M', N'40103', N'SIN@MAIL.COM', N'5483', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'52', N'Farina', N'Kristopher', N'10', N'2004-10-19 00:00:00.000', N'F', N'40104', N'SIN@MAIL.COM', N'5484', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'53', N'Ferretti', N'Alejandro', N'3', N'1949-04-17 00:00:00.000', N'M', N'40105', N'SIN@MAIL.COM', N'5485', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'54', N'Ferretti', N'Eleazar', N'8', N'1968-11-02 00:00:00.000', N'M', N'40106', N'SIN@MAIL.COM', N'5486', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'55', N'Ferri', N'Betzabeth', N'12', N'1951-10-20 00:00:00.000', N'F', N'40107', N'SIN@MAIL.COM', N'5487', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'56', N'Figueroa', N'Flor', N'13', N'1994-12-11 00:00:00.000', N'M', N'40108', N'SIN@MAIL.COM', N'5488', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'57', N'Fiore', N'Yeison', N'12', N'1961-08-29 00:00:00.000', N'F', N'40109', N'SIN@MAIL.COM', N'5489', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'58', N'Fumagalli', N'Axl', N'5', N'2008-07-03 00:00:00.000', N'F', N'40110', N'SIN@MAIL.COM', N'5490', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'59', N'Fumagalli', N'Christofer', N'2', N'2002-03-17 00:00:00.000', N'M', N'40111', N'SIN@MAIL.COM', N'5491', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'60', N'Fumagalli', N'Dalia', N'10', N'1968-04-13 00:00:00.000', N'F', N'40112', N'SIN@MAIL.COM', N'5492', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'61', N'Galli', N'Lucio', N'3', N'1988-09-20 00:00:00.000', N'M', N'40113', N'SIN@MAIL.COM', N'5493', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'62', N'García', N'Genaro', N'7', N'1958-09-10 00:00:00.000', N'M', N'40114', N'SIN@MAIL.COM', N'5494', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'63', N'García', N'Jasmín', N'12', N'2007-09-12 00:00:00.000', N'M', N'40115', N'SIN@MAIL.COM', N'5495', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'64', N'García', N'Margherita', N'10', N'1994-08-31 00:00:00.000', N'F', N'40116', N'SIN@MAIL.COM', N'5496', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'65', N'Garrido', N'Daniele', N'10', N'1995-10-22 00:00:00.000', N'M', N'40117', N'SIN@MAIL.COM', N'5497', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'66', N'Giordano', N'Leonor', N'12', N'1956-03-01 00:00:00.000', N'M', N'40118', N'SIN@MAIL.COM', N'5498', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'67', N'Giorgi', N'Alessandro', N'5', N'1997-10-25 00:00:00.000', N'M', N'40119', N'SIN@MAIL.COM', N'5499', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'68', N'Giuliani', N'Caterina', N'4', N'1960-11-19 00:00:00.000', N'M', N'40120', N'SIN@MAIL.COM', N'5500', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'69', N'González', N'Lucia', N'3', N'1959-11-16 00:00:00.000', N'M', N'40121', N'SIN@MAIL.COM', N'5501', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'70', N'González', N'Paolo', N'9', N'2002-10-06 00:00:00.000', N'F', N'40122', N'SIN@MAIL.COM', N'5502', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'71', N'Greco', N'Alessia', N'13', N'1960-05-14 00:00:00.000', N'M', N'40123', N'SIN@MAIL.COM', N'5503', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'72', N'Greco', N'Sofia', N'11', N'1959-05-03 00:00:00.000', N'M', N'40124', N'SIN@MAIL.COM', N'5504', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'73', N'Guerra', N'Vittoria', N'1', N'1992-11-27 00:00:00.000', N'M', N'40125', N'SIN@MAIL.COM', N'5505', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'74', N'Gutiérrez', N'Cristian', N'1', N'2005-04-15 00:00:00.000', N'F', N'40126', N'SIN@MAIL.COM', N'5506', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'75', N'Gutiérrez', N'Ginevra', N'6', N'1955-07-21 00:00:00.000', N'M', N'40127', N'SIN@MAIL.COM', N'5507', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'76', N'Guzmán', N'Andrea', N'8', N'1985-05-08 00:00:00.000', N'F', N'40128', N'SIN@MAIL.COM', N'5508', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'77', N'Guzmán', N'Erika', N'5', N'1978-09-16 00:00:00.000', N'F', N'40129', N'SIN@MAIL.COM', N'5509', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'78', N'Guzmán', N'Manuela', N'11', N'2005-09-23 00:00:00.000', N'F', N'40130', N'SIN@MAIL.COM', N'5510', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'79', N'Henríquez', N'Adiel', N'2', N'1955-09-09 00:00:00.000', N'F', N'40131', N'SIN@MAIL.COM', N'5511', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'80', N'Henríquez', N'Alessandra', N'10', N'1993-07-15 00:00:00.000', N'M', N'40132', N'SIN@MAIL.COM', N'5512', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'81', N'Henríquez', N'Junior', N'7', N'2003-09-08 00:00:00.000', N'M', N'40133', N'SIN@MAIL.COM', N'5513', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'82', N'Henríquez', N'Sara', N'4', N'1981-07-25 00:00:00.000', N'M', N'40134', N'SIN@MAIL.COM', N'5514', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'83', N'Hernández', N'Giorgio', N'13', N'1992-06-12 00:00:00.000', N'M', N'40135', N'SIN@MAIL.COM', N'5515', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'84', N'Herrera', N'Dastin', N'3', N'1948-12-14 00:00:00.000', N'F', N'40136', N'SIN@MAIL.COM', N'5516', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'85', N'Herrera', N'Jhonatan', N'3', N'1992-08-02 00:00:00.000', N'F', N'40137', N'SIN@MAIL.COM', N'5517', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'86', N'Jiménez', N'Anahy', N'7', N'2008-05-19 00:00:00.000', N'F', N'40138', N'SIN@MAIL.COM', N'5518', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'87', N'Lagos', N'Fabio', N'2', N'2001-02-14 00:00:00.000', N'M', N'40139', N'SIN@MAIL.COM', N'5519', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'88', N'Lagos', N'Ismael', N'7', N'1952-11-10 00:00:00.000', N'M', N'40140', N'SIN@MAIL.COM', N'5520', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'89', N'Leone', N'Cindy', N'5', N'1976-10-03 00:00:00.000', N'M', N'40141', N'SIN@MAIL.COM', N'5521', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'90', N'Leone', N'Marta', N'8', N'1983-06-09 00:00:00.000', N'M', N'40142', N'SIN@MAIL.COM', N'5522', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'91', N'Lombardo', N'Ginevra', N'8', N'1970-12-21 00:00:00.000', N'M', N'40143', N'SIN@MAIL.COM', N'5523', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'92', N'Lombardo', N'Melany', N'10', N'2005-12-07 00:00:00.000', N'M', N'40144', N'SIN@MAIL.COM', N'5524', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'93', N'Longo', N'Enrico', N'13', N'1997-08-09 00:00:00.000', N'M', N'40145', N'SIN@MAIL.COM', N'5525', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'94', N'Longo', N'Ivanna', N'4', N'1997-01-06 00:00:00.000', N'M', N'40146', N'SIN@MAIL.COM', N'5526', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'95', N'Longo', N'Nicoletta', N'12', N'1965-03-25 00:00:00.000', N'F', N'40147', N'SIN@MAIL.COM', N'5527', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'96', N'López', N'Josue', N'9', N'1996-04-08 00:00:00.000', N'M', N'40148', N'SIN@MAIL.COM', N'5528', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'97', N'López', N'Roberto', N'4', N'1996-05-28 00:00:00.000', N'M', N'40149', N'SIN@MAIL.COM', N'5529', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'98', N'Maldonado', N'Alex', N'4', N'1994-03-24 00:00:00.000', N'M', N'40150', N'SIN@MAIL.COM', N'5530', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'99', N'Maldonado', N'Riccardo', N'7', N'1948-10-09 00:00:00.000', N'F', N'40151', N'SIN@MAIL.COM', N'5531', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'100', N'Mariani', N'Bayron', N'3', N'1998-12-07 00:00:00.000', N'F', N'40152', N'SIN@MAIL.COM', N'5532', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'101', N'Marino', N'Arianna', N'2', N'1961-05-24 00:00:00.000', N'F', N'40153', N'SIN@MAIL.COM', N'5533', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'102', N'Martínez', N'Alessio', N'2', N'1984-01-26 00:00:00.000', N'F', N'40154', N'SIN@MAIL.COM', N'5534', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'103', N'Mazza', N'Nicolò', N'10', N'1960-07-29 00:00:00.000', N'F', N'40155', N'SIN@MAIL.COM', N'5535', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'104', N'Medina', N'Giuseppe', N'13', N'1996-11-14 00:00:00.000', N'M', N'40156', N'SIN@MAIL.COM', N'5536', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'105', N'Mele', N'Miriam', N'9', N'1993-07-25 00:00:00.000', N'F', N'40157', N'SIN@MAIL.COM', N'5537', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'106', N'Meloni', N'Adriana', N'3', N'1957-02-19 00:00:00.000', N'M', N'40158', N'SIN@MAIL.COM', N'5538', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'107', N'Messina', N'Ginevra', N'2', N'1996-03-28 00:00:00.000', N'F', N'40159', N'SIN@MAIL.COM', N'5539', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'108', N'Milani', N'Alessia', N'11', N'1970-06-04 00:00:00.000', N'M', N'40160', N'SIN@MAIL.COM', N'5540', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'109', N'Milani', N'Pascuala', N'11', N'1945-02-10 00:00:00.000', N'F', N'40161', N'SIN@MAIL.COM', N'5541', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'110', N'Montanari', N'Davor', N'3', N'2006-06-03 00:00:00.000', N'F', N'40162', N'SIN@MAIL.COM', N'5542', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'111', N'Montanari', N'Nicoletta', N'3', N'1952-01-05 00:00:00.000', N'M', N'40163', N'SIN@MAIL.COM', N'5543', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'112', N'Monti', N'Luigi', N'4', N'1947-11-23 00:00:00.000', N'F', N'40164', N'SIN@MAIL.COM', N'5544', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'113', N'Morales', N'Bautista', N'12', N'1958-01-29 00:00:00.000', N'M', N'40165', N'SIN@MAIL.COM', N'5545', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'114', N'Morales', N'Cristiano', N'13', N'1994-06-06 00:00:00.000', N'F', N'40166', N'SIN@MAIL.COM', N'5546', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'115', N'Morales', N'Gianni', N'6', N'1946-12-15 00:00:00.000', N'F', N'40167', N'SIN@MAIL.COM', N'5547', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'116', N'Morales', N'Nahuel', N'4', N'2006-08-08 00:00:00.000', N'M', N'40168', N'SIN@MAIL.COM', N'5548', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'117', N'Morales', N'Roger', N'1', N'1963-10-08 00:00:00.000', N'M', N'40169', N'SIN@MAIL.COM', N'5549', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'118', N'Moreno', N'Gastón', N'1', N'1981-12-11 00:00:00.000', N'M', N'40170', N'SIN@MAIL.COM', N'5550', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'119', N'Moreno', N'Giancarlo', N'11', N'1996-09-24 00:00:00.000', N'M', N'40171', N'SIN@MAIL.COM', N'5551', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'120', N'Moreno', N'Mathias', N'8', N'1989-03-10 00:00:00.000', N'F', N'40172', N'SIN@MAIL.COM', N'5552', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'121', N'Moro', N'Silvia', N'13', N'1970-02-10 00:00:00.000', N'F', N'40173', N'SIN@MAIL.COM', N'5553', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'122', N'Muñoz', N'Daniele', N'12', N'1964-01-23 00:00:00.000', N'M', N'40174', N'SIN@MAIL.COM', N'5554', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'123', N'Napolitano', N'Viola', N'13', N'1952-06-13 00:00:00.000', N'M', N'40175', N'SIN@MAIL.COM', N'5555', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'124', N'Navarro', N'Daniele', N'2', N'1979-12-19 00:00:00.000', N'F', N'40176', N'SIN@MAIL.COM', N'5556', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'125', N'Olivares', N'Giancarlo', N'12', N'1956-11-05 00:00:00.000', N'F', N'40177', N'SIN@MAIL.COM', N'5557', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'126', N'Ortega', N'Mijael', N'6', N'1950-09-24 00:00:00.000', N'M', N'40178', N'SIN@MAIL.COM', N'5558', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'127', N'Ortega', N'Valerio', N'13', N'2005-05-10 00:00:00.000', N'F', N'40179', N'SIN@MAIL.COM', N'5559', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'128', N'Palma', N'Marco', N'13', N'1971-12-29 00:00:00.000', N'F', N'40180', N'SIN@MAIL.COM', N'5560', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'129', N'Paredes', N'Helen', N'3', N'1988-03-29 00:00:00.000', N'F', N'40181', N'SIN@MAIL.COM', N'5561', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'130', N'Paredes', N'Rebecca', N'7', N'1985-12-20 00:00:00.000', N'M', N'40182', N'SIN@MAIL.COM', N'5562', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'131', N'Parra', N'Blanca', N'12', N'1960-03-27 00:00:00.000', N'F', N'40183', N'SIN@MAIL.COM', N'5563', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'132', N'Parra', N'Mayra', N'8', N'1958-04-06 00:00:00.000', N'F', N'40184', N'SIN@MAIL.COM', N'5564', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'133', N'Peña', N'Alfredo', N'9', N'1980-03-04 00:00:00.000', N'M', N'40185', N'SIN@MAIL.COM', N'5565', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'134', N'Peña', N'Axcel', N'5', N'1971-09-23 00:00:00.000', N'M', N'40186', N'SIN@MAIL.COM', N'5566', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'135', N'Peña', N'Lidia', N'8', N'1951-05-25 00:00:00.000', N'M', N'40187', N'SIN@MAIL.COM', N'5567', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'136', N'Pérez', N'Mattia', N'9', N'1966-04-01 00:00:00.000', N'F', N'40188', N'SIN@MAIL.COM', N'5568', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'137', N'Pérez', N'Sean', N'5', N'1977-09-11 00:00:00.000', N'M', N'40189', N'SIN@MAIL.COM', N'5569', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'138', N'Pérez', N'Vicente', N'10', N'1997-07-14 00:00:00.000', N'M', N'40190', N'SIN@MAIL.COM', N'5570', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'139', N'Piazza', N'Alessia', N'2', N'1987-11-08 00:00:00.000', N'F', N'40191', N'SIN@MAIL.COM', N'5571', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'140', N'Piccolo', N'Emma', N'3', N'1967-05-20 00:00:00.000', N'F', N'40192', N'SIN@MAIL.COM', N'5572', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'141', N'Pino', N'León', N'5', N'1987-05-24 00:00:00.000', N'M', N'40193', N'SIN@MAIL.COM', N'5573', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'142', N'Poblete', N'Federica', N'1', N'2007-03-01 00:00:00.000', N'F', N'40194', N'SIN@MAIL.COM', N'5574', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'143', N'Poblete', N'Thyare', N'4', N'1954-03-06 00:00:00.000', N'M', N'40195', N'SIN@MAIL.COM', N'5575', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'144', N'Proietti', N'Andy', N'8', N'2009-04-15 00:00:00.000', N'M', N'40196', N'SIN@MAIL.COM', N'5576', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'145', N'Proietti', N'Beatrice', N'6', N'2009-03-10 00:00:00.000', N'F', N'40197', N'SIN@MAIL.COM', N'5577', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'146', N'Ramírez', N'Soraya', N'5', N'1948-06-07 00:00:00.000', N'M', N'40198', N'SIN@MAIL.COM', N'5578', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'147', N'Reyes', N'Aldo', N'4', N'1974-08-08 00:00:00.000', N'M', N'40199', N'SIN@MAIL.COM', N'5579', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'148', N'Reyes', N'Naiara', N'1', N'1955-11-12 00:00:00.000', N'M', N'40200', N'SIN@MAIL.COM', N'5580', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'149', N'Ricciardi', N'Matilde', N'8', N'1965-11-21 00:00:00.000', N'F', N'40201', N'SIN@MAIL.COM', N'5581', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'150', N'Ricciardi', N'Randy', N'2', N'1973-02-09 00:00:00.000', N'F', N'40202', N'SIN@MAIL.COM', N'5582', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'151', N'Riquelme', N'Erika', N'13', N'1953-06-14 00:00:00.000', N'M', N'40203', N'SIN@MAIL.COM', N'5583', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'152', N'Riquelme', N'Noemi', N'6', N'1950-12-23 00:00:00.000', N'M', N'40204', N'SIN@MAIL.COM', N'5584', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'153', N'Riva', N'Armin', N'11', N'1956-10-08 00:00:00.000', N'M', N'40205', N'SIN@MAIL.COM', N'5585', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'154', N'Riva', N'Mariano', N'9', N'1988-10-05 00:00:00.000', N'F', N'40206', N'SIN@MAIL.COM', N'5586', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'155', N'Rizzi', N'Alice', N'7', N'1963-03-18 00:00:00.000', N'F', N'40207', N'SIN@MAIL.COM', N'5587', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'156', N'Rizzo', N'Caroline', N'6', N'2000-05-22 00:00:00.000', N'M', N'40208', N'SIN@MAIL.COM', N'5588', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'157', N'Rizzo', N'Sebastián', N'1', N'1946-06-08 00:00:00.000', N'F', N'40209', N'SIN@MAIL.COM', N'5589', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'158', N'Rizzo', N'Yarela', N'6', N'1956-10-17 00:00:00.000', N'F', N'40210', N'SIN@MAIL.COM', N'5590', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'159', N'Rodríguez', N'Francia', N'7', N'1987-11-13 00:00:00.000', N'F', N'40211', N'SIN@MAIL.COM', N'5591', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'160', N'Rodríguez', N'Josepha', N'11', N'1993-10-26 00:00:00.000', N'M', N'40212', N'SIN@MAIL.COM', N'5592', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'161', N'Rodríguez', N'Miriam', N'6', N'1966-05-27 00:00:00.000', N'M', N'40213', N'SIN@MAIL.COM', N'5593', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'162', N'Ruggiero', N'Nayara', N'11', N'2002-07-27 00:00:00.000', N'M', N'40214', N'SIN@MAIL.COM', N'5594', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'163', N'Ruggiero', N'Rodolfo', N'2', N'1994-03-14 00:00:00.000', N'M', N'40215', N'SIN@MAIL.COM', N'5595', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'164', N'Ruiz', N'Samuele', N'1', N'1960-07-18 00:00:00.000', N'M', N'40216', N'SIN@MAIL.COM', N'5596', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'165', N'Sáez', N'Alex', N'9', N'2000-09-08 00:00:00.000', N'M', N'40217', N'SIN@MAIL.COM', N'5597', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'166', N'Salazar', N'Angela', N'11', N'1968-01-05 00:00:00.000', N'M', N'40218', N'SIN@MAIL.COM', N'5598', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'167', N'Salinas', N'Dario', N'3', N'1976-10-21 00:00:00.000', N'F', N'40219', N'SIN@MAIL.COM', N'5599', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'168', N'Salinas', N'Karim', N'2', N'1993-05-11 00:00:00.000', N'M', N'40220', N'SIN@MAIL.COM', N'5600', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'169', N'San Martín', N'Domenico', N'8', N'1969-03-14 00:00:00.000', N'F', N'40221', N'SIN@MAIL.COM', N'5601', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'170', N'Sánchez', N'Alberto', N'10', N'1995-11-20 00:00:00.000', N'F', N'40222', N'SIN@MAIL.COM', N'5602', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'171', N'Sánchez', N'Martinna', N'10', N'1989-10-08 00:00:00.000', N'F', N'40223', N'SIN@MAIL.COM', N'5603', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'172', N'Sandoval', N'Ema', N'3', N'1954-09-16 00:00:00.000', N'M', N'40224', N'SIN@MAIL.COM', N'5604', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'173', N'Sandoval', N'Simone', N'4', N'1984-07-13 00:00:00.000', N'F', N'40225', N'SIN@MAIL.COM', N'5605', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'174', N'Sanhueza', N'Beatrice', N'3', N'1957-09-19 00:00:00.000', N'M', N'40226', N'SIN@MAIL.COM', N'5606', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'175', N'Sanhueza', N'Ociel', N'12', N'2004-04-06 00:00:00.000', N'M', N'40227', N'SIN@MAIL.COM', N'5607', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'176', N'Sanhueza', N'Paola', N'4', N'1976-12-25 00:00:00.000', N'M', N'40228', N'SIN@MAIL.COM', N'5608', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'177', N'Sanna', N'Mario', N'10', N'1981-02-10 00:00:00.000', N'F', N'40229', N'SIN@MAIL.COM', N'5609', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'178', N'Sepúlveda', N'Salvatore', N'13', N'1994-11-22 00:00:00.000', N'M', N'40230', N'SIN@MAIL.COM', N'5610', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'179', N'Serra', N'Fredy', N'7', N'2006-10-06 00:00:00.000', N'M', N'40231', N'SIN@MAIL.COM', N'5611', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'180', N'Serra', N'Giacomo', N'13', N'1950-06-27 00:00:00.000', N'M', N'40232', N'SIN@MAIL.COM', N'5612', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'181', N'Serra', N'Noemi', N'9', N'1957-09-14 00:00:00.000', N'F', N'40233', N'SIN@MAIL.COM', N'5613', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'182', N'Silva', N'Anna', N'4', N'1982-07-13 00:00:00.000', N'M', N'40234', N'SIN@MAIL.COM', N'5614', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'183', N'Silva', N'Arianna', N'8', N'1976-09-07 00:00:00.000', N'M', N'40235', N'SIN@MAIL.COM', N'5615', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'184', N'Silvestri', N'Luca', N'6', N'1996-05-26 00:00:00.000', N'F', N'40236', N'SIN@MAIL.COM', N'5616', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'185', N'Silvestri', N'Nicolò', N'6', N'2006-01-15 00:00:00.000', N'F', N'40237', N'SIN@MAIL.COM', N'5617', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'186', N'Sorrentino', N'José', N'12', N'1986-11-12 00:00:00.000', N'M', N'40238', N'SIN@MAIL.COM', N'5618', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'187', N'Soto', N'Gabriel', N'6', N'1947-08-17 00:00:00.000', N'M', N'40239', N'SIN@MAIL.COM', N'5619', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'188', N'Soto', N'Gerson', N'3', N'2006-12-16 00:00:00.000', N'M', N'40240', N'SIN@MAIL.COM', N'5620', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'189', N'Testa', N'Ilaria', N'13', N'1956-06-20 00:00:00.000', N'M', N'40241', N'SIN@MAIL.COM', N'5621', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'190', N'Valdés', N'Maite', N'13', N'1951-08-21 00:00:00.000', N'M', N'40242', N'SIN@MAIL.COM', N'5622', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'191', N'Valente', N'Monica', N'13', N'2010-08-19 00:00:00.000', N'M', N'40243', N'SIN@MAIL.COM', N'5623', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'192', N'Valentini', N'Beatrice', N'6', N'1997-01-07 00:00:00.000', N'M', N'40244', N'SIN@MAIL.COM', N'5624', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'193', N'Valentini', N'Jastin', N'6', N'1945-08-22 00:00:00.000', N'F', N'40245', N'SIN@MAIL.COM', N'5625', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'194', N'Valentini', N'Kilian', N'4', N'1990-04-16 00:00:00.000', N'F', N'40246', N'SIN@MAIL.COM', N'5626', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'195', N'Valenzuela', N'Sara', N'3', N'1950-01-17 00:00:00.000', N'F', N'40247', N'SIN@MAIL.COM', N'5627', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'196', N'Vásquez', N'Christian', N'7', N'1988-03-09 00:00:00.000', N'M', N'40248', N'SIN@MAIL.COM', N'5628', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'197', N'Venegas', N'Lionel', N'4', N'1989-11-16 00:00:00.000', N'M', N'40249', N'SIN@MAIL.COM', N'5629', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'198', N'Vera', N'Bryam', N'10', N'1975-06-15 00:00:00.000', N'M', N'40250', N'SIN@MAIL.COM', N'5630', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'199', N'Vergara', N'Randy', N'6', N'1986-05-09 00:00:00.000', N'M', N'40251', N'SIN@MAIL.COM', N'5631', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'200', N'Vitali', N'Michele', N'4', N'1951-06-26 00:00:00.000', N'F', N'40252', N'SIN@MAIL.COM', N'5632', N'1')
GO

INSERT INTO [dbo].[PACIENTES] ([IDPACIENTE], [APELLIDO], [NOMBRE], [IDOBRASOCIAL], [FECHANAC], [SEXO], [DNI], [EMAIL], [NROCARNET], [ESTADO]) VALUES (N'201', N'Zúñiga', N'Mirko', N'5', N'1973-04-09 00:00:00.000', N'F', N'40253', N'SIN@MAIL.COM', N'5633', N'1')
GO

SET IDENTITY_INSERT [dbo].[PACIENTES] OFF
GO


-- ----------------------------
-- Table structure for PLANES_X_OS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PLANES_X_OS]') AND type IN ('U'))
	DROP TABLE [dbo].[PLANES_X_OS]
GO

CREATE TABLE [dbo].[PLANES_X_OS] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [NOMBRE] varchar(255) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [IDOBRASOCIAL] int  NOT NULL
)
GO

ALTER TABLE [dbo].[PLANES_X_OS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of PLANES_X_OS
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PLANES_X_OS] ON
GO

SET IDENTITY_INSERT [dbo].[PLANES_X_OS] OFF
GO


-- ----------------------------
-- Table structure for ROLES
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ROLES]') AND type IN ('U'))
	DROP TABLE [dbo].[ROLES]
GO

CREATE TABLE [dbo].[ROLES] (
  [ID] tinyint DEFAULT ((6)) NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[ROLES] SET (LOCK_ESCALATION = AUTO)
GO

EXEC sp_addextendedproperty
'MS_Description', N' ',
'SCHEMA', N'dbo',
'TABLE', N'ROLES',
'COLUMN', N'ID'
GO


-- ----------------------------
-- Records of ROLES
-- ----------------------------
INSERT INTO [dbo].[ROLES] ([ID], [NOMBRE]) VALUES (N'1', N'ADMINISTRADOR')
GO

INSERT INTO [dbo].[ROLES] ([ID], [NOMBRE]) VALUES (N'2', N'RECEPCIONISTA')
GO

INSERT INTO [dbo].[ROLES] ([ID], [NOMBRE]) VALUES (N'3', N'MEDICO')
GO

INSERT INTO [dbo].[ROLES] ([ID], [NOMBRE]) VALUES (N'4', N'PACIENTE')
GO

INSERT INTO [dbo].[ROLES] ([ID], [NOMBRE]) VALUES (N'5', N'SISTEMAS')
GO


-- ----------------------------
-- Table structure for TIPOS_DOCUMENTOS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPOS_DOCUMENTOS]') AND type IN ('U'))
	DROP TABLE [dbo].[TIPOS_DOCUMENTOS]
GO

CREATE TABLE [dbo].[TIPOS_DOCUMENTOS] (
  [ID] int DEFAULT ((5)) NOT NULL,
  [NOMRE] varchar(6) COLLATE Modern_Spanish_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[TIPOS_DOCUMENTOS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TIPOS_DOCUMENTOS
-- ----------------------------
INSERT INTO [dbo].[TIPOS_DOCUMENTOS] ([ID], [NOMRE]) VALUES (N'1', N'DNI')
GO

INSERT INTO [dbo].[TIPOS_DOCUMENTOS] ([ID], [NOMRE]) VALUES (N'2', N'CI')
GO

INSERT INTO [dbo].[TIPOS_DOCUMENTOS] ([ID], [NOMRE]) VALUES (N'3', N'LE')
GO

INSERT INTO [dbo].[TIPOS_DOCUMENTOS] ([ID], [NOMRE]) VALUES (N'4', N'CUIT')
GO


-- ----------------------------
-- Table structure for TIPOS_ESTADOS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPOS_ESTADOS]') AND type IN ('U'))
	DROP TABLE [dbo].[TIPOS_ESTADOS]
GO

CREATE TABLE [dbo].[TIPOS_ESTADOS] (
  [ID] tinyint DEFAULT ((1)) NOT NULL,
  [NOMBRE] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[TIPOS_ESTADOS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TIPOS_ESTADOS
-- ----------------------------
INSERT INTO [dbo].[TIPOS_ESTADOS] ([ID], [NOMBRE]) VALUES (N'0', N'DISPONIBLE')
GO

INSERT INTO [dbo].[TIPOS_ESTADOS] ([ID], [NOMBRE]) VALUES (N'1', N'OCUPADO')
GO

INSERT INTO [dbo].[TIPOS_ESTADOS] ([ID], [NOMBRE]) VALUES (N'2', N'REPROGRAMADO')
GO

INSERT INTO [dbo].[TIPOS_ESTADOS] ([ID], [NOMBRE]) VALUES (N'3', N'CANCELADO')
GO


-- ----------------------------
-- Table structure for TURNOS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TURNOS]') AND type IN ('U'))
	DROP TABLE [dbo].[TURNOS]
GO

CREATE TABLE [dbo].[TURNOS] (
  [IDTURNO] bigint  IDENTITY(1,1) NOT NULL,
  [FECHAHORA] datetime  NOT NULL,
  [IDMEDICO] bigint  NOT NULL,
  [IDPACIENTE] bigint  NOT NULL,
  [OBSERVACIONES] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [IDESTADO] tinyint  NULL
)
GO

ALTER TABLE [dbo].[TURNOS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of TURNOS
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TURNOS] ON
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'1', N'1994-09-03 12:45:00.000', N'61', N'142', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'2', N'1994-09-09 10:32:00.000', N'57', N'101', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'3', N'1994-09-09 20:07:00.000', N'52', N'188', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'4', N'1994-10-31 00:37:00.000', N'15', N'107', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'5', N'1994-11-11 17:09:00.000', N'96', N'75', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'6', N'1994-12-08 12:13:00.000', N'39', N'109', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'7', N'1994-12-18 19:05:00.000', N'55', N'182', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'8', N'1994-12-24 02:40:00.000', N'50', N'156', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'9', N'1994-12-27 07:31:00.000', N'1', N'121', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'10', N'1995-01-02 12:16:00.000', N'53', N'172', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'11', N'1995-01-04 01:09:00.000', N'5', N'140', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'12', N'1995-02-20 12:45:00.000', N'11', N'87', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'13', N'1995-02-21 15:07:00.000', N'84', N'185', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'14', N'1995-03-06 09:21:00.000', N'89', N'38', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'15', N'1995-04-23 02:52:00.000', N'26', N'88', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'16', N'1995-06-09 04:32:00.000', N'5', N'2', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'17', N'1995-06-21 15:10:00.000', N'8', N'187', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'18', N'1995-07-05 14:43:00.000', N'89', N'41', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'19', N'1995-08-10 12:38:00.000', N'72', N'72', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'20', N'1995-09-06 08:28:00.000', N'61', N'121', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'21', N'1995-09-28 23:37:00.000', N'99', N'137', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'22', N'1995-11-03 12:55:00.000', N'9', N'56', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'23', N'1995-12-10 14:13:00.000', N'6', N'70', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'24', N'1995-12-12 13:29:00.000', N'29', N'169', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'25', N'1995-12-17 11:29:00.000', N'90', N'13', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'26', N'1995-12-19 06:54:00.000', N'56', N'34', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'27', N'1996-01-02 11:19:00.000', N'96', N'160', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'28', N'1996-01-09 22:23:00.000', N'43', N'13', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'29', N'1996-01-16 13:18:00.000', N'62', N'22', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'30', N'1996-03-05 23:17:00.000', N'77', N'44', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'31', N'1996-03-25 20:37:00.000', N'52', N'149', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'32', N'1996-04-12 08:37:00.000', N'72', N'140', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'33', N'1996-04-15 06:06:00.000', N'13', N'187', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'34', N'1996-04-15 23:28:00.000', N'55', N'44', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'35', N'1996-05-14 11:17:00.000', N'41', N'112', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'36', N'1996-05-15 09:12:00.000', N'85', N'56', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'37', N'1996-05-18 23:59:00.000', N'5', N'193', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'38', N'1996-06-05 15:08:00.000', N'86', N'95', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'39', N'1996-06-29 11:56:00.000', N'9', N'123', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'40', N'1996-07-08 17:02:00.000', N'22', N'48', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'41', N'1996-07-14 06:47:00.000', N'11', N'6', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'42', N'1996-07-29 01:24:00.000', N'26', N'155', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'43', N'1996-07-29 12:28:00.000', N'28', N'32', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'44', N'1996-08-14 15:05:00.000', N'54', N'37', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'45', N'1996-08-19 10:14:00.000', N'32', N'54', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'46', N'1996-09-14 01:31:00.000', N'76', N'39', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'47', N'1996-09-22 14:30:00.000', N'33', N'51', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'48', N'1996-10-15 05:15:00.000', N'47', N'82', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'49', N'1996-11-08 05:00:00.000', N'39', N'6', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'50', N'1996-11-16 06:02:00.000', N'33', N'37', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'51', N'1996-11-28 22:51:00.000', N'64', N'20', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'52', N'1996-12-08 14:21:00.000', N'96', N'38', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'53', N'1996-12-17 02:28:00.000', N'79', N'2', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'54', N'1997-01-16 21:53:00.000', N'54', N'179', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'55', N'1997-03-25 01:51:00.000', N'27', N'75', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'56', N'1997-04-01 05:37:00.000', N'14', N'67', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'57', N'1997-04-03 20:34:00.000', N'94', N'149', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'58', N'1997-04-04 20:55:00.000', N'26', N'113', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'59', N'1997-04-25 01:48:00.000', N'81', N'133', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'60', N'1997-06-27 10:53:00.000', N'6', N'191', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'61', N'1997-07-04 03:23:00.000', N'88', N'196', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'62', N'1997-07-22 00:00:00.000', N'46', N'33', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'63', N'1997-08-04 17:58:00.000', N'96', N'125', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'64', N'1997-09-01 20:46:00.000', N'11', N'179', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'65', N'1997-10-10 09:10:00.000', N'7', N'191', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'66', N'1997-10-20 16:24:00.000', N'30', N'78', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'67', N'1997-10-31 14:37:00.000', N'68', N'72', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'68', N'1997-11-05 14:59:00.000', N'20', N'170', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'69', N'1997-11-18 07:24:00.000', N'96', N'2', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'70', N'1997-11-19 23:05:00.000', N'68', N'82', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'71', N'1997-12-07 03:12:00.000', N'30', N'113', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'72', N'1997-12-08 13:25:00.000', N'65', N'34', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'73', N'1998-02-22 21:18:00.000', N'67', N'98', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'74', N'1998-03-18 07:07:00.000', N'55', N'164', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'75', N'1998-03-26 23:27:00.000', N'40', N'43', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'76', N'1998-04-07 02:26:00.000', N'79', N'47', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'77', N'1998-04-18 10:08:00.000', N'93', N'20', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'78', N'1998-06-04 00:45:00.000', N'2', N'88', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'79', N'1998-07-08 16:34:00.000', N'83', N'153', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'80', N'1998-08-01 15:09:00.000', N'72', N'191', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'81', N'1998-08-27 00:06:00.000', N'58', N'21', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'82', N'1998-09-08 19:32:00.000', N'61', N'5', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'83', N'1998-09-28 05:12:00.000', N'70', N'75', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'84', N'1998-10-10 15:07:00.000', N'98', N'150', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'85', N'1998-10-28 16:21:00.000', N'20', N'163', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'86', N'1998-10-31 16:55:00.000', N'99', N'192', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'87', N'1998-11-23 20:01:00.000', N'18', N'32', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'88', N'1998-12-02 00:06:00.000', N'60', N'108', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'89', N'1998-12-02 11:32:00.000', N'63', N'84', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'90', N'1998-12-16 11:14:00.000', N'49', N'3', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'91', N'1998-12-24 03:40:00.000', N'29', N'93', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'92', N'1999-01-06 20:18:00.000', N'64', N'57', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'93', N'1999-01-20 06:01:00.000', N'18', N'167', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'94', N'1999-02-11 20:04:00.000', N'16', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'95', N'1999-02-16 12:47:00.000', N'64', N'88', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'96', N'1999-02-28 04:27:00.000', N'17', N'102', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'97', N'1999-03-20 12:02:00.000', N'51', N'183', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'98', N'1999-03-23 11:52:00.000', N'47', N'4', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'99', N'1999-04-23 01:54:00.000', N'43', N'190', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'100', N'1999-05-01 19:08:00.000', N'6', N'17', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'101', N'1999-05-03 03:38:00.000', N'60', N'83', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'102', N'1999-05-05 00:37:00.000', N'10', N'71', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'103', N'1999-05-12 14:45:00.000', N'15', N'67', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'104', N'1999-05-16 20:43:00.000', N'97', N'50', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'105', N'1999-06-04 15:52:00.000', N'37', N'22', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'106', N'1999-07-05 05:45:00.000', N'6', N'15', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'107', N'1999-07-19 01:10:00.000', N'74', N'124', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'108', N'1999-07-27 22:03:00.000', N'47', N'26', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'109', N'1999-08-23 00:41:00.000', N'22', N'187', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'110', N'1999-09-01 08:33:00.000', N'32', N'152', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'111', N'1999-10-31 21:35:00.000', N'97', N'165', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'112', N'1999-11-24 12:57:00.000', N'26', N'85', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'113', N'1999-11-28 17:48:00.000', N'48', N'91', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'114', N'1999-11-30 02:32:00.000', N'38', N'29', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'115', N'1999-12-02 14:37:00.000', N'10', N'66', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'116', N'1999-12-09 07:42:00.000', N'42', N'38', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'117', N'1999-12-12 03:39:00.000', N'20', N'160', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'118', N'1999-12-30 18:27:00.000', N'46', N'138', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'119', N'2000-01-11 22:41:00.000', N'89', N'83', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'120', N'2000-01-14 04:45:00.000', N'77', N'173', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'121', N'2000-01-16 17:04:00.000', N'85', N'76', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'122', N'2000-01-16 18:10:00.000', N'53', N'73', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'123', N'2000-01-17 05:04:00.000', N'19', N'143', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'124', N'2000-02-08 18:52:00.000', N'55', N'84', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'125', N'2000-02-18 13:53:00.000', N'92', N'32', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'126', N'2000-03-07 00:21:00.000', N'1', N'187', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'127', N'2000-03-08 16:21:00.000', N'80', N'171', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'128', N'2000-04-04 07:17:00.000', N'29', N'71', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'129', N'2000-04-17 01:58:00.000', N'85', N'38', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'130', N'2000-04-30 17:38:00.000', N'37', N'38', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'131', N'2000-05-05 18:48:00.000', N'41', N'30', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'132', N'2000-05-06 09:56:00.000', N'92', N'15', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'133', N'2000-05-31 06:51:00.000', N'9', N'29', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'134', N'2000-06-29 17:33:00.000', N'24', N'156', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'135', N'2000-07-10 05:26:00.000', N'96', N'78', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'136', N'2000-07-21 13:01:00.000', N'51', N'178', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'137', N'2000-07-24 15:51:00.000', N'79', N'156', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'138', N'2000-08-10 02:20:00.000', N'49', N'55', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'139', N'2000-08-10 13:42:00.000', N'23', N'148', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'140', N'2000-10-07 12:26:00.000', N'2', N'3', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'141', N'2000-11-11 23:44:00.000', N'38', N'23', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'142', N'2000-11-18 06:06:00.000', N'79', N'199', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'143', N'2000-11-19 23:05:00.000', N'21', N'164', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'144', N'2000-12-31 03:47:00.000', N'37', N'66', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'145', N'2001-01-12 07:54:00.000', N'22', N'29', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'146', N'2001-04-03 23:09:00.000', N'78', N'167', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'147', N'2001-04-08 16:46:00.000', N'65', N'29', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'148', N'2001-04-17 03:18:00.000', N'3', N'14', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'149', N'2001-04-27 22:35:00.000', N'9', N'116', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'150', N'2001-04-30 02:44:00.000', N'10', N'119', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'151', N'2001-05-18 05:56:00.000', N'91', N'17', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'152', N'2001-05-18 11:05:00.000', N'49', N'191', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'153', N'2001-07-16 11:07:00.000', N'84', N'156', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'154', N'2001-07-16 17:57:00.000', N'1', N'126', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'155', N'2001-07-18 14:21:00.000', N'45', N'9', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'156', N'2001-07-20 13:22:00.000', N'66', N'46', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'157', N'2001-08-18 15:46:00.000', N'25', N'113', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'158', N'2001-08-23 02:42:00.000', N'13', N'51', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'159', N'2001-08-28 09:12:00.000', N'35', N'96', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'160', N'2001-09-04 07:20:00.000', N'73', N'33', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'161', N'2001-09-10 02:00:00.000', N'3', N'118', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'162', N'2001-09-15 21:00:00.000', N'32', N'32', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'163', N'2001-10-06 17:59:00.000', N'31', N'104', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'164', N'2001-10-12 09:00:00.000', N'48', N'137', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'165', N'2001-12-11 01:58:00.000', N'75', N'107', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'166', N'2002-01-08 16:03:00.000', N'43', N'10', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'167', N'2002-01-09 21:15:00.000', N'68', N'79', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'168', N'2002-01-22 21:51:00.000', N'15', N'117', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'169', N'2002-02-23 16:10:00.000', N'42', N'79', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'170', N'2002-03-01 01:36:00.000', N'61', N'36', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'171', N'2002-04-11 10:03:00.000', N'7', N'133', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'172', N'2002-04-24 23:17:00.000', N'24', N'174', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'173', N'2002-05-28 11:03:00.000', N'92', N'89', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'174', N'2002-06-22 18:55:00.000', N'52', N'89', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'175', N'2002-07-11 06:34:00.000', N'12', N'173', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'176', N'2002-07-16 14:08:00.000', N'65', N'172', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'177', N'2002-07-20 05:35:00.000', N'71', N'190', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'178', N'2002-07-23 08:43:00.000', N'70', N'147', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'179', N'2002-08-01 07:52:00.000', N'96', N'110', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'180', N'2002-08-02 09:32:00.000', N'7', N'16', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'181', N'2002-09-17 16:35:00.000', N'6', N'125', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'182', N'2002-09-20 18:21:00.000', N'31', N'55', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'183', N'2002-11-05 02:36:00.000', N'50', N'172', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'184', N'2002-11-06 04:22:00.000', N'9', N'96', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'185', N'2002-11-14 01:32:00.000', N'11', N'37', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'186', N'2002-11-19 17:39:00.000', N'43', N'104', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'187', N'2002-11-25 16:25:00.000', N'37', N'136', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'188', N'2002-12-20 00:23:00.000', N'8', N'15', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'189', N'2003-02-16 05:58:00.000', N'44', N'46', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'190', N'2003-03-01 12:02:00.000', N'84', N'73', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'191', N'2003-05-07 06:13:00.000', N'42', N'158', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'192', N'2003-08-31 07:15:00.000', N'12', N'23', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'193', N'2003-09-01 14:30:00.000', N'34', N'70', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'194', N'2003-10-07 19:44:00.000', N'76', N'5', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'195', N'2003-10-13 12:24:00.000', N'53', N'159', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'196', N'2003-10-18 21:04:00.000', N'29', N'131', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'197', N'2003-11-15 17:09:00.000', N'20', N'149', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'198', N'2003-11-25 07:05:00.000', N'43', N'69', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'199', N'2003-12-07 18:55:00.000', N'44', N'73', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'200', N'2004-01-03 02:07:00.000', N'62', N'151', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'201', N'2004-01-07 15:06:00.000', N'40', N'36', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'202', N'2004-02-08 04:59:00.000', N'52', N'62', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'203', N'2004-03-15 16:16:00.000', N'100', N'23', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'204', N'2004-03-18 23:07:00.000', N'76', N'158', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'205', N'2004-04-04 17:27:00.000', N'6', N'58', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'206', N'2004-04-08 06:57:00.000', N'98', N'38', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'207', N'2004-04-21 03:10:00.000', N'82', N'142', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'208', N'2004-06-10 14:25:00.000', N'90', N'86', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'209', N'2004-06-23 14:03:00.000', N'9', N'156', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'210', N'2004-07-01 10:10:00.000', N'95', N'171', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'211', N'2004-07-22 15:14:00.000', N'82', N'190', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'212', N'2004-08-01 04:03:00.000', N'65', N'33', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'213', N'2004-08-14 23:11:00.000', N'25', N'198', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'214', N'2004-08-16 01:19:00.000', N'16', N'120', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'215', N'2004-08-24 16:45:00.000', N'28', N'133', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'216', N'2004-09-06 01:11:00.000', N'76', N'200', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'217', N'2004-09-07 19:04:00.000', N'29', N'165', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'218', N'2004-09-28 05:25:00.000', N'46', N'70', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'219', N'2004-10-09 01:28:00.000', N'64', N'122', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'220', N'2004-12-07 06:44:00.000', N'31', N'147', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'221', N'2004-12-07 18:50:00.000', N'10', N'43', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'222', N'2004-12-12 02:28:00.000', N'75', N'124', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'223', N'2004-12-20 18:29:00.000', N'91', N'41', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'224', N'2005-01-08 04:03:00.000', N'79', N'182', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'225', N'2005-02-20 00:30:00.000', N'87', N'56', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'226', N'2005-03-10 13:10:00.000', N'91', N'183', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'227', N'2005-03-10 23:27:00.000', N'40', N'121', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'228', N'2005-05-07 12:51:00.000', N'44', N'35', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'229', N'2005-05-15 09:29:00.000', N'76', N'163', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'230', N'2005-05-20 04:59:00.000', N'41', N'5', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'231', N'2005-05-20 07:56:00.000', N'95', N'176', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'232', N'2005-06-13 13:08:00.000', N'30', N'91', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'233', N'2005-06-23 18:40:00.000', N'91', N'132', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'234', N'2005-06-26 11:18:00.000', N'99', N'13', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'235', N'2005-08-18 08:07:00.000', N'5', N'171', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'236', N'2005-08-23 07:26:00.000', N'57', N'62', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'237', N'2005-09-09 11:10:00.000', N'96', N'164', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'238', N'2005-09-25 19:51:00.000', N'67', N'149', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'239', N'2005-09-29 07:35:00.000', N'57', N'93', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'240', N'2005-10-04 17:32:00.000', N'19', N'64', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'241', N'2005-10-26 12:22:00.000', N'46', N'163', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'242', N'2005-11-11 04:24:00.000', N'6', N'121', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'243', N'2005-11-18 01:37:00.000', N'13', N'8', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'244', N'2005-11-30 10:50:00.000', N'57', N'129', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'245', N'2005-12-21 08:09:00.000', N'88', N'66', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'246', N'2006-01-05 20:34:00.000', N'22', N'82', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'247', N'2006-01-07 12:51:00.000', N'10', N'50', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'248', N'2006-01-28 16:15:00.000', N'49', N'90', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'249', N'2006-01-30 21:00:00.000', N'20', N'191', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'250', N'2006-02-15 01:14:00.000', N'6', N'52', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'251', N'2006-04-17 05:01:00.000', N'44', N'33', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'252', N'2006-04-17 22:27:00.000', N'50', N'160', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'253', N'2006-04-25 12:42:00.000', N'6', N'97', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'254', N'2006-07-14 15:00:00.000', N'75', N'87', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'255', N'2006-07-17 17:41:00.000', N'48', N'84', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'256', N'2006-07-22 02:08:00.000', N'98', N'159', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'257', N'2006-08-11 15:58:00.000', N'90', N'10', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'258', N'2006-08-14 13:56:00.000', N'65', N'113', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'259', N'2006-09-11 13:28:00.000', N'32', N'91', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'260', N'2006-11-17 11:54:00.000', N'52', N'92', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'261', N'2006-12-12 06:52:00.000', N'25', N'184', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'262', N'2007-02-05 19:14:00.000', N'78', N'82', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'263', N'2007-04-03 17:15:00.000', N'55', N'150', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'264', N'2007-04-06 00:26:00.000', N'21', N'96', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'265', N'2007-04-27 06:51:00.000', N'87', N'160', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'266', N'2007-04-27 15:45:00.000', N'85', N'154', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'267', N'2007-07-13 12:46:00.000', N'34', N'113', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'268', N'2007-08-09 03:58:00.000', N'76', N'185', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'269', N'2007-08-11 20:43:00.000', N'3', N'43', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'270', N'2007-08-20 00:00:00.000', N'84', N'68', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'271', N'2007-09-08 16:22:00.000', N'26', N'97', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'272', N'2007-09-10 21:34:00.000', N'36', N'102', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'273', N'2007-10-01 17:36:00.000', N'22', N'57', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'274', N'2007-10-04 16:47:00.000', N'17', N'37', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'275', N'2007-10-06 14:46:00.000', N'55', N'1', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'276', N'2007-10-21 17:19:00.000', N'58', N'53', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'277', N'2007-10-27 18:39:00.000', N'21', N'124', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'278', N'2007-11-16 00:31:00.000', N'8', N'44', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'279', N'2007-12-08 04:55:00.000', N'18', N'87', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'280', N'2007-12-09 10:22:00.000', N'36', N'136', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'281', N'2008-01-04 22:45:00.000', N'80', N'8', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'282', N'2008-02-03 08:16:00.000', N'64', N'157', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'283', N'2008-02-03 13:50:00.000', N'67', N'68', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'284', N'2008-02-25 06:37:00.000', N'31', N'176', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'285', N'2008-02-25 14:41:00.000', N'45', N'27', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'286', N'2008-03-12 23:04:00.000', N'97', N'48', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'287', N'2008-03-30 20:33:00.000', N'21', N'22', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'288', N'2008-05-01 13:54:00.000', N'74', N'10', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'289', N'2008-05-02 06:09:00.000', N'87', N'174', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'290', N'2008-05-13 14:30:00.000', N'90', N'12', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'291', N'2008-05-31 11:15:00.000', N'42', N'3', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'292', N'2008-06-26 23:28:00.000', N'79', N'45', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'293', N'2008-07-28 18:10:00.000', N'53', N'121', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'294', N'2008-08-05 21:05:00.000', N'35', N'91', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'295', N'2008-08-16 22:49:00.000', N'65', N'43', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'296', N'2008-08-19 14:58:00.000', N'11', N'128', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'297', N'2008-08-27 03:45:00.000', N'63', N'108', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'298', N'2008-09-27 04:06:00.000', N'46', N'5', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'299', N'2008-10-01 10:41:00.000', N'20', N'27', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'300', N'2008-10-19 22:18:00.000', N'36', N'151', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'301', N'2008-12-10 19:04:00.000', N'46', N'28', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'302', N'2008-12-13 19:13:00.000', N'70', N'2', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'303', N'2008-12-24 15:29:00.000', N'52', N'106', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'304', N'2009-01-21 12:26:00.000', N'27', N'16', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'305', N'2009-02-17 22:55:00.000', N'92', N'46', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'306', N'2009-02-21 09:53:00.000', N'64', N'178', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'307', N'2009-04-18 00:40:00.000', N'79', N'92', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'308', N'2009-04-27 22:17:00.000', N'8', N'26', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'309', N'2009-05-10 08:42:00.000', N'13', N'191', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'310', N'2009-05-25 09:40:00.000', N'41', N'129', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'311', N'2009-05-29 08:29:00.000', N'52', N'133', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'312', N'2009-06-08 15:10:00.000', N'60', N'165', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'313', N'2009-06-11 07:42:00.000', N'46', N'48', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'314', N'2009-06-18 16:58:00.000', N'42', N'193', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'315', N'2009-06-20 23:33:00.000', N'68', N'160', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'316', N'2009-06-21 03:33:00.000', N'89', N'125', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'317', N'2009-07-05 16:17:00.000', N'95', N'148', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'318', N'2009-07-24 04:11:00.000', N'56', N'55', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'319', N'2009-10-23 20:06:00.000', N'47', N'36', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'320', N'2009-11-16 00:05:00.000', N'81', N'170', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'321', N'2009-11-20 10:56:00.000', N'50', N'117', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'322', N'2009-12-11 14:17:00.000', N'73', N'76', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'323', N'2009-12-11 15:05:00.000', N'57', N'119', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'324', N'2009-12-24 11:41:00.000', N'39', N'118', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'325', N'2010-01-20 05:24:00.000', N'94', N'196', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'326', N'2010-01-25 10:46:00.000', N'98', N'76', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'327', N'2010-02-06 20:44:00.000', N'53', N'107', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'328', N'2010-04-05 18:17:00.000', N'3', N'121', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'329', N'2010-04-06 08:24:00.000', N'45', N'197', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'330', N'2010-04-16 12:31:00.000', N'33', N'170', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'331', N'2010-04-23 17:09:00.000', N'86', N'71', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'332', N'2010-04-28 11:36:00.000', N'58', N'18', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'333', N'2010-04-30 22:25:00.000', N'74', N'82', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'334', N'2010-05-01 13:21:00.000', N'81', N'12', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'335', N'2010-05-25 09:36:00.000', N'73', N'148', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'336', N'2010-05-30 23:25:00.000', N'49', N'56', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'337', N'2010-07-11 21:07:00.000', N'6', N'22', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'338', N'2010-07-27 19:58:00.000', N'6', N'170', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'339', N'2010-08-13 12:29:00.000', N'55', N'195', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'340', N'2010-09-18 17:16:00.000', N'89', N'7', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'341', N'2010-10-19 03:57:00.000', N'10', N'164', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'342', N'2010-10-24 13:16:00.000', N'96', N'148', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'343', N'2010-11-04 21:17:00.000', N'75', N'186', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'344', N'2010-11-08 06:39:00.000', N'71', N'87', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'345', N'2010-12-24 02:02:00.000', N'45', N'120', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'346', N'2010-12-30 19:01:00.000', N'9', N'158', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'347', N'2011-01-13 23:36:00.000', N'52', N'50', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'348', N'2011-01-22 11:41:00.000', N'67', N'128', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'349', N'2011-01-29 05:10:00.000', N'16', N'4', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'350', N'2011-02-04 00:13:00.000', N'51', N'155', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'351', N'2011-02-06 20:00:00.000', N'32', N'31', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'352', N'2011-03-02 04:54:00.000', N'74', N'107', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'353', N'2011-03-08 09:59:00.000', N'43', N'39', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'354', N'2011-03-20 13:09:00.000', N'39', N'82', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'355', N'2011-04-01 11:11:00.000', N'24', N'181', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'356', N'2011-04-05 19:11:00.000', N'32', N'86', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'357', N'2011-04-11 22:47:00.000', N'79', N'54', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'358', N'2011-04-25 04:16:00.000', N'18', N'84', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'359', N'2011-05-29 21:44:00.000', N'16', N'96', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'360', N'2011-06-02 21:55:00.000', N'42', N'198', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'361', N'2011-06-10 09:13:00.000', N'12', N'6', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'362', N'2011-06-15 07:36:00.000', N'91', N'13', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'363', N'2011-06-30 19:29:00.000', N'23', N'48', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'364', N'2011-07-01 10:39:00.000', N'17', N'31', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'365', N'2011-07-07 12:06:00.000', N'48', N'17', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'366', N'2011-07-08 11:39:00.000', N'54', N'169', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'367', N'2011-08-02 11:00:00.000', N'27', N'3', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'368', N'2011-09-24 07:46:00.000', N'76', N'30', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'369', N'2011-09-24 18:36:00.000', N'32', N'191', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'370', N'2011-10-05 16:36:00.000', N'57', N'22', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'371', N'2011-11-04 00:00:00.000', N'89', N'190', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'372', N'2011-12-03 16:27:00.000', N'34', N'136', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'373', N'2011-12-04 18:50:00.000', N'53', N'68', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'374', N'2011-12-13 09:19:00.000', N'52', N'36', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'375', N'2011-12-24 14:11:00.000', N'32', N'141', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'376', N'2012-01-07 12:16:00.000', N'11', N'178', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'377', N'2012-01-10 22:46:00.000', N'98', N'108', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'378', N'2012-02-25 21:33:00.000', N'31', N'149', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'379', N'2012-04-04 06:27:00.000', N'40', N'50', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'380', N'2012-04-07 15:58:00.000', N'7', N'148', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'381', N'2012-04-23 01:01:00.000', N'83', N'117', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'382', N'2012-06-09 20:09:00.000', N'78', N'140', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'383', N'2012-06-17 19:49:00.000', N'93', N'68', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'384', N'2012-06-25 01:16:00.000', N'69', N'181', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'385', N'2012-06-28 05:37:00.000', N'82', N'85', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'386', N'2012-07-24 16:05:00.000', N'39', N'127', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'387', N'2012-09-26 21:10:00.000', N'67', N'10', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'388', N'2012-09-28 07:58:00.000', N'92', N'77', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'389', N'2012-09-29 10:44:00.000', N'8', N'124', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'390', N'2012-10-20 16:59:00.000', N'98', N'175', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'391', N'2012-11-02 21:05:00.000', N'95', N'33', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'392', N'2012-12-13 15:19:00.000', N'55', N'90', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'393', N'2012-12-19 00:07:00.000', N'26', N'55', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'394', N'2013-01-06 01:28:00.000', N'72', N'146', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'395', N'2013-01-26 13:50:00.000', N'21', N'146', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'396', N'2013-01-29 13:03:00.000', N'50', N'83', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'397', N'2013-02-23 10:22:00.000', N'98', N'90', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'398', N'2013-03-05 02:43:00.000', N'86', N'110', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'399', N'2013-03-20 04:49:00.000', N'7', N'10', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'400', N'2013-03-23 14:58:00.000', N'34', N'129', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'401', N'2013-04-03 20:11:00.000', N'38', N'132', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'402', N'2013-05-04 22:32:00.000', N'75', N'146', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'403', N'2013-05-08 00:39:00.000', N'62', N'182', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'404', N'2013-05-10 08:16:00.000', N'89', N'65', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'405', N'2013-06-09 13:59:00.000', N'39', N'120', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'406', N'2013-06-11 15:43:00.000', N'65', N'136', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'407', N'2013-06-16 19:43:00.000', N'44', N'92', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'408', N'2013-07-03 11:18:00.000', N'18', N'189', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'409', N'2013-07-21 16:13:00.000', N'79', N'177', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'410', N'2013-08-09 14:34:00.000', N'66', N'134', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'411', N'2013-08-23 17:56:00.000', N'91', N'187', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'412', N'2013-08-24 05:40:00.000', N'11', N'146', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'413', N'2013-09-08 21:08:00.000', N'43', N'49', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'414', N'2013-09-20 08:26:00.000', N'99', N'138', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'415', N'2013-09-20 09:46:00.000', N'62', N'67', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'416', N'2013-11-14 19:43:00.000', N'3', N'69', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'417', N'2013-11-17 08:33:00.000', N'8', N'55', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'418', N'2013-12-07 23:50:00.000', N'23', N'81', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'419', N'2013-12-23 23:02:00.000', N'10', N'197', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'420', N'2014-01-17 07:05:00.000', N'77', N'74', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'421', N'2014-01-19 06:33:00.000', N'33', N'175', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'422', N'2014-01-22 12:51:00.000', N'60', N'182', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'423', N'2014-01-23 17:57:00.000', N'65', N'66', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'424', N'2014-01-29 08:21:00.000', N'28', N'54', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'425', N'2014-01-29 16:02:00.000', N'55', N'160', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'426', N'2014-02-02 00:51:00.000', N'55', N'165', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'427', N'2014-03-18 01:25:00.000', N'48', N'48', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'428', N'2014-03-21 21:09:00.000', N'70', N'144', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'429', N'2014-05-22 14:38:00.000', N'16', N'127', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'430', N'2014-06-20 10:01:00.000', N'57', N'64', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'431', N'2014-07-12 08:30:00.000', N'87', N'118', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'432', N'2014-07-30 23:59:00.000', N'37', N'46', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'433', N'2014-08-22 18:43:00.000', N'68', N'101', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'434', N'2014-08-27 00:18:00.000', N'40', N'30', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'435', N'2014-09-03 00:41:00.000', N'31', N'122', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'436', N'2014-09-06 08:40:00.000', N'20', N'91', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'437', N'2014-09-16 12:52:00.000', N'46', N'29', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'438', N'2014-09-18 08:11:00.000', N'70', N'132', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'439', N'2014-10-07 18:51:00.000', N'17', N'128', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'440', N'2014-10-18 09:37:00.000', N'7', N'78', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'441', N'2014-11-04 10:27:00.000', N'42', N'68', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'442', N'2014-11-24 04:35:00.000', N'3', N'76', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'443', N'2014-12-01 08:19:00.000', N'29', N'147', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'444', N'2014-12-27 17:35:00.000', N'55', N'67', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'445', N'2015-01-02 19:38:00.000', N'94', N'27', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'446', N'2015-01-23 21:04:00.000', N'44', N'56', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'447', N'2015-02-09 05:37:00.000', N'62', N'166', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'448', N'2015-02-11 00:17:00.000', N'56', N'176', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'449', N'2015-02-11 20:39:00.000', N'9', N'140', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'450', N'2015-02-15 02:10:00.000', N'3', N'90', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'451', N'2015-02-22 18:17:00.000', N'83', N'107', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'452', N'2015-02-23 22:18:00.000', N'74', N'149', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'453', N'2015-02-26 05:15:00.000', N'68', N'143', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'454', N'2015-03-03 06:07:00.000', N'3', N'199', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'455', N'2015-03-06 10:27:00.000', N'88', N'57', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'456', N'2015-03-31 11:30:00.000', N'19', N'97', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'457', N'2015-04-14 14:33:00.000', N'92', N'90', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'458', N'2015-04-17 03:18:00.000', N'94', N'130', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'459', N'2015-06-13 16:38:00.000', N'9', N'126', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'460', N'2015-06-27 20:30:00.000', N'96', N'109', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'461', N'2015-08-08 06:44:00.000', N'16', N'2', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'462', N'2015-08-24 00:06:00.000', N'87', N'172', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'463', N'2015-09-04 07:31:00.000', N'22', N'103', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'464', N'2015-10-05 15:43:00.000', N'14', N'12', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'465', N'2015-10-06 08:31:00.000', N'82', N'76', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'466', N'2015-11-12 14:04:00.000', N'77', N'68', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'467', N'2015-12-21 07:00:00.000', N'46', N'11', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'468', N'2015-12-24 06:51:00.000', N'62', N'150', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'469', N'2016-01-30 10:32:00.000', N'48', N'96', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'470', N'2016-02-18 05:17:00.000', N'34', N'154', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'471', N'2016-04-10 16:48:00.000', N'19', N'81', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'472', N'2016-04-25 16:54:00.000', N'70', N'102', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'473', N'2016-05-04 02:20:00.000', N'89', N'46', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'474', N'2016-05-07 10:13:00.000', N'6', N'79', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'475', N'2016-05-22 19:56:00.000', N'40', N'81', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'476', N'2016-06-25 01:25:00.000', N'39', N'9', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'477', N'2016-06-26 20:45:00.000', N'83', N'127', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'478', N'2016-07-27 18:01:00.000', N'53', N'61', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'479', N'2016-08-23 01:01:00.000', N'49', N'81', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'480', N'2016-08-26 11:25:00.000', N'31', N'28', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'481', N'2016-09-03 06:20:00.000', N'72', N'87', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'482', N'2016-09-06 03:11:00.000', N'50', N'41', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'483', N'2016-11-23 10:43:00.000', N'64', N'154', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'484', N'2017-02-05 04:44:00.000', N'42', N'136', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'485', N'2017-02-06 17:21:00.000', N'34', N'156', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'486', N'2017-02-11 03:50:00.000', N'48', N'189', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'487', N'2017-03-08 12:10:00.000', N'7', N'75', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'488', N'2017-04-07 18:54:00.000', N'1', N'120', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'489', N'2017-04-14 10:49:00.000', N'29', N'31', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'490', N'2017-06-03 12:46:00.000', N'24', N'136', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'491', N'2017-06-14 11:35:00.000', N'59', N'90', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'492', N'2017-06-27 05:14:00.000', N'51', N'136', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'493', N'2017-07-02 02:47:00.000', N'60', N'100', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'494', N'2017-07-03 20:45:00.000', N'21', N'58', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'495', N'2017-07-04 11:12:00.000', N'9', N'161', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'496', N'2017-07-07 20:23:00.000', N'18', N'112', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'497', N'2017-07-30 10:01:00.000', N'84', N'138', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'498', N'2017-08-22 13:57:00.000', N'19', N'151', NULL, N'1')
GO

INSERT INTO [dbo].[TURNOS] ([IDTURNO], [FECHAHORA], [IDMEDICO], [IDPACIENTE], [OBSERVACIONES], [IDESTADO]) VALUES (N'499', N'2017-08-27 20:21:00.000', N'60', N'168', NULL, N'1')
GO

SET IDENTITY_INSERT [dbo].[TURNOS] OFF
GO


-- ----------------------------
-- Table structure for USUARIOS
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS]') AND type IN ('U'))
	DROP TABLE [dbo].[USUARIOS]
GO

CREATE TABLE [dbo].[USUARIOS] (
  [IDUSUARIO] int  IDENTITY(1,1) NOT NULL,
  [IDROL] int  NOT NULL,
  [USERNAME] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [PASSWORD] varchar(255) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [ESTADO] bit  NOT NULL,
  [ULTIMOLOGIN] datetime DEFAULT (getdate()) NOT NULL,
  [IP] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [IMAGEN] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [DNI] varchar(13) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [IDTIPODOC] tinyint  NOT NULL
)
GO

ALTER TABLE [dbo].[USUARIOS] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of USUARIOS
-- ----------------------------
SET IDENTITY_INSERT [dbo].[USUARIOS] ON
GO

INSERT INTO [dbo].[USUARIOS] ([IDUSUARIO], [IDROL], [USERNAME], [PASSWORD], [ESTADO], [ULTIMOLOGIN], [IP], [IMAGEN], [DNI], [IDTIPODOC]) VALUES (N'1', N'1', N'eli@caeli.com.ar', N'$dassf44541ds$sfqawda552wq$qPAdf15Asd', N'1', N'2021-06-16 22:25:35.227', N'127.20.0.', N'adas', N'11111', N'1')
GO

INSERT INTO [dbo].[USUARIOS] ([IDUSUARIO], [IDROL], [USERNAME], [PASSWORD], [ESTADO], [ULTIMOLOGIN], [IP], [IMAGEN], [DNI], [IDTIPODOC]) VALUES (N'2', N'1', N'eugenio@arevalo.com.ar', N'$2y$08$vtYEH68Zx.PGirDrVFoPEOhr8s1zGy6', N'1', N'2021-06-16 22:26:08.083', N'125..252', N'asdasd', N'22222', N'1')
GO

SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
GO


-- ----------------------------
-- Auto increment value for CONVENIOS
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[CONVENIOS]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table CONVENIOS
-- ----------------------------
ALTER TABLE [dbo].[CONVENIOS] ADD CONSTRAINT [PK__CONVENIO__3214EC276068C359] PRIMARY KEY CLUSTERED ([IDCONVENIO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for DIAS_Y_HORARIOS
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[DIAS_Y_HORARIOS]', RESEED, 10)
GO


-- ----------------------------
-- Primary Key structure for table DIAS_Y_HORARIOS
-- ----------------------------
ALTER TABLE [dbo].[DIAS_Y_HORARIOS] ADD CONSTRAINT [PK__DIAS_Y_H__3214EC2743D0CF82] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for ESPECIALIDAD_X_MEDICO
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ESPECIALIDAD_X_MEDICO]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table ESPECIALIDAD_X_MEDICO
-- ----------------------------
ALTER TABLE [dbo].[ESPECIALIDAD_X_MEDICO] ADD CONSTRAINT [PK__ESPECIAL__3214EC27900A0662] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for ESPECIALIDADES
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ESPECIALIDADES]', RESEED, 22)
GO


-- ----------------------------
-- Primary Key structure for table ESPECIALIDADES
-- ----------------------------
ALTER TABLE [dbo].[ESPECIALIDADES] ADD CONSTRAINT [PK__ESPECIAL__08AA2A04C636D033] PRIMARY KEY CLUSTERED ([IDESPECIALIDAD])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table mails_prestadores
-- ----------------------------
ALTER TABLE [dbo].[mails_prestadores] ADD CONSTRAINT [PK__mails_pr__3213E83F097D9695] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for MEDICOS
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[MEDICOS]', RESEED, 103)
GO


-- ----------------------------
-- Checks structure for table MEDICOS
-- ----------------------------
ALTER TABLE [dbo].[MEDICOS] ADD CONSTRAINT [seo] CHECK ([SEXO]='F' OR [SEXO]='M')
GO


-- ----------------------------
-- Primary Key structure for table MEDICOS
-- ----------------------------
ALTER TABLE [dbo].[MEDICOS] ADD CONSTRAINT [PK__MEDICOS__B8874AE43D3AAC27] PRIMARY KEY CLUSTERED ([IDMEDICO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for OBRAS_SOCIALES
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[OBRAS_SOCIALES]', RESEED, 13)
GO


-- ----------------------------
-- Primary Key structure for table OBRAS_SOCIALES
-- ----------------------------
ALTER TABLE [dbo].[OBRAS_SOCIALES] ADD CONSTRAINT [PK__OBRAS_SO__F287F6AFF6AC16D6] PRIMARY KEY CLUSTERED ([IDOBRASOCIAL])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for PACIENTES
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[PACIENTES]', RESEED, 234)
GO


-- ----------------------------
-- Primary Key structure for table PACIENTES
-- ----------------------------
ALTER TABLE [dbo].[PACIENTES] ADD CONSTRAINT [PK__paciente__D1D53BB9EB19E63A] PRIMARY KEY CLUSTERED ([IDPACIENTE])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for PLANES_X_OS
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[PLANES_X_OS]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table PLANES_X_OS
-- ----------------------------
ALTER TABLE [dbo].[PLANES_X_OS] ADD CONSTRAINT [PK__PLANES_X__3214EC27B9CBBDFC] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table ROLES
-- ----------------------------
ALTER TABLE [dbo].[ROLES] ADD CONSTRAINT [PK__ROLES__3214EC27D61ADF86] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TIPOS_DOCUMENTOS
-- ----------------------------
ALTER TABLE [dbo].[TIPOS_DOCUMENTOS] ADD CONSTRAINT [PK__TIPOSDOC__3214EC27AB471024] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TIPOS_ESTADOS
-- ----------------------------
ALTER TABLE [dbo].[TIPOS_ESTADOS] ADD CONSTRAINT [PK__TIPOS_ES__3214EC27E3B6988B] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for TURNOS
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TURNOS]', RESEED, 499)
GO


-- ----------------------------
-- Uniques structure for table TURNOS
-- ----------------------------
ALTER TABLE [dbo].[TURNOS] ADD CONSTRAINT [PACIENTE_HORA] UNIQUE NONCLUSTERED ([IDPACIENTE] ASC, [FECHAHORA] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

EXEC sp_addextendedproperty
'MS_Description', N'SOLO PUEDE TENER UN TURNO EL MISMO DIA Y ALA MISMA HORA',
'SCHEMA', N'dbo',
'TABLE', N'TURNOS',
'CONSTRAINT', N'PACIENTE_HORA'
GO


-- ----------------------------
-- Primary Key structure for table TURNOS
-- ----------------------------
ALTER TABLE [dbo].[TURNOS] ADD CONSTRAINT [PK__TURNOS__95839F86D6BDDD53] PRIMARY KEY CLUSTERED ([FECHAHORA], [IDPACIENTE])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for USUARIOS
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[USUARIOS]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table USUARIOS
-- ----------------------------
ALTER TABLE [dbo].[USUARIOS] ADD CONSTRAINT [PK__USUARIOS__C035B8DC68193D95] PRIMARY KEY CLUSTERED ([IDUSUARIO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


--Soit la table PERSONNEL(Nom, Role) qui rassemble les membres du personnel d'un cirque. On souhaite déterminer la proportion de jongleurs parmi eux.   
--1. Créer et alimenter cette table avec un jeu de données.  
--2. Ecrire un bloc PL/SQL anonyme permettant de :  
--• compter le nombre de n-uplets dans la table PERSONNEL et stocker le résultat dans une variable ;
--• compter le nombre d'employés dont le rôle est « Jongleur » dans la table PERSONNEL et stocker le résultat dans une deuxième variable ; 
--• calculer la proportion (en pourcentage), stocker le résultat dans une troisième variable et afficher le résultat à l'écran.  
--3. Inclure dans le programme précédent un traitement d'exception permettant de détecter si la table PERSONNEL est vide,
--c'est-à-dire, que le nombre total de n-uplets dans PERSONNEL est égal à zéro. Dans ce cas, déclencher une erreur fatale.
--Tester en effaçant tout le contenu de la table PERSONNEL. 


create table PERSONNEL
(v_nom VARCHAR2(15), v_role varchar2(20),
constraint pk_PERSONNEL_v_nom primary key (v_nom));

INSERT INTO PERSONNEL VALUES ('martin','jongleur');
INSERT INTO PERSONNEL VALUES ('marion','steak');
INSERT INTO PERSONNEL VALUES ('jeremie','lion');
INSERT INTO PERSONNEL VALUES ('kevin','dompteur');
INSERT INTO PERSONNEL VALUES ('fanny','steak');
INSERT INTO PERSONNEL VALUES ('guillaume','jongleur');
INSERT INTO PERSONNEL VALUES ('christophe','techniciendesurface');

select count (*) from PERSONNEL;

set serveroutput on
DECLARE
v_nbPersonnes NUMBER(3);
v_nbJongleurs NUMBER(3);
v_pourcentage NUMBER(5,2);
BEGIN
v_nbPersonnes:=0;
v_nbJongleurs:=0;
v_pourcentage:=0;

SELECT COUNT (*)  INTO v_nbPersonnes
FROM PERSONNEL ;

SELECT COUNT (*) INTO v_nbJongleurs
FROM PERSONNEL
WHERE  v_role='jongleur';

select (v_nbJongleurs*100/v_nbPersonnes) INTO v_pourcentage
FROM PERSONNEL;

DBMS_OUTPUT.PUT_LINE('nombre de personnes =' || v_nbPersonnes || '       ' || 'nombre de jongleurs =' || v_nbJongleurs || 'proportion de jongleurs =' || v_pourcentage);


END;


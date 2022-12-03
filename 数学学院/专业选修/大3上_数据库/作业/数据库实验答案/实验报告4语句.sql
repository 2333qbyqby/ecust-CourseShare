Create database xscj
use xscj
goCREATE TABLE xsqk(ѧ�� CHAR(6) NOT NULL,���� CHAR(8) NOT NULL,�Ա� BIT NOT NULL DEFAULT 1,���� SMALLDATETIME NOT NULL,רҵ CHAR(10) NOT NULL,
����ϵ CHAR(10) NOT NULL,
��ϵ�绰 CHAR(11),
��ѧ�� TINYINT,
��ע TEXT,CONSTRAINT PK_XSQK_XH PRIMARY KEY(ѧ��),CONSTRAINT UQ_XSQK_DH UNIQUE(����),CONSTRAINT CK_XSQK_XB CHECK(�Ա�=1 or �Ա�=0),CONSTRAINT CK_XSQK_DH CHECK(��ϵ�绰 LIKE '[1-9][1-9][1-9][1-9][1-9][1-9]'),CONSTRAINT CK_XSQK_ZXF CHECK(��ѧ��>=0 and ��ѧ��<=200))goCREATE TABLE KC
(���	INT IDENTITY,
�γ̺� CHAR(3) NOT NULL PRIMARY KEY(�γ̺�),
�γ��� CHAR(20) NOT NULL ,
�ڿν�ʦ CHAR(8),
����ѧ�� TINYINT NOT NULL DEFAULT 1,
ѧʱ TINYINT NOT NULL,
ѧ�� TINYINT,
CONSTRAINT CK_KC_XQ CHECK(����ѧ��>=1 AND ����ѧ��<=6)
)
GO 

CREATE TABLE XS_KC
(ѧ�� CHAR(6) NOT NULL REFERENCES XSQK(ѧ��),
�γ̺� CHAR(3) NOT NULL,
�ɼ� TINYINT CHECK(�ɼ�>=0 AND �ɼ�<=100),
ѧ�� TINYINT,
PRIMARY KEY(ѧ��,�γ̺�),
FOREIGN KEY(�γ̺�) REFERENCES KC(�γ̺�)
)
GO

insert into xsqk values
('122315','������',1,'1902-3-5','Ӧ����ѧ','��ѧϵ','626286',20,'����'),
('154320','������',0,'1902-7-25','Ӧ�û�ѧ','��ѧϵ','218837',22,NULL),
('135825','����v��',1,'1994-9-17','Ӧ������','����ϵ','243365',24,NULL),
('139093','dark��',0,'1996-5-7','Ӧ������','����ϵ','987655',25,NULL),
('187146','fan��',1,'1995-8-9','Ӣ��','Ӣ��ϵ','154558',22,NULL)
go

insert into KC values
('001','��ѧ','����һ��',1,40,6),
('002','ˤ��','��������',1,45,4),
('003','¯ʯ��˵','��������',3,36,5),
('004','XBOX','��������',4,41,5),
('101','0XFFFF','��������',5,40,5)
go

insert into XS_KC values 
('187146','002',40,5),
 ('122315','001',85,6),
 ('122315','002',90,4),
 ('154320','001',80,6),
 ('135825','003',86,5),
 ('139093','004',98,5),
 ('187146','003',78,5),
 ('187146','004',75,5),
 ('154320','101',90,5),
 ('135825','101',75,5),
 ('122315','101',80,5),
 ('122315','003',58,5),
 ('122315','004',56,5)
go

--���ܲ�ѯ��
--a.��KC���У�ͳ��ÿѧ�ڵ��ܷ���
select ����ѧ��,SUM(ѧ��) as ��ѧ�� 
from KC
group by ����ѧ��
go
--b.��XS_KC����ͳ��ÿ��ѧ����ѡ�޿γ̵�����select ѧ��,count(�γ̺�) as ѡ�޿γ�����from XS_KCgroup by ѧ��go--cͳ��KC���е���ѧ��
select sum(ѧ��) as ��ѧ��
from KC


--d������ѧ��ͳ��KC���и��ڵ�ѧ��
select ����ѧ��,sum(ѧ��) as ��ѧ��
from KCgroup by ����ѧ��go--e.��XS_KC���е����ݼ�¼��ѧ�ŷ�����ܣ����ѧ�ź�ƽ����select ѧ��,AVG(�ɼ�) as ƽ����from XS_KCgroup by ѧ��go--d.��ѯƽ���ִ���70��С��80��ѧ��ѧ�ź�ƽ����select ѧ��,avg(�ɼ�) as ƽ����from XS_KCgroup by ѧ��having AVG(�ɼ�)>70 and AVG(�ɼ�)<80go--e.��ѯXS_KC�����ѧ�š��γ̺š��ɼ�����ʹ��ѯ������Ȱ��տγ̺ŵ��������У�
-- ���γ̺���ͬʱ�ٰ��ճɼ��������У�������ѯ������浽�±�TEMP_KC��
select ѧ��,�γ̺�,�ɼ�into TEMP_KCfrom XS_KCORDER BY �γ̺� asc,�ɼ� descselect * from TEMP_KC--h.��ѯѡ���ˡ�101���γ̵�ѧ������߷ֺ���ͷ�select MAX(�ɼ�) as ��߷�,MIN(�ɼ�) as ��ͷ�from XS_KCgroup by �γ̺�having �γ̺�='101'--g.ͳ��ÿ��ѧ��������Ŀγ�����select ����ѧ��,count(�γ̺�) as �γ�����from KCgroup by ����ѧ��go--h.��ѯ��רҵ��ѧ������select count(ѧ��) as ѧ������,רҵfrom xsqkgroup by רҵ--------------------------���Ӳ�ѯ���Ӳ�ѯ


--a.��ѯ������ѧ����ѧ�š��γ������ڿν�ʦ������ѧ�ڵ���Ϣ
select ѧ��,�γ���,�ڿν�ʦ,����ѧ��
from KC,XS_KC
where �ɼ�<60 and KC.�γ̺�=XS_KC.�γ̺�

/*b.��ѧ�ŷ�������ָܷ���100��ѧ����¼�������ֵܷĽ�������*/
SELECT   ѧ��, SUM(�ɼ�) AS �ܷ�
FROM      XS_KC
GROUP BY ѧ��
HAVING   (SUM(�ɼ�) > 100)
ORDER BY �ܷ� DESC



--c.ʹ���Ӳ�ѯ��ǡ�������ſγ̲������ѧ����Ϣ
SELECT   ѧ��, ����, �Ա�, ����, רҵ, ����ϵ, ��ϵ�绰, ��ѧ��, ��ע
FROM      xsqk
WHERE   (ѧ�� IN
                    (SELECT   ѧ��
                     FROM      XS_KC
                     GROUP BY ѧ��
                     HAVING   (COUNT(�γ̺�) = 2)))

--d.ʹ���Ӳ�ѯ��ѯÿ�ſγ̵���߷ֵ�ѧ����¼
SELECT   a.ѧ��, a.�γ̺�, a.�ɼ�, a.ѧ��, xsqk.ѧ�� AS Expr1, xsqk.����, xsqk.�Ա�, xsqk.����, xsqk.רҵ, xsqk.����ϵ, 
                xsqk.��ϵ�绰, xsqk.��ѧ��, xsqk.��ע
FROM      XS_KC AS a INNER JOIN
                xsqk ON a.ѧ�� = xsqk.ѧ��
WHERE   (a.�ɼ� =
                    (SELECT   MAX(�ɼ�) AS Expr1
                     FROM      XS_KC AS b
                     WHERE   (a.ѧ�� = ѧ��)))
ORDER BY a.�γ̺�

--e.ʹ���Ӳ�ѯ��ѯÿ��ѧ������ͷֵĿ�

SELECT   ѧ��, �γ̺�, �ɼ�, ѧ��
FROM      XS_KC AS a
WHERE   (�ɼ� =
                    (SELECT   MIN(�ɼ�) AS Expr1
                     FROM      XS_KC AS b
                     WHERE   (a.ѧ�� = ѧ��)))


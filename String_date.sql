- SRING, DATE -

[루시와 엘라 찾기]
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
  FROM ANIMAL_INS
 WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty');

[이름에 el이 들어가는 동물 찾기]
  SELECT ANIMAL_ID
       , NAME
    FROM ANIMAL_INS
   WHERE NAME LIKE '%EL%'
     AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME

[중성화 여부 파악하기]
  SELECT ANIMAL_ID
       , NAME
       , CASE
              WHEN SEX_UPON_INTAKE LIKE '%Neutered%' OR 
                   SEX_UPON_INTAKE LIKE '%Spayed%'
              THEN 'O'
              ELSE 'X'
         END
    FROM ANIMAL_INS
ORDER BY ANIMAL_ID;

[오랜 기간 보호한 동물(2)]
SELECT A.ANIMAL_ID
     , A.NAME
  FROM ANIMAL_INS A
     , ANIMAL_OUTS B
 WHERE A.ANIMAL_ID = B.ANIMAL_ID 
ORDER BY B.DATETIME - A.DATETIME DESC
LIMIT 2;

[DATETIME에서 DATE로 형 변환]
  SELECT ANIMAL_ID
       , NAME
       , DATE_FORMAT(DATETIME, '%Y-%m-%d')
    FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
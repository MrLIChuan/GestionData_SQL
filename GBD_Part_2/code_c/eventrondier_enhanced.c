#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <my_global.h>
#include <mysql.h>

void finish_with_error(MYSQL *con)
{
  fprintf(stderr, "%s\n", mysql_error(con));
  mysql_close(con);
  exit(1);
}

MYSQL *open_connection()
{
  MYSQL *con = mysql_init(NULL);

  if (con == NULL)
  {
      fprintf(stderr, "mysql_init() failed\n");
      exit(1);
  }

  if (mysql_real_connect(con, "localhost", "rondier", "rondier2019",
          "rondier", 0, NULL, 0) == NULL)
  {
      finish_with_error(con);
  }
  return con;
}

void close_connection(MYSQL *con)
{
  mysql_close(con);
}

int perform_query(MYSQL *con,char *query)
{
  if (mysql_query(con, query))
  {
      finish_with_error(con);
  }
}


//fonction qui retourne la valeur recherchée pour une requête SELECT
int getOneId(MYSQL *con)
{
  MYSQL_RES *result = mysql_store_result(con);

  //si aucune ligne ne convient
  if (result == NULL)
  {
      finish_with_error(con);
  }

  int num_fields = mysql_num_fields(result);
  int num_rows = (int)mysql_num_rows(result);

  printf("num_rows=%d\n",num_rows);
  if (num_rows==0)
  {
      finish_with_error(con);
  }

  MYSQL_ROW row;
  int id;
  row = mysql_fetch_row(result);
  sscanf(row[0],"%d",&id);
  return id;
}


//fonction qui affiche le resultat d'une query
void print_results(MYSQL *con)
{
  MYSQL_RES *result = mysql_store_result(con);

  if (result == NULL)
  {
      finish_with_error(con);
  }

  int num_fields = mysql_num_fields(result);

  MYSQL_ROW row;
  int i;

  while ((row = mysql_fetch_row(result)))
  {
      for(i = 0; i < num_fields; i++)
      {
          printf("%s ", row[i] ? row[i] : "NULL");
      }
          printf("\n");
  }

}

void creer_model()
{}
void ajout_pp_model()
{}
void finir_model()
{}
void creer_instance()
{}
void ajout_pp_instance()
{}
void finir_instance()
{}



void gererDaemon(char *amac, char *uid, char *datetime, char *comments)
{
        printf("gererDaemon\n");

        /*
         * C'est la  que tout se passe.
         * C'est la  qu'il faut inserer du code qui accede a  la base de donnees
         */

	MYSQL *con=open_connection();

	/*
	 * On commence par essayer de retrouver l'indice du baton de batonrondier concerne
	 */

	char query1[200];
	sprintf(query1,"SELECT idbatonr_ondier FROM baton_rondier br where br.AdresseMAC=\"%s\"",amac);
	printf("query1=|%s|\n",query1);
	perform_query(con,query1);
	int idBaton=getOneId(con);
	printf("idBaton=%d\n",idBaton);

	/*
	 * On continue en essayant de retrouver l'indice du point de passage qui est tague
	 */

	char query2[200];
	sprintf(query2,"SELECT idPoint_de_passage FROM Point_de_passage pp where pp.tag=\"%s\"",uid);
	printf("query2=|%s|\n",query2);
	perform_query(con,query2);
	int idPointpassage=getOneId(con);
	printf("idPointpassage=%d\n",idPointpassage);


  //On cherche le type de tag 
  char query3[200];
  sprintf(query3,"SELECT pp.typ  FROM Point_de_passage pp  WHERE pp.tag =\"%s\"",uid);  //
  printf("query3=|%s|\n",query3);
  perform_query(con,query3); 
  char* type_tag = getOneId(con);
  printf("type_tag = %d\n",type_tag); 

  //Enfin, on veut le type de bâton
  char query4[200];
  sprintf(query4,"SELECT  br.Etat   FROM baton_rondier br  WHERE br.Adresse_MAC =\"%s\"",amac);  //requete sql
  printf("query4=|%s|\n",query4);
  perform_query(con,query4);
  char* etat_baton = getOneId(con);
  printf("etat_baton = %d\n",etat_baton);


  switch(type_tag)
  {
    case "chef" : 
    {
       if(etat_baton == "creation")
       {
        finir_model();
       }
      else if(etat_baton == "disponible")
      {
        creer_model();
      }
    }
    case "agent" : 
    {
      if(etat_baton == "disponible")
      {
        creer_instance();
      }
      else if(etat_baton == "instance")
      {
        finir_instance();
      }
    }

    case "oeuvre" : 
    {
      if(etat_baton == "disponible")
      {
        //erreur
      }
      else if(etat_baton == "instance")
      {
        ajout_pp_instance();
      }
      else if(etat_baton == "creation")
      {
        ajout_pp_model();
      }
    }

  }

	close_connection(con);
}

int readEventFile(int argc, char**argv)
{
	FILE *fic=fopen(argv[1],"r");
	char ligne[100];
	char dummy[100];

	if (fic==NULL)
	{
		printf("Impossible d'ouvrir le fichier events.txt\n");
		exit(1);
	}
	fgets(ligne,100,fic);
	while (!feof(fic))
	{
		ligne[strlen(ligne)-1]='\0';
		char *amac=strtok(ligne,",");
		char *uid=strtok(NULL,",");
		char *datetime=strtok(NULL,",");	
		char *comments=strtok(NULL,",");	
		printf("amac=|%s| uid=|%s| datetime=|%s| comments=|%s|\n",amac, uid, datetime, comments);
		gererDaemon(amac, uid, datetime, comments);

		getchar();

		fgets(ligne,100,fic);
	}

	return 0;
}

int main(int argc, char **argv)
{
	readEventFile(argc, argv);
	return 0;
}

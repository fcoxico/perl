# Trabalho de CLP 
#

use strict;
use warnings; 
use feature qw(switch);
use warnings;
no warnings 'experimental';


# Necessário instalar o módulo File:Slurp no windows ou no Linux	--------------------------
# Para instalar basta fazer cpan install File:Slurp no terminal do Perl		------------------
use File::Slurp qw(read_file write_file); 


# Nome do arquivo. O arquivo será criado na pasta documentos do windows	----------------------
my $meu_arquivo = "clientes.txt";



	INICIO: print("\n\tDigite 1 para criar um arquivo	\n\tDigite 2 para adicionar um cliente	\n\tDigite 3 para consultar um cliente	\n\tDigite 4 para modificar um cliente	\n\tDigite 5 para remover um cliente	\n\tDigite 6 para listar todos os clientes	\n\tDigite 7 para sair do programa\n\n");
	
	my $numero = <STDIN>;
	my $fecha=0;
 
given ($numero) {
   when ($numero =~ /^[1]+$/) {
   #Opção 1 - Criar um arquivo de clientes----------------------------------------------------
   
		# Usando a opção open para criar o arquivo.
		no warnings qw(once);
		if(open FILE, '>'.$meu_arquivo) {
		
			print "\nO arquivo foi criado com sucesso\n\n\n"
		} else {
		
			# Se não for possível criar um arquivo, uma mensagem de erro será exibida---------
			print "\nNão é possível criar um arquivo $meu_arquivo\n";
		}
		#Aguarda 2 segundos antes de passar para o próximo comando----------------------------
		sleep(2);
		
		#Comandos para limpar a tela----------------------------------------------------------
		system("clear"); 	#Limpar a tela do terminal no Linux
		system("cls");		#Limpar a tela do terminal no Windows
		
		#Vai para o inicio -------------------------------------------------------------------
		goto INICIO;
		
		
	}#Fim da opção número 1-------------------------------------------------------------------
	
   when ($numero =~ /^[2]+$/) {
   #Opção 2 - Adicionar um cliente------------------------------------------------------------
			
			
			LOOP:while (1)
			{
						print "\nDigite 1 para inserir um cliente e 9 para sair\n\n";
						no warnings qw(once);
						my $teclado = <>;
						chomp $teclado;
					
							if ($teclado =~ /^[9]+$/)
							{
								goto INICIO;	
							} 
							elsif($teclado =~ /^[1]+$/) 
							{
							
									# Adicionar um cliente no arquivo
									open FILE, '>>'.$meu_arquivo;
									
									
									print "Digite o nome do cliente: ";
									my $nome_cliente = <STDIN>; 
									chomp $nome_cliente;
									
									#Escreve o nome do cliente no arquivo---------------------
									print FILE $nome_cliente."\n";
									
									
									print "Deseja inserir um outro cliente? Digite 1 para sim e 9 para sair\n\n";
									if ($teclado =~ /^[9]+$/)
									{
										goto INICIO;	
									} 
									
									goto LOOP;
							} 
							else 
							{
								print "Voce digitou algo uma opcao invalida \n";	
								
								goto LOOP;
							}
						
					#Aguarda 2 segundos antes de passar para o próximo comando----------------
					sleep(2);
					

					#Volta para o inicio------------------------------------------------------	
					goto INICIO;
			}
   }#Fim da opção número 2--------------------------------------------------------------------
   
   when ($numero =~ /^[3]+$/) {
   #Opção 3 - Consultar um cliente------------------------------------------------------------
		open FILE, $meu_arquivo;
		
		my $saida = "sair";
		

			print "Digite o nome do cliente que voce quer buscar ou digite sair para voltar para o menu de inicio \n\n\n";
			no warnings qw(once);
			chomp(my $busca = <>);
			
			#---------------------------------------------------------------------------------
			
			#Percorre o arquivo e compara até encontrar o cliente
			#Caso encontre ele mostra a mensagem 
			
			#---------------------------------------------------------------------------------

				for (my $i=0;<FILE>;$i++) {

					if ($_ =~ m/$busca/){

					#Apaga os espaços em branco depois da palavra-----------------------------
					chomp $_;
					
						print "\nO(a) cliente(a) ",$busca," foi encontrado(a)\n";
						
						
						#Aguarda 2 segundos antes de passar para o próximo comando------------
						sleep(2);
		
						#Comandos para limpar a tela------------------------------------------
						system("clear"); 	#Limpar a tela do terminal no Linux
						system("cls");		#Limpar a tela do terminal no Windows
	   
						#Volta para o inicio--------------------------------------------------
						goto INICIO;
						
					} 
				} #Fim do for-----------------------------------------------------------------

						print "\nO(a) cliente(a) ",$busca," não foi encontrado(a)\n";
						
						#Volta para o inicio--------------------------------------------------
						goto INICIO;
							
				#Fecha o arquivo -------------------------------------------------------------			
				close FILE;


   }#Fim da opção número 3--------------------------------------------------------------------
   
   when ($numero =~ /^[4]+$/) {
   #Opção 4 - Modificar um cliente------------------------------------------------------------
   

		open (FILE, ">>$meu_arquivo");
		
		my $saida = "sair";
		my $continua = "1";
			

		while (1)
		{
			
			print "Digite 1 para modificar um cliente ou digite sair para voltar para o menu de inicio \n\n\n";
			no warnings qw(once);
			chomp(my $antiga = <>);
				
				if($antiga eq $saida) 
				{
			
					close FILE;
					
					#Volta para o inicio------------------------------------------------------
					goto INICIO;
			

				} 
					elsif ($antiga eq $continua) 
				{
			
					
					print "Digite o nome de um cliente para modificar \n\n\n";
					no warnings qw(once);
					chomp(my $antiga = <>);
					
					print "Agora digite qual e modificacao \n\n\n";
					no warnings qw(once);
					chomp(my $nova = <>);
			
						
			
							my $data = read_file($meu_arquivo);
							$data =~ s/$antiga/$nova/g;
							write_file $meu_arquivo, $data;
								
							#Aguarda 2 segundos antes de passar para o próximo comando------------
							sleep(2);	
							
							goto INICIO;
								
							
						
						
				}
				
				
		}#Fim do While------------------------------------------------------------------------
				
				#Fecha o arquivo -------------------------------------------------------------
				close FILE;
	   
					#Volta para o inicio------------------------------------------------------
					goto INICIO;
			
		
	   
   }#Fim da opção número 4--------------------------------------------------------------------
   
   
   
   when ($numero =~ /^[5]+$/) {
   #Opção 5 - Remover um cliente------------------------------------------------
       

		open (FILE, ">>$meu_arquivo");
		
		my $saida = "sair";
		my $continua = "1";
			

		while (1){
			
			print "Digite 1 para remover um cliente ou digite sair para voltar para o menu de inicio \n\n\n";
			no warnings qw(once);
			chomp(my $antiga = <>);
				
				if($antiga eq $saida) {
			
					close FILE;
					
					#Volta para o inicio------------------------------------------
					goto INICIO;
			

					} elsif ($antiga eq $continua) {
			
					
					print "Digite o nome de um cliente para remover \n\n\n";
					no warnings qw(once);
					chomp(my $antiga = <>);
			
					my $nova = "";
					
					
							my $data = read_file($meu_arquivo);
							$data =~ s/$antiga/$nova/g;
							write_file $meu_arquivo, $data;
							
							print "O cliente foi removido com sucesso";
								
							#Aguarda 2 segundos antes de passar para o próximo comando------------
							sleep(2);	
							
							goto INICIO;

						
						}#Fim do While
				}
				
				close FILE;
	   
			#Volta para o inicio--------------------------------------------------
			goto INICIO;
			
		
  
   }#Fim da opção número 5--------------------------------------------------------
   
   when ($numero =~ /^[6]+$/) {
   #Opção 6 - Listar todos os clientes--------------------------------------------
       	
		open FILE, $meu_arquivo;
		while (my $row = <FILE>) {
		chomp $row;
		print "$row\n";
		}
		
   }#Fim da opção número 6--------------------------------------------------------
   
   when ($numero =~ /^[7]+$/) {
   #Opção 7 - Sair do programa----------------------------------------------------
		
		exit;
		
   }#Fim da opção número 7--------------------------------------------------------
   
   default {
   
       print "Essa opcao nao existe. Escolha entre as opcoes de 1 a 7";
   
   }#Fim da opção número padrão---------------------------------------------------
   
   
}#Fim do arquivo------------------------------------------------------------------


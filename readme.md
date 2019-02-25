# Curso de REST com Spring Boot

Curso de RESTfull com Spring Boot.

## Projeto AlgaMoney-API

…or create a new repository on the command line

```bash
echo "# algamoney-api" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:carlosanders/algamoney-api.git
git push -u origin master
```

…or push an existing repository from the command line

```bash
git remote add origin git@github.com:carlosanders/algamoney-api.git
git push -u origin master
```

### Gerando o jar executável do projeto

Para gerar o **jar** executavel, basta adicionar na tag build do `pom.xml` o seguinte:

```xml
...
<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
			<!-- DEFINE O PLUGIN MAVEN RESPONSÁVEL POR COMPILAR O PROJETO SUA VERSÃO 
				E O JDK UTILIZADO -->
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<configuration>
					<archive>
						<!-- DEFINE QUAL É A CLASSE MAIN DA APLICAÇÃO -->
						<manifest>
							<addClasspath>true</addClasspath>
							<mainClass>com.algaworks.algamoney.api.AlgamoneyApiApplication</mainClass>
						</manifest>
					</archive>
				</configuration>
			</plugin>

		</plugins>
	</build>
```

**Fonte:**

*  [https://medium.com/@andgomes/maven-gerando-jars-execut%C3%A1veis-com-projetos-com-depend%C3%AAncias-5bcd022058ee](https://medium.com/@andgomes/maven-gerando-jars-execut%C3%A1veis-com-projetos-com-depend%C3%AAncias-5bcd022058ee)
* [http://www.semeru.com.br/blog/gerando-um-jar-com-as-dependencias-em-um-projeto-maven/](http://www.semeru.com.br/blog/gerando-um-jar-com-as-dependencias-em-um-projeto-maven/)

Executar o projeto pelo **bash**, desde que se tenha instalado no PATH o maven corretamente:

```bash
bryan@inspiron-3421:/codigo-fonte/workspace-sts-3.9.7/algamoney-api
$ mvn clean 
bryan@inspiron-3421:/codigo-fonte/workspace-sts-3.9.7/algamoney-api
$ mvn package 

# para rodar o jar basta:
$ java -jar algamoney-api-1.0.0.jar
# ou caso queira alterar algum parametro do resource
# ex.: alterar usuario/senha banco
$ java -jar algamoney-api-1.0.0.jar --spring.datasource.username=root --spring.datasource.password=root
```

Executar pela IDE Eclipse/STS:

![](wiki/img/01.png)

### Gerando o war a partir do jar

foi criado uma nova branch para contemplar as alterações no projeto para exportar um arquivo war.

* Nome da branch: **master-war**

Para o teste, foi preparado um container docker com o tomcat 8 instalado e copiado o projeto para este containerde modo a subir a vm e testar o projeto da API money.

```bash
# para criar um container docker com o java 8 e tomcat 8 instalado
# com base no arquivo "Dockerfile" dentro do diretório wiki
docker build -t=anders/tomcat8 .
# para rodar e compilar o container com as alterações, se "stopar" o container será apado, caso não queira remova a opcao "--rm"
docker run -it --rm --name=tomcat -d --publish=8080:8080 anders/tomcat8 /opt/tomcat/bin/catalina.sh run
# para vrf o container se está rodando
docker ps
# para copiar o projeto da API para o container
docker cp deploy/algamoney-api-1.0.0.war 61cf7bb33431:/opt/tomcat/webapps/money-api.war
# para vrf os logs do container
docker logs tomcat
```

**Fonte:**

* [https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#build-tool-plugins-maven-packaging](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#build-tool-plugins-maven-packaging)


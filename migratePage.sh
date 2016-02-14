#!/bin/bash

# Arguments, 1) date 2) page_name

if [ $# -ne 2 ] ; then
echo "invalid arguments"
exit 1
fi
if [ -d $1/$2 ] ; then
 echo "Directory already exists"
 exit 1
fi
mkdir -p $1/$2/src/blog
VM=$1/$2/src/blog/wordpress.vm
rm -f $VM
vi $VM
#sed -i '1i\$blog_header' $VM
echo '$blog_footer' >> $VM

sed -i 's/#/#[[#]]#/g' $VM

POM="$1/$2/pom.xml"
cat > $POM <<EEND
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.test</groupId>
  <artifactId>$2</artifactId>
  <version>$1</version>
  
    <pluginRepositories>
      <pluginRepository>
        <id>numberformat-releases</id>
        <url>https://github.com/numberformat/wordpress/tree/master/20130213/repo</url>
      </pluginRepository>
    </pluginRepositories>  
        
    <build>
        <plugins>
            <plugin>
                <groupId>github.numberformat</groupId>
                <artifactId>blog-plugin</artifactId>
                <version>1.0-SNAPSHOT</version>
                <configuration>
                <gitUrl>https://github.com/numberformat/wordpress/tree/master/\${project.version}/\${project.artifactId}</gitUrl>
                </configuration>
            <executions>
              <execution>
                <id>1</id>
                <phase>site</phase>
                <goals>
                  <goal>generate</goal>
                </goals>
              </execution>
            </executions>
            </plugin>
        </plugins>
    </build>
      
</project>
EEND

cd $1/$2/
mvn blog:generate
cd -
echo "blog page sent to `pwd`/out.html"
cat $1/$2/target/blog/wordpress.html > out.html

FROM quay.io/drsylent/cubix/block2/homework-base:java21

# Beállítom a nevem címkének. A címke kulcs része a cubix.homework.owner
LABEL cubix.homework.owner=BalassaViktor

# Itt sexy környezeti változókat definiálok, amiket a feladat kért.
ENV CUBIX_HOMEWORK=BalassaViktor
ENV APP_DEFAULT_MESSAGE=

# A mappa, amibe bele kell majd pattintani a jar-t
RUN mkdir /opt/app && chown 1001 -R /opt/app 

# user 1001-ez használom, hogy ne legyek gyökér
USER 1001

# Beállítom a munka mappát a /opt/app-ra, amibe dolgozzon a docker és bemásolom oda a 
# azt a jar-t, amit a paraméter alapján megtalálok
WORKDIR /opt/app
COPY --chown=1001 ./target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
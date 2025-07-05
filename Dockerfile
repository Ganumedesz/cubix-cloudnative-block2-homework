FROM quay.io/drsylent/cubix/block2/homework-base:java21

# Ide pakolom bele majd, hogy az FE vagy a BE mappából szipázza ki a jar-t.
ARG APP_TYPE

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
COPY --chown=1001 ./"${APP_TYPE}"/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
# Ha nincs olyan mappa, akkor szívás van, de MVP-re lőttem ezzel :) 
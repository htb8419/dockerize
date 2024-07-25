FROM keycloak/keycloak:24.0.5

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

COPY ./providers /opt/keycloak/providers
COPY ./themes /opt/keycloak/themes
COPY ./kc-start.sh /opt/keycloak

#RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/kc-start.sh"]
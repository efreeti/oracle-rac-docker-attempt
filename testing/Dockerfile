FROM oraclelinux:7-slim

ENV SETUP_LINUX_FILE="setupLinuxEnv.sh" \
    SETUP_USERS_FILE="setupUsers.sh" \
    RUN_FILE="run.sh" \
    INSTALL_DIR=/opt/scripts

ENV  INSTALL_SCRIPTS=$INSTALL_DIR/install \
     PATH=/bin:/usr/bin:/sbin:/usr/sbin:$PATH \
     SCRIPT_DIR=$INSTALL_DIR/startup

COPY $SETUP_LINUX_FILE $SETUP_USERS_FILE $INSTALL_DIR/install/

COPY $RUN_FILE $INSTALL_DIR/startup/

RUN chmod 755 $INSTALL_DIR/install/*.sh && \
    sync && \
    $INSTALL_DIR/install/$SETUP_LINUX_FILE && \
    $INSTALL_DIR/install/$SETUP_USERS_FILE && \
    rm -rf $INSTALL_DIR/install && \
    rm -f $INSTALL_DIR/install/*  && \
    chmod 755 $SCRIPT_DIR/*.sh && \
    sync

USER oracle

CMD exec $SCRIPT_DIR/$RUN_FILE
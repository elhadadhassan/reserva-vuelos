package com.example.reservaVuelos.config;

import com.example.reservaVuelos.entities.audit.Revision;
import org.hibernate.envers.RevisionListener;

public class CustomRevisionListener implements RevisionListener {
    @Override
    public void newRevision(Object revisionEntity) {
        Revision revision = (Revision) revisionEntity;
    }
}

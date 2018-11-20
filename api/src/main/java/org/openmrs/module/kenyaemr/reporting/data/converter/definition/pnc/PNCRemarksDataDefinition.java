package org.openmrs.module.kenyaemr.reporting.data.converter.definition.pnc;

import org.openmrs.module.reporting.data.BaseDataDefinition;
import org.openmrs.module.reporting.data.encounter.definition.EncounterDataDefinition;
import org.openmrs.module.reporting.definition.configuration.ConfigurationPropertyCachingStrategy;
import org.openmrs.module.reporting.evaluation.caching.Caching;

/**
 * PNC remarks Column
 */
@Caching(strategy=ConfigurationPropertyCachingStrategy.class)
public class PNCRemarksDataDefinition extends BaseDataDefinition implements EncounterDataDefinition {

    public static final long serialVersionUID = 1L;

    /**
     * Default Constructor
     */
    public PNCRemarksDataDefinition() {
        super();
    }

    /**
     * Constructor to populate name only
     */
    public PNCRemarksDataDefinition(String name) {
        super(name);
    }

    //***** INSTANCE METHODS *****

    /**
     * @see org.openmrs.module.reporting.data.DataDefinition#getDataType()
     */
    public Class<?> getDataType() {
        return Double.class;
    }
}
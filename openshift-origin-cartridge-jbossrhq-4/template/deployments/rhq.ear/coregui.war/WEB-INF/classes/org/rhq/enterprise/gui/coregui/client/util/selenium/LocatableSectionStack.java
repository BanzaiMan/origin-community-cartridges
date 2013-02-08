package org.rhq.enterprise.gui.coregui.client.util.selenium;

import com.smartgwt.client.widgets.layout.SectionStack;

/**
 * Wrapper for com.smartgwt.client.widgets.layout.SectionStack that sets the ID for use with selenium scLocators.
 * 
 * @author Jay Shaughnessy
 */
public class LocatableSectionStack extends SectionStack implements Locatable {

    private String locatorId;

    /** 
     * <pre>
     * ID Format: "simpleClassname_locatorId"
     * </pre>
     * @param locatorId not null or empty.
     */
    public LocatableSectionStack(String locatorId) {
        super();
        this.locatorId = locatorId;
        SeleniumUtility.setID(this, locatorId);
    }

    public String getLocatorId() {
        return locatorId;
    }

    public String extendLocatorId(String extension) {
        return this.locatorId + "_" + extension;
    }

    // NOTE: It seems SectionStack does not need the sort of destroy() override that other Layout superclasses
    //       need.  The section cleanup seems sufficient on baseWidget destroy, and further attempts to remove
    //       members explicitly may cause issues.
}

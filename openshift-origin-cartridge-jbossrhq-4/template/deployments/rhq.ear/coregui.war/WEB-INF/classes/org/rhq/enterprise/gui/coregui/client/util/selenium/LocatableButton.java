package org.rhq.enterprise.gui.coregui.client.util.selenium;

import com.smartgwt.client.widgets.Button;

/**
 * Wrapper for com.smartgwt.client.widgets.Button that sets the ID for use with selenium scLocators.
 * 
 * @author Jay Shaughnessy
 */
public class LocatableButton extends Button {

    /** 
     * <pre>
     * ID Format: "simpleClassname_locatorId"
     * </pre>
     * @param locatorId not null or empty.
     */
    public LocatableButton(String locatorId, String title) {
        super(title);
        SeleniumUtility.setID(this, locatorId);
    }

}

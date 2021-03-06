/*
 * PoliceClearancePage.java
 *
 * Created on December 10, 2013, 10:47 AM
 */

package com.rameses.gov.police.policeclearance;

import com.rameses.osiris2.themes.FormPage;
import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author  rameses
 */

@StyleSheet
@Template(FormPage.class)
public class PhysicalInfoPage extends javax.swing.JPanel {
    
    /** Creates new form PoliceClearancePage */
    public PhysicalInfoPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel5 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel18 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xLabel7 = new com.rameses.rcp.control.XLabel();
        xLabel8 = new com.rameses.rcp.control.XLabel();
        xLabel9 = new com.rameses.rcp.control.XLabel();
        xLabel10 = new com.rameses.rcp.control.XLabel();
        xLabel15 = new com.rameses.rcp.control.XLabel();
        jPanel3 = new javax.swing.JPanel();
        xPhoto1 = new com.rameses.rcp.control.XPhoto();
        xCamera1 = new com.rameses.rcp.control.XCamera();
        jPanel4 = new javax.swing.JPanel();
        formPanel5 = new com.rameses.rcp.util.FormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        jPanel1 = new javax.swing.JPanel();
        xPhoto2 = new com.rameses.rcp.control.XPhoto();
        xPhoto3 = new com.rameses.rcp.control.XPhoto();
        xFingerPrint1 = new com.rameses.rcp.control.XFingerPrint();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("  Personal Information   ");
        jPanel5.setBorder(xTitledBorder1);

        com.rameses.rcp.control.border.XLineBorder xLineBorder1 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder1.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel18.setBorder(xLineBorder1);
        xLabel18.setCaption("Name");
        xLabel18.setCaptionWidth(85);
        xLabel18.setDepends(new String[] {"entity.person"});
        xLabel18.setExpression("#{entity.person.lastname}, #{entity.person.firstname} #{entity.person.middlename? entity.person.middlename: ''}");
        xLabel18.setName("");
        xLabel18.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xLabel18);

        com.rameses.rcp.control.border.XLineBorder xLineBorder2 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder2.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel4.setBorder(xLineBorder2);
        xLabel4.setCaption("Address");
        xLabel4.setCaptionWidth(85);
        xLabel4.setDepends(new String[] {"entity.person"});
        xLabel4.setExpression("#{entity.person.address}");
        xLabel4.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xLabel4);

        com.rameses.rcp.control.border.XLineBorder xLineBorder3 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder3.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel6.setBorder(xLineBorder3);
        xLabel6.setCaption("Birth Date");
        xLabel6.setCaptionWidth(85);
        xLabel6.setDepends(new String[] {"entity.person"});
        xLabel6.setExpression("#{entity.person.birthdate}");
        xLabel6.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel1.add(xLabel6);

        com.rameses.rcp.control.border.XLineBorder xLineBorder4 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder4.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel7.setBorder(xLineBorder4);
        xLabel7.setCaption("Birth Place");
        xLabel7.setCaptionWidth(85);
        xLabel7.setDepends(new String[] {"entity.person"});
        xLabel7.setExpression("#{entity.person.birthplace}");
        xLabel7.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xLabel7);

        com.rameses.rcp.control.border.XLineBorder xLineBorder5 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder5.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel8.setBorder(xLineBorder5);
        xLabel8.setCaption("Gender");
        xLabel8.setCaptionWidth(85);
        xLabel8.setDepends(new String[] {"entity.person"});
        xLabel8.setExpression("#{entity.person.gender}");
        xLabel8.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel1.add(xLabel8);

        com.rameses.rcp.control.border.XLineBorder xLineBorder6 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder6.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel9.setBorder(xLineBorder6);
        xLabel9.setCaption("Citizenship");
        xLabel9.setCaptionWidth(85);
        xLabel9.setDepends(new String[] {"entity.person"});
        xLabel9.setExpression("#{entity.person.citizenship}");
        xLabel9.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xLabel9);

        com.rameses.rcp.control.border.XLineBorder xLineBorder7 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder7.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel10.setBorder(xLineBorder7);
        xLabel10.setCaption("Civil Status");
        xLabel10.setCaptionWidth(85);
        xLabel10.setDepends(new String[] {"entity.person"});
        xLabel10.setExpression("#{entity.person.civilstatus}");
        xLabel10.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xLabel10);

        com.rameses.rcp.control.border.XLineBorder xLineBorder8 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder8.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel15.setBorder(xLineBorder8);
        xLabel15.setCaption("Occupation");
        xLabel15.setCaptionWidth(85);
        xLabel15.setDepends(new String[] {"entity.person"});
        xLabel15.setExpression("#{entity.person.profession}");
        xLabel15.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xLabel15);

        jPanel3.setLayout(null);

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "  Profile Photo  ", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12)));
        jPanel3.setOpaque(false);
        xPhoto1.setName("entity.person.photo.image");
        jPanel3.add(xPhoto1);
        xPhoto1.setBounds(15, 30, 120, 100);

        xCamera1.setHandler("cameraHandler");
        xCamera1.setName("btnCapturePhoto");
        xCamera1.setText("Capture");
        jPanel3.add(xCamera1);
        xCamera1.setBounds(15, 135, 120, 23);

        org.jdesktop.layout.GroupLayout jPanel5Layout = new org.jdesktop.layout.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 474, Short.MAX_VALUE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 153, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel5Layout.createSequentialGroup()
                .add(jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 195, Short.MAX_VALUE)
                    .add(jPanel5Layout.createSequentialGroup()
                        .add(1, 1, 1)
                        .add(jPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 181, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        jPanel4.setLayout(null);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("  Physical Attributes      ");
        jPanel4.setBorder(xTitledBorder2);

        xTextField1.setCaption("Height");
        xTextField1.setCaptionWidth(85);
        xTextField1.setName("entity.person.height");
        xTextField1.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel5.add(xTextField1);

        xTextField2.setCaption("Weight");
        xTextField2.setCaptionWidth(85);
        xTextField2.setName("entity.person.weight");
        xTextField2.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel5.add(xTextField2);

        xTextField3.setCaption("Eye color");
        xTextField3.setCaptionWidth(85);
        xTextField3.setName("entity.person.eyecolor");
        xTextField3.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel5.add(xTextField3);

        xTextField4.setCaption("Hair color");
        xTextField4.setCaptionWidth(85);
        xTextField4.setName("entity.person.haircolor");
        xTextField4.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel5.add(xTextField4);

        jPanel4.add(formPanel5);
        formPanel5.setBounds(10, 25, 345, 155);

        jPanel1.setLayout(null);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "  Fingerprints  ", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12)));
        jPanel1.setOpaque(false);
        xPhoto2.setFont(new java.awt.Font("Arial", 1, 10));
        xPhoto2.setName("entity.person.fingerprint.leftthumb.image");
        jPanel1.add(xPhoto2);
        xPhoto2.setBounds(30, 40, 120, 100);

        xPhoto3.setFont(new java.awt.Font("Arial", 1, 10));
        xPhoto3.setName("entity.person.fingerprint.rightthumb.image");
        jPanel1.add(xPhoto3);
        xPhoto3.setBounds(160, 40, 120, 100);

        xFingerPrint1.setHandler("thumbprintHandler");
        xFingerPrint1.setName("btnCaptureThumbMark");
        xFingerPrint1.setText("Capture");
        jPanel1.add(xFingerPrint1);
        xFingerPrint1.setBounds(30, 145, 71, 23);

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Left Thumb");
        jPanel1.add(jLabel1);
        jLabel1.setBounds(30, 25, 115, 14);

        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setText("Right Thumb");
        jPanel1.add(jLabel2);
        jLabel2.setBounds(160, 25, 115, 14);

        jPanel4.add(jPanel1);
        jPanel1.setBounds(340, 6, 305, 180);

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel5, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(33, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel5, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 199, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(32, 32, 32))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel5;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private com.rameses.rcp.control.XCamera xCamera1;
    private com.rameses.rcp.control.XFingerPrint xFingerPrint1;
    private com.rameses.rcp.control.XLabel xLabel10;
    private com.rameses.rcp.control.XLabel xLabel15;
    private com.rameses.rcp.control.XLabel xLabel18;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XLabel xLabel7;
    private com.rameses.rcp.control.XLabel xLabel8;
    private com.rameses.rcp.control.XLabel xLabel9;
    private com.rameses.rcp.control.XPhoto xPhoto1;
    private com.rameses.rcp.control.XPhoto xPhoto2;
    private com.rameses.rcp.control.XPhoto xPhoto3;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    // End of variables declaration//GEN-END:variables
    
}
